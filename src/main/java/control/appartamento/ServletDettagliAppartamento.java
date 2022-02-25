package control.appartamento;

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
            request.setAttribute("appartamento", appBean);
            request.setAttribute("agente", agenteBean);
            request.setAttribute("utente", utenteBean);
            request.setAttribute("indirizzo", indirizzoBean);
            request.setAttribute("multimedia", multimediaBean);
            RequestDispatcher rd = request.getRequestDispatcher("/dettagliappartamento.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }


    }

}
