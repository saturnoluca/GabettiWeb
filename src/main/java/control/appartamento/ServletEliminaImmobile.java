package control.appartamento;

import model.appartamento.AppartamentoModelDM;
import model.utente.UtenteBean;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ServletEliminaImmobile", value = "/ServletEliminaImmobile")
public class ServletEliminaImmobile extends HttpServlet {
    AppartamentoModelDM appartamentoModelDM = new AppartamentoModelDM();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UtenteBean utenteBean =(UtenteBean) request.getSession().getAttribute("utente");
        if(!utenteBean.getRuolo().equals("Admin")){
            request.getSession().invalidate();
            response.sendRedirect("login.jsp");
        }
        int id = Integer.parseInt(request.getParameter("idImmobile"));
        try {
            appartamentoModelDM.OrderByData();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.getSession().removeAttribute("entrato");
        response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/gestone-lista-immobile.jsp"));
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
