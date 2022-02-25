package control.agente;

import UtilityClass.CompositeKeyAgenteCase;
import model.agente.AgenteBean;
import model.agente.AgenteModelDM;
import model.appartamento.AppartamentoBean;
import model.utente.UtenteBean;
import model.utente.UtenteModelDM;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ServletAgentiPage", value = "/ServletAgentiPage")
public class ServletAgentiPage extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static AgenteModelDM modelAgenti = new AgenteModelDM();
    private static UtenteModelDM modelUtente = new UtenteModelDM();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<UtenteBean> utente = new ArrayList<UtenteBean>();
        ArrayList<CompositeKeyAgenteCase> agentiCase= new ArrayList<CompositeKeyAgenteCase>();

        try {
            if (request.getSession().getAttribute("NoDbConnection") != null) {
                modelAgenti = null;
                modelUtente = null;
            }
            agentiCase = (ArrayList<CompositeKeyAgenteCase>) modelAgenti.RetrieveAgenteCase();
            utente = (ArrayList<UtenteBean>) modelUtente.doRetrieveAll();
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("utente", utente);
        request.setAttribute("agentiCase", agentiCase);
        RequestDispatcher rd = request.getRequestDispatcher("/agenti.jsp");
        rd.forward(request, response);
    }

}
