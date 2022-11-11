package control.appartamento;

import model.appartamento.AppartamentoBean;
import model.appartamento.AppartamentoModelDM;
import model.multimedia.MultimediaBean;
import model.multimedia.MultimediaModelDM;
import model.utente.UtenteBean;
import model.utente.UtenteModelDM;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;

import static java.lang.Float.parseFloat;
import static java.lang.Integer.parseInt;

@WebServlet(name = "RedirectAggiungiAppartamento", value = "/RedirectAggiungiAppartamento")
@MultipartConfig
public class RedirectAggiungiAppartamento extends HttpServlet {

    private UtenteModelDM utenteModelDM = new UtenteModelDM();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<UtenteBean> utentiRuolo = new ArrayList<UtenteBean>();
        utentiRuolo = (ArrayList<UtenteBean>) utenteModelDM.doRetrieveByRole();
        request.setAttribute("utentiRuolo",utentiRuolo);

        RequestDispatcher rd = request.getRequestDispatcher("/aggiungi-immobile-admin.jsp");
        rd.forward(request, response);
    }

}
