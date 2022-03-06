package control.appartamento;

import UtilityClass.CompositeKeyAgenteCase;
import model.agente.AgenteBean;
import model.agente.AgenteModelDM;
import model.appartamento.AppartamentoBean;
import model.appartamento.AppartamentoModelDM;
import model.indirizzo.IndirizzoBean;
import model.indirizzo.IndirizzoModelDM;
import model.utente.UtenteBean;
import model.utente.UtenteModelDM;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "IndexServlet", value = "/IndexServlet")
public class IndexServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static AppartamentoModelDM modelApp = new AppartamentoModelDM();
    private static AgenteModelDM modelAgenti = new AgenteModelDM();
    private static UtenteModelDM modelUtente = new UtenteModelDM();
    private static IndirizzoModelDM modelIndirizzo= new IndirizzoModelDM();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<AppartamentoBean> appartamenti = new ArrayList<AppartamentoBean>();
        ArrayList<AgenteBean> agenti = new ArrayList<AgenteBean>();
        ArrayList<UtenteBean> utente = new ArrayList<UtenteBean>();
        ArrayList<IndirizzoBean> indirizzi = new ArrayList<IndirizzoBean>();
        ArrayList<CompositeKeyAgenteCase> agenteCase = new ArrayList<CompositeKeyAgenteCase>();

        try {
            if (request.getSession().getAttribute("NoDbConnection") != null) {
                modelApp = null;
                modelAgenti = null;
                modelUtente = null;
                modelIndirizzo = null;
            }
            appartamenti = (ArrayList<AppartamentoBean>) modelApp.OrderByVisite();
            agenti = (ArrayList<AgenteBean>) modelAgenti.RetrieveAgente();
            utente = (ArrayList<UtenteBean>) modelUtente.doRetrieveAll();
            indirizzi = (ArrayList<IndirizzoBean>) modelIndirizzo.RetrieveAll();
            agenteCase = (ArrayList<CompositeKeyAgenteCase>) modelAgenti.RetrieveAgenteCase();
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("utente", utente);
        request.setAttribute("agenti", agenti);
        request.setAttribute("appartamenti", appartamenti);
        request.setAttribute("indirizzi", indirizzi);
        request.setAttribute("agenteCase", agenteCase);
        RequestDispatcher rd = request.getRequestDispatcher("/FinalIndex.jsp");
        rd.forward(request, response);

    }
}
