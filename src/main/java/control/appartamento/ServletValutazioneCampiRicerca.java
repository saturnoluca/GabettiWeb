package control.appartamento;

import UtilityClass.Città;
import model.appartamento.AppartamentoModel;
import model.appartamento.AppartamentoModelDM;
import model.indirizzo.IndirizzoModelDM;
import org.checkerframework.checker.units.qual.A;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "ServletValutazioneCampiRicerca", value = "/ValutazioneCampiRicerca")
public class ServletValutazioneCampiRicerca extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().removeAttribute("postoAuto");
        request.getSession().removeAttribute("regioni");
        request.getSession().removeAttribute("camereLetto");
        request.getSession().removeAttribute("bagni");
        request.getSession().removeAttribute("categorie");
        request.getSession().removeAttribute("allCittaZone");

        ArrayList<String> allCittà = new ArrayList<String>();
        IndirizzoModelDM indirizzoModelDM = new IndirizzoModelDM();
        AppartamentoModelDM appartamentoModelDM = new AppartamentoModelDM();
        ArrayList<Città> allCittàZone = new ArrayList<Città>();
        ArrayList<String> regioni = new ArrayList<String>();
        ArrayList<String> categorie = new ArrayList<String>();
        ArrayList<String> camereLetto = new ArrayList<String>();
        ArrayList<String> bagni = new ArrayList<String>();
        ArrayList<String> postoAuto = new ArrayList<String>();
        allCittà = indirizzoModelDM.RetrieveAllCittà();
        allCittàZone = indirizzoModelDM.RetrieveAllCittàZone(allCittà);
        regioni = indirizzoModelDM.RetrieveAllRegioni();
        camereLetto = appartamentoModelDM.RetrieveNumeroCamereLetto();
        bagni = appartamentoModelDM.RetrieveNumeroBagni();
        categorie = appartamentoModelDM.RetrieveAllTipoAppartamento();
        postoAuto = appartamentoModelDM.RetrieveNumeroPostoAuto();

        request.getSession().setAttribute("postoAuto", postoAuto);
        request.getSession().setAttribute("regioni", regioni);
        request.getSession().setAttribute("camereLetto", camereLetto);
        request.getSession().setAttribute("bagni", bagni);
        request.getSession().setAttribute("categorie", categorie);
        request.getSession().setAttribute("allCittaZone", allCittàZone);
        RequestDispatcher rd = request.getRequestDispatcher("/" + request.getSession().getAttribute("nomepagina"));
        rd.forward(request, response);
    }
}
