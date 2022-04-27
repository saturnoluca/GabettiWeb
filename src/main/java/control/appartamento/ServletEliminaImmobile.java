package control.appartamento;

import model.appartamento.AppartamentoBean;
import model.appartamento.AppartamentoModelDM;
import model.utente.UtenteBean;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "ServletEliminaImmobile", value = "/ServletEliminaImmobile")
public class ServletEliminaImmobile extends HttpServlet {
    AppartamentoModelDM appartamentoModelDM = new AppartamentoModelDM();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UtenteBean utenteBean = (UtenteBean) request.getSession().getAttribute("utente");
        if (!utenteBean.getRuolo().equals("Admin")) {
            request.getSession().invalidate();
            response.sendRedirect("login.jsp");
        }
        int id = Integer.parseInt(request.getParameter("idImmobile"));
        ArrayList<AppartamentoBean> immobili = null;
        appartamentoModelDM.doDelete(id);
        immobili = new ArrayList<AppartamentoBean>();
        immobili = (ArrayList<AppartamentoBean>) appartamentoModelDM.OrderByData();
        request.getSession().removeAttribute("lista-immobili");
        request.getSession().setAttribute("lista-immobilli", immobili);
        request.getSession().removeAttribute("entrato");
        response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/gestione-lista-immobili.jsp"));
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
