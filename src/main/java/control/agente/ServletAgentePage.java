package control.agente;

import UtilityClass.CompositeKeyAgenteCase;
import UtilityClass.VisualizzazioneImmobile;
import model.agente.AgenteBean;
import model.agente.AgenteModelDM;
import model.appartamento.AppartamentoBean;
import model.appartamento.AppartamentoModelDM;
import model.indirizzo.IndirizzoBean;
import model.indirizzo.IndirizzoModelDM;
import model.multimedia.MultimediaBean;
import model.multimedia.MultimediaModelDM;
import model.utente.UtenteBean;
import model.utente.UtenteModelDM;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "ServletAgentePage", value = "/ServletAgentePage")
@MultipartConfig
public class ServletAgentePage extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static AgenteModelDM modelAgenti = new AgenteModelDM();
    private static UtenteModelDM modelUtente = new UtenteModelDM();
    private static AppartamentoModelDM appartamentoModelDM = new AppartamentoModelDM();
    private static IndirizzoModelDM indirizzoModelDM = new IndirizzoModelDM();
    private static MultimediaModelDM multimediaModelDM = new MultimediaModelDM();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        UtenteBean utenteBean = new UtenteBean();
        AgenteBean agenteBean = new AgenteBean();
        ArrayList<AppartamentoBean> arrayAppartamento = new ArrayList<AppartamentoBean>();
        ArrayList<IndirizzoBean> arrayIndirizzo = new ArrayList<IndirizzoBean>();
        ArrayList<MultimediaBean> arrayMultimedia = new ArrayList<MultimediaBean>();
        ArrayList<CompositeKeyAgenteCase> agenteCase = new ArrayList<CompositeKeyAgenteCase>();
        ArrayList<AppartamentoBean> inEvidenza = new ArrayList<AppartamentoBean>();
        VisualizzazioneImmobile visualizzazione = new VisualizzazioneImmobile();
        agenteBean = modelAgenti.RetrieveAgenteByIdUtente(id);
        utenteBean = modelUtente.doRetrieveUtenteByKeyAgente(agenteBean.getIdUtente());
        arrayAppartamento = (ArrayList<AppartamentoBean>) appartamentoModelDM.RetrieveAllByAgente(agenteBean.getIdAgente());
        arrayIndirizzo = (ArrayList<IndirizzoBean>) indirizzoModelDM.RetrieveAll();
        arrayMultimedia = multimediaModelDM.RetrieveAllMultimedia();
        agenteCase = (ArrayList<CompositeKeyAgenteCase>) modelAgenti.RetrieveAgenteCase();
        inEvidenza = (ArrayList<AppartamentoBean>) appartamentoModelDM.OrderByVisiteByAgente(agenteBean.getIdAgente());
        ArrayList<AppartamentoBean> ordinamento = (ArrayList<AppartamentoBean>) appartamentoModelDM.OrderByVisite();
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
        visualizzazione.setFoto(multimediaModelDM.doRetrieveFoto(ordinamento.get(0).getIdAppartamento()).get(0));

        request.setAttribute("featured",visualizzazione);
        request.setAttribute("agente", agenteBean);
        request.setAttribute("utente", utenteBean);
        request.setAttribute("arrayAppartamento", arrayAppartamento);
        request.setAttribute("arrayIndirizzo", arrayIndirizzo);
        request.setAttribute("arrayMultimedia", arrayMultimedia);
        request.setAttribute("agenteCase", agenteCase);
        request.setAttribute("inEvidenza", inEvidenza);
        RequestDispatcher rd = request.getRequestDispatcher("/agente.jsp");
        rd.forward(request, response);
    }

}
