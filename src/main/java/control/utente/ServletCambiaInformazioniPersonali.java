package control.utente;

import model.agente.AgenteBean;
import model.utente.UtenteBean;
import model.utente.UtenteModelDM;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ServletCambiaInformazioniPersonali", value = "/ServletCambiaInformazioniPersonali")
public class ServletCambiaInformazioniPersonali extends HttpServlet {

    UtenteModelDM utente = new UtenteModelDM();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UtenteBean utenteBean = new UtenteBean();
        int idUtente = Integer.parseInt(request.getParameter(("idUtente")));
        try {
            utenteBean = utente.doRetrieveUtenteByKey(idUtente);
            System.out.println("Vecchio utente " + utenteBean);
            utenteBean.setUsername(request.getParameter("usernameUtente"));
            utenteBean.setEmail(request.getParameter("emailUtente"));
            utenteBean.setNome(request.getParameter("nomeUtente"));
            utenteBean.setCognome(request.getParameter("cognomeUtente"));
            utenteBean.setPassword(request.getParameter("passwordUtente"));
            System.out.println("Nuovo utente " + utenteBean);
            utente.doUpdate(utenteBean);

        } catch (SQLException e) {
            e.printStackTrace();
        }

        RequestDispatcher rd = request.getRequestDispatcher("/myprofile.jsp");
        rd.forward(request, response);
    }
}
