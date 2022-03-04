package control.agente;

import UtilityClass.Mail;
import model.agente.AgenteBean;
import model.agente.AgenteModelDM;
import model.utente.UtenteBean;
import model.utente.UtenteModelDM;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ServletMail", value = "/ServletMail")
public class ServletMail extends HttpServlet {
    private static final long serialVersionUID = 1L;
    /**
     * Servletrecupero password.
     */
    private AgenteModelDM modelAgente = new AgenteModelDM();
    private UtenteModelDM modelUtent = new UtenteModelDM();

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AgenteBean agente = new AgenteBean();
        UtenteBean utenteBean = new UtenteBean();
        request.setCharacterEncoding("UTF-8");
        String nomeGuest = request.getParameter("nomeGuest");
        String emailGuest = request.getParameter("emailGuest");
        String telefonoGuest = request.getParameter("telefonoGuest");
        String messaggioGuest = request.getParameter("messaggioGuest");
        String contenuto="Nome Mittente: "+nomeGuest+"\nEmail Mittente: "+emailGuest+"\nTelefono Mittente: "+telefonoGuest+"\n\n"+messaggioGuest;
        try {
            agente = modelAgente.RetrieveAgenteById(Integer.parseInt(request.getParameter("agenteid")));
            utenteBean = modelUtent.doRetrieveUtenteByKey(agente.getIdUtente());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            Mail.sendMail(utenteBean.getEmail(), contenuto);
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("agente.jsp?id=");

    }
}
