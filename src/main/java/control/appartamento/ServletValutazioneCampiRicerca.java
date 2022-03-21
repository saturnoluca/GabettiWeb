package control.appartamento;

import UtilityClass.Città;
import model.appartamento.AppartamentoModel;
import model.appartamento.AppartamentoModelDM;
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
        AppartamentoModelDM appartamentoModelDM = new AppartamentoModelDM();
        ArrayList<Città> allCittàZone = new ArrayList<Città>();
        ArrayList<String> categorie = new ArrayList<String>();
        try {
            allCittà = indirizzoModelDM.RetrieveAllCittà();
            allCittàZone = indirizzoModelDM.RetrieveAllCittàZone(allCittà);
            categorie = appartamentoModelDM.RetrieveAllTipoAppartamento();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("categorie", categorie);
        request.setAttribute("allCittaZone", allCittàZone);
        RequestDispatcher rd = request.getRequestDispatcher("/valutazione.jsp");
        rd.forward(request, response);
    }
}
