package control.appartamento;

import UtilityClass.Città;
import model.indirizzo.IndirizzoModelDM;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "ServletValutazioneCampiRicerca", value = "/ServletValutazioneCampiRicerca")
public class ServletValutazioneCampiRicerca extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<String> allCittà = new ArrayList<String>();
        IndirizzoModelDM indirizzoModelDM = new IndirizzoModelDM();
        ArrayList<Città> allCittàZone = new ArrayList<Città>();
        try {
            allCittà=indirizzoModelDM.RetrieveAllCittà();
            allCittàZone=indirizzoModelDM.RetrieveAllCittàZone(allCittà);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("allCittaZone", allCittàZone);
        RequestDispatcher rd = request.getRequestDispatcher("/valutazione.jsp");
        rd.forward(request, response);
    }
}
