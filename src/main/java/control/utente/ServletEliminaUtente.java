package control.utente;

import model.utente.UtenteBean;
import model.utente.UtenteModelDM;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "ServletEliminaUtente", value = "/ServletEliminaUtente")
public class ServletEliminaUtente extends HttpServlet {
    UtenteModelDM utenteModel = new UtenteModelDM();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UtenteBean utenteBean =(UtenteBean) request.getSession().getAttribute("utente");
        if(!utenteBean.getRuolo().equals("Admin")){
            request.getSession().invalidate();
            response.sendRedirect("login.jsp");
        }
        int id = Integer.parseInt(request.getParameter("idUtente"));
        ArrayList<UtenteBean> utenti = null;
        try {
            utenteModel.doDelete(id);
            utenti = new ArrayList<UtenteBean>();
            utenti = (ArrayList<UtenteBean>) utenteModel.doRetrieveAll();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.getSession().removeAttribute("lista-utenti");
        request.getSession().setAttribute("lista-utenti",utenti);
        request.getSession().removeAttribute("entrato");
        response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/lista-utenti.jsp"));
    }
}
