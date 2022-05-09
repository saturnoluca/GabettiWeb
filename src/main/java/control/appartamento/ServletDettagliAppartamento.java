package control.appartamento;

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
import java.lang.reflect.Array;
import java.util.ArrayList;

@WebServlet(name = "ServletDettagliAppartamento", value = "/ServletDettagliAppartamento")
@MultipartConfig
public class ServletDettagliAppartamento extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static AppartamentoModelDM modelApp = new AppartamentoModelDM();
    private static AgenteModelDM modelAgenti = new AgenteModelDM();
    private static UtenteModelDM modelUtente = new UtenteModelDM();
    private static IndirizzoModelDM modelIndirizzo = new IndirizzoModelDM();
    private static MultimediaModelDM modelMultimedia = new MultimediaModelDM();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt((request.getParameter("id")));
        AppartamentoBean appBean = new AppartamentoBean();
        AgenteBean agenteBean = new AgenteBean();
        UtenteBean utenteBean = new UtenteBean();
        IndirizzoBean indirizzoBean = new IndirizzoBean();
        MultimediaBean multimediaBean = new MultimediaBean();
        ArrayList<AppartamentoBean> array = new ArrayList<AppartamentoBean>();
        ArrayList<MultimediaBean> allMulti = new ArrayList<MultimediaBean>();
        try {
            if (request.getSession().getAttribute("NoDbConnection") != null) {
                modelApp = null;
                modelAgenti = null;
                modelUtente = null;
                modelIndirizzo = null;
                modelMultimedia = null;
            }
            appBean = modelApp.RetrieveById(id);
            agenteBean = modelAgenti.RetrieveAgenteById(appBean.getIdAgente());
            utenteBean = modelUtente.doRetrieveUtenteByKeyAgente(agenteBean.getIdUtente());
            indirizzoBean = modelIndirizzo.RetrieveIndirizzoByAppId(appBean.getIdAppartamento());
            multimediaBean.setFotoString(modelMultimedia.doRetrieveFoto(appBean.getIdAppartamento()));
            multimediaBean.setVideoString(modelMultimedia.doRetrieveVideo(appBean.getIdAppartamento()));
            multimediaBean.setPlanimetriaString(modelMultimedia.doRetrievePlanimetria(appBean.getIdAppartamento()));
            array =(ArrayList<AppartamentoBean>) modelApp.OrderByVisite();
            allMulti=modelMultimedia.RetrieveAllMultimedia();
            VisualizzazioneImmobile visualizzazione = new VisualizzazioneImmobile();
            ArrayList<AppartamentoBean> ordinamento = (ArrayList<AppartamentoBean>) modelApp.OrderByVisite();
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
            visualizzazione.setFoto(modelMultimedia.doRetrieveFoto(ordinamento.get(0).getIdAppartamento()).get(0));
            modelApp.AggiungiVisualizzazione(id);
            request.setAttribute("appartamento", appBean);
            request.setAttribute("agente", agenteBean);
            request.setAttribute("utente", utenteBean);
            request.setAttribute("indirizzo", indirizzoBean);
            request.setAttribute("multimedia", multimediaBean);
            request.setAttribute("visite", array);
            request.setAttribute("allMulti", allMulti);
            request.setAttribute("featured",visualizzazione);
            RequestDispatcher rd = request.getRequestDispatcher("/dettagliappartamento.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }


    }

}
