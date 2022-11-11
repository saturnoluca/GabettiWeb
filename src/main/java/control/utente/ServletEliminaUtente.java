package control.utente;

import model.utente.UtenteBean;
import model.utente.UtenteModelDM;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "ServletEliminaUtente", value = "/EliminaUtente")
public class ServletEliminaUtente extends HttpServlet {
    UtenteModelDM utenteModel = new UtenteModelDM();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String inviata;
        UtenteBean utenteBean = (UtenteBean) request.getSession().getAttribute("utente");
        int id = Integer.parseInt(request.getParameter("idUtente"));
        ArrayList<UtenteBean> utenti = null;
        utenteModel.doDelete(id);
        inviata = "ok";
        utenti = new ArrayList<UtenteBean>();
        utenti = (ArrayList<UtenteBean>) utenteModel.doRetrieveAll();
        request.getSession().setAttribute("inviata",inviata);
        request.setAttribute("lista-utenti", utenti);
        request.getSession().removeAttribute("entrato");
        response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/lista-utenti.jsp"));
    }
}
