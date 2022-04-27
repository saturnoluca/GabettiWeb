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
            if(request.getParameter("usernameUtente").length()==0){
                utenteBean.setUsername(utenteBean.getUsername());
            }
            else{
                utenteBean.setUsername(request.getParameter("usernameUtente"));
            }
            if(request.getParameter("emailUtente").length()==0){
                utenteBean.setEmail(utenteBean.getEmail());
            }
            else{
                utenteBean.setEmail(request.getParameter("emailUtente"));
            }
            if(request.getParameter("nomeUtente").length()==0){
                utenteBean.setNome(utenteBean.getNome());
            }
            else{
                utenteBean.setNome(request.getParameter("nomeUtente"));
            }
            if(request.getParameter("cognomeUtente").length()==0){
                utenteBean.setCognome(utenteBean.getCognome());
            }
            else{
                utenteBean.setCognome(request.getParameter("cognomeUtente"));
            }
            if(request.getParameter("passwordUtente").length()==0){
                utenteBean.setPassword(utenteBean.getPassword());
            }
            else{
                utenteBean.setPassword(request.getParameter("passwordUtente"));
            }
            System.out.println("Nuovo utente " + utenteBean);
            utente.doUpdateInformazioniUtente(utenteBean);

        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.getSession().removeAttribute("utente");
        request.getSession().setAttribute("utente", utenteBean);
        RequestDispatcher rd = request.getRequestDispatcher("/myprofile.jsp");
        rd.forward(request, response);
    }
}
