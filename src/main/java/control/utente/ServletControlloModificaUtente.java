package control.utente;

import model.utente.UtenteBean;
import model.utente.UtenteModelDM;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ServletControlloModificaUtente", value = "/ServletControlloModificaUtente")
public class ServletControlloModificaUtente extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idUtente = Integer.parseInt(request.getParameter(("idUtente")));
        UtenteModelDM utenteModelDM = new UtenteModelDM();
        UtenteBean utenteBean = new UtenteBean();
        utenteBean = utenteModelDM.doRetrieveUtenteByKeyAgente(idUtente);

        request.setAttribute("utenteDaModificare", utenteBean);
        RequestDispatcher rd = request.getRequestDispatcher("/modifica-utente.jsp");
        rd.forward(request, response);
    }
}
