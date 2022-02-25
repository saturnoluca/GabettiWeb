package control.appartamento;

import model.agente.AgenteBean;
import model.agente.AgenteModelDM;
import model.appartamento.AppartamentoBean;
import model.appartamento.AppartamentoModelDM;
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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<AppartamentoBean> appartamenti = new ArrayList<AppartamentoBean>();
        ArrayList<AgenteBean> agenti = new ArrayList<AgenteBean>();
        ArrayList<UtenteBean> utente = new ArrayList<UtenteBean>();

        try {
            if (request.getSession().getAttribute("NoDbConnection") != null) {
                modelApp = null;
                modelAgenti = null;
                modelUtente = null;
            }
            appartamenti = (ArrayList<AppartamentoBean>) modelApp.OrderByVisite();
            agenti = (ArrayList<AgenteBean>) modelAgenti.RetrieveAgente();
            utente = (ArrayList<UtenteBean>) modelUtente.doRetrieveAll();
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("utente", utente);
        request.setAttribute("agenti", agenti);
        request.setAttribute("appartamenti", appartamenti);
        RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
        rd.forward(request, response);

    }
}
