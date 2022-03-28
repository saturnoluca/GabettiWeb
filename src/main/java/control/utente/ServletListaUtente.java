package control.utente;

import model.utente.UtenteBean;
import model.utente.UtenteModelDM;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "ServletListaUtente", value = "/ServletListaUtente")
public class ServletListaUtente extends HttpServlet {
    UtenteModelDM utenteModel = new UtenteModelDM();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<UtenteBean> utente = new ArrayList<UtenteBean>();
        try {
            utente = (ArrayList<UtenteBean>) utenteModel.doRetrieveAll();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.getSession().setAttribute("lista-utenti", utente);
        request.getSession().setAttribute("entrato", "si");
        request.getRequestDispatcher("lista-utenti.jsp").forward(request, response);
    }

}
