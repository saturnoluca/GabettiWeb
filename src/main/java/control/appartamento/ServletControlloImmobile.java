package control.appartamento;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
//Servlet per controllare il tipo di utente che accede alla pagina di lista immobili
@WebServlet(name = "ServletControlloImmobile", value = "/ServletControlloImmobile")
public class ServletControlloImmobile extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
