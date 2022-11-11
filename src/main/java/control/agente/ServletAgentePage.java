package control.agente;

import UtilityClass.CompositeKeyAgenteCase;
import UtilityClass.VisualizzazioneImmobile;
import model.agente.AgenteBean;
import model.agente.AgenteModelDM;
import model.appartamento.AppartamentoBean;
import model.appartamento.AppartamentoModelDM;
import model.galleria.GalleriaModelDM;
import model.indirizzo.IndirizzoBean;
import model.indirizzo.IndirizzoModelDM;
import model.multimedia.MultimediaBean;
import model.utente.UtenteBean;
import model.utente.UtenteModelDM;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ServletAgentePage", value = "/AgentePage")
@MultipartConfig
public class ServletAgentePage extends HttpServlet {
    private static final long serialVersionUID = 1L;


    private static AgenteModelDM modelAgenti = new AgenteModelDM();
    private static UtenteModelDM modelUtente = new UtenteModelDM();
    private static AppartamentoModelDM appartamentoModelDM = new AppartamentoModelDM();
    private static IndirizzoModelDM indirizzoModelDM = new IndirizzoModelDM();
    private static GalleriaModelDM galleriaModelDM = new GalleriaModelDM();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        UtenteBean utenteBean = new UtenteBean();
        AgenteBean agenteBean = new AgenteBean();
        ArrayList<AppartamentoBean> arrayList = new ArrayList<AppartamentoBean>();
        ArrayList<IndirizzoBean> arrayIndirizzo = new ArrayList<IndirizzoBean>();
        ArrayList<MultimediaBean> arrayMultimedia = new ArrayList<MultimediaBean>();
        ArrayList<CompositeKeyAgenteCase> agenteCase = new ArrayList<CompositeKeyAgenteCase>();
        ArrayList<AppartamentoBean> inEvidenza = new ArrayList<AppartamentoBean>();
        VisualizzazioneImmobile visualizzazione = new VisualizzazioneImmobile();
        utenteBean = modelUtente.doRetrieveUtenteByKey(id);
        agenteBean = modelAgenti.RetrieveAgenteByIdUtente(id);
        if( agenteBean.getLinkFacebook() == null || agenteBean.getLinkFacebook().equals("")){
            agenteBean.setLinkFacebook(null);
        }
        if(agenteBean.getLinkInstagram() == null || agenteBean.getLinkInstagram().equals("")){
            agenteBean.setLinkInstagram(null);
        }
        arrayList = (ArrayList<AppartamentoBean>) appartamentoModelDM.RetrieveAllByAgente(agenteBean.getIdAgente());

        ArrayList<VisualizzazioneImmobile> immobili = new ArrayList<VisualizzazioneImmobile>();
        for(int i=0;i<arrayList.size(); i++){
            VisualizzazioneImmobile v = new VisualizzazioneImmobile();
            IndirizzoBean indirizzo = indirizzoModelDM.RetrieveIndirizzoByAppId(arrayList.get(i).getIdAppartamento());
            AgenteBean agent = modelAgenti.RetrieveAgenteById(arrayList.get(i).getIdAgente());
            UtenteBean utente = modelUtente.doRetrieveUtenteByKey(agenteBean.getIdUtente());
            v.setIdAppartamento(arrayList.get(i).getIdAppartamento());
            v.setCategoria(arrayList.get(i).getCategoria());
            v.setNomeAppartamento(arrayList.get(i).getNomeAppartamento());
            v.setDescrizioneAppartamento(arrayList.get(i).getDescrizioneAppartamento());
            v.setSuperficie(arrayList.get(i).getSuperficie());
            v.setBagni(arrayList.get(i).getBagni());
            v.setVisualizzaPrezzo(arrayList.get(i).getVisualizzaPrezzo());
            v.setTipoVendita(arrayList.get(i).getTipoVendita());
            v.setPrezzo(arrayList.get(i).getPrezzo());
            v.setCamereLetto(arrayList.get(i).getCamereLetto());
            v.setIdUtente(utenteBean.getIdUtente());
            v.setNomeAgente(utenteBean.getNome());
            v.setCognomeAgente(utenteBean.getCognome());
            v.setIndirizzoBean(indirizzo);
            v.setFoto(galleriaModelDM.doRetrieveFoto(arrayList.get(i).getIdAppartamento(),1));
            immobili.add(v);
        }

        request.setAttribute("agente", agenteBean);


        arrayIndirizzo = (ArrayList<IndirizzoBean>) indirizzoModelDM.RetrieveAll();
        arrayMultimedia = galleriaModelDM.RetrieveAllMultimedia();
        agenteCase = (ArrayList<CompositeKeyAgenteCase>) modelAgenti.RetrieveAgenteCase();
        inEvidenza = (ArrayList<AppartamentoBean>) appartamentoModelDM.OrderByVisiteByAgente(agenteBean.getIdAgente());
        ArrayList<AppartamentoBean> ordinamento = (ArrayList<AppartamentoBean>) appartamentoModelDM.OrderByVisite();
        IndirizzoBean indirizzo = indirizzoModelDM.RetrieveIndirizzoByAppId(ordinamento.get(0).getIdAppartamento());
        visualizzazione.setIdAppartamento(ordinamento.get(0).getIdAppartamento());
        visualizzazione.setTipoVendita(ordinamento.get(0).getTipoVendita());
        visualizzazione.setNomeAppartamento(ordinamento.get(0).getNomeAppartamento());
        visualizzazione.setDescrizioneAppartamento(ordinamento.get(0).getDescrizioneAppartamento());
        visualizzazione.setSuperficie(ordinamento.get(0).getSuperficie());
        visualizzazione.setBagni(ordinamento.get(0).getBagni());
        visualizzazione.setCamereLetto(ordinamento.get(0).getCamereLetto());
        visualizzazione.setData(ordinamento.get(0).getData());
        visualizzazione.setPrezzo(ordinamento.get(0).getPrezzo());
        visualizzazione.setVisualizzaPrezzo(ordinamento.get(0).getVisualizzaPrezzo());
        visualizzazione.setIndirizzoBean(indirizzo);
        visualizzazione.setFoto(galleriaModelDM.doRetrieveFoto(ordinamento.get(0).getIdAppartamento(),1));

        request.setAttribute("featured",visualizzazione);

        request.setAttribute("utente", utenteBean);
        request.setAttribute("arrayAppartamento", immobili);
        request.setAttribute("arrayIndirizzo", arrayIndirizzo);
        request.setAttribute("arrayMultimedia", arrayMultimedia);
        request.setAttribute("agenteCase", agenteCase);
        request.setAttribute("inEvidenza", inEvidenza);
        RequestDispatcher rd = request.getRequestDispatcher("/agente.jsp");
        rd.forward(request, response);
    }

}
