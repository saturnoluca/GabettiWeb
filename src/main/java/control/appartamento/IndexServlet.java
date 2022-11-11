package control.appartamento;

import UtilityClass.CompositeKeyAgenteCase;
import model.agente.AgenteBean;
import model.agente.AgenteModelDM;
import model.appartamento.AppartamentoBean;
import model.appartamento.AppartamentoModelDM;
import model.galleria.GalleriaModelDM;
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

@WebServlet(name = "IndexServlet", value = "/Index")
@MultipartConfig
public class IndexServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static AppartamentoModelDM modelApp = new AppartamentoModelDM();
    private static AgenteModelDM modelAgenti = new AgenteModelDM();
    private static UtenteModelDM modelUtente = new UtenteModelDM();
    private static IndirizzoModelDM modelIndirizzo= new IndirizzoModelDM();
    private static GalleriaModelDM modelMultimedia = new GalleriaModelDM();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<AppartamentoBean> appartamenti = new ArrayList<AppartamentoBean>();
        ArrayList<AppartamentoBean> appartamentiData = new ArrayList<AppartamentoBean>();
        ArrayList<AgenteBean> agenti = new ArrayList<AgenteBean>();
        ArrayList<UtenteBean> utente = new ArrayList<UtenteBean>();
        ArrayList<IndirizzoBean> indirizzi = new ArrayList<IndirizzoBean>();
        ArrayList<CompositeKeyAgenteCase> agenteCase = new ArrayList<CompositeKeyAgenteCase>();
        ArrayList<MultimediaBean> multimedia = new ArrayList<MultimediaBean>();

        try {
            if (request.getSession().getAttribute("NoDbConnection") != null) {
                modelApp = null;
                modelAgenti = null;
                modelUtente = null;
                modelIndirizzo = null;
                modelMultimedia=null;
            }
            appartamenti = (ArrayList<AppartamentoBean>) modelApp.OrderByVisite();
            appartamentiData = (ArrayList<AppartamentoBean>) modelApp.OrderByData();
            agenti = (ArrayList<AgenteBean>) modelAgenti.RetrieveAgente();
            utente = (ArrayList<UtenteBean>) modelUtente.doRetrieveAll();
            indirizzi = (ArrayList<IndirizzoBean>) modelIndirizzo.RetrieveAll();
            agenteCase = (ArrayList<CompositeKeyAgenteCase>) modelAgenti.RetrieveAgenteCase();
            multimedia = (ArrayList<MultimediaBean>) modelMultimedia.RetrieveAllMultimedia();
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("utente", utente);
        request.setAttribute("agenti", agenti);
        request.setAttribute("appartamenti", appartamenti);
        request.setAttribute("appartamentiData", appartamentiData);
        request.setAttribute("indirizzi", indirizzi);
        request.setAttribute("agenteCase", agenteCase);
        request.setAttribute("multimedia", multimedia);
        request.getSession().setAttribute("inviata","no");
        RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
        rd.forward(request, response);
    }
}
