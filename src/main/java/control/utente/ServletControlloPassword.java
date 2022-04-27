package control.utente;

import model.utente.UtenteBean;
import model.utente.UtenteModelDM;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "ServletControlloPassword", value = "/ServletControlloPassword")
public class ServletControlloPassword extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        UtenteModelDM model = new UtenteModelDM();
        String email = request.getParameter("email");
        String password = request.getParameter("Password");
        UtenteBean utente = null;
            utente = model.RetrieveByEmail(email);
            if(utente.getIdUtente() == 0){
                out.print("false");
            }
            else if ((utente.getPassword()).equals(password)) {
                out.print("true");
            }
    }
}
