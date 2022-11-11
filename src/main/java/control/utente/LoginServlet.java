package control.utente;

import UtilityClass.CompositeKeyAgenteCase;
import model.agente.AgenteBean;
import model.agente.AgenteModelDM;
import model.appartamento.AppartamentoModelDM;
import model.utente.UtenteBean;
import model.utente.UtenteModelDM;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "LoginServlet", value = "/Login")
@MultipartConfig
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UtenteModelDM utenteModel = new UtenteModelDM();
        request.setCharacterEncoding("UTF-8");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("Password");
        UtenteBean bean = new UtenteBean();
        String redirect = "";
        ArrayList<UtenteBean> array = new ArrayList<UtenteBean>();
        bean = utenteModel.RetrieveByUsername(username);
        array = (ArrayList<UtenteBean>) utenteModel.doRetrieveAll();
        if (bean.getIdUtente() != 0) {
            if (bean.getRuolo().equals("Admin")) {
                request.getSession(true).setAttribute("utente", bean);
                redirect = "myprofile.jsp";
            } else if (bean.getRuolo().equals("Agente") || bean.getRuolo().equals("Collaboratore")) {
                request.getSession(true).setAttribute("utente", bean);
                AgenteBean agente = new AgenteBean();
                CompositeKeyAgenteCase appartamenti = new CompositeKeyAgenteCase();
                AgenteModelDM agenteModelDM = new AgenteModelDM();
                AppartamentoModelDM appartamentoModelDM = new AppartamentoModelDM();
                agente = agenteModelDM.RetrieveAgenteByIdUtente(bean.getIdUtente());
                appartamenti =  agenteModelDM.RetrieveAgenteCase(agente.getIdAgente());
                appartamenti.setBean(agente);
                request.getSession(true).setAttribute("appartamenti", appartamenti);
                request.getSession(true).setAttribute("agente", agente);
                redirect = "myprofile.jsp";
            } else if (bean.getRuolo().equals("Segretario")) {
                request.getSession(true).setAttribute("utente", bean);
                redirect = "myprofile.jsp";
            }
        } else {
            throw new IllegalArgumentException("L'accesso non va a buon fine poichè"
                    + " il campo password è errato");
        }
        response.sendRedirect(redirect);
    }


}
