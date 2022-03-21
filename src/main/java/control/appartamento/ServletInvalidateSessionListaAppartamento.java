package control.appartamento;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletInvalidateSessionListaAppartamento", value = "/ServletInvalidateSessionListaAppartamento")
public class ServletInvalidateSessionListaAppartamento extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        // Invalidate the session and removes any attribute related to it
        session.invalidate();

        // Get an HttpSession related to this request, if no session exist don't
        // create a new one. This is just a check to see after invalidation the
        // session will be null.
        session = request.getSession(false);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("ServletListaAppartamenti");
        requestDispatcher.forward(request, response);

    }
}
