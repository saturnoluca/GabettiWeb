package control.appartamento;

import model.agente.AgenteBean;
import model.agente.AgenteModelDM;
import model.appartamento.AppartamentoBean;
import model.appartamento.AppartamentoModelDM;
import model.galleria.GalleriaModelDM;
import model.multimedia.MultimediaBean;
import model.multimedia.MultimediaModelDM;
import model.utente.UtenteBean;
import model.utente.UtenteModelDM;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ServletListaImmobili", value = "/ListaImmobili")
@MultipartConfig
public class ServletListaImmobili extends HttpServlet {
    private static AppartamentoModelDM appartamentoModelDM = new AppartamentoModelDM();
    private static UtenteModelDM utenteModelDM = new UtenteModelDM();
    private static AgenteModelDM agenteModelDM = new AgenteModelDM();
    private static GalleriaModelDM galleriaModelDM = new GalleriaModelDM();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<AppartamentoBean> appartamenti = new ArrayList<AppartamentoBean>();
        ArrayList<UtenteBean> utenti = new ArrayList<UtenteBean>();
        ArrayList<AgenteBean> agenti = new ArrayList<AgenteBean>();
        ArrayList<MultimediaBean> multimedia = new ArrayList<MultimediaBean>();
        try {
            appartamenti = (ArrayList<AppartamentoBean>) appartamentoModelDM.RetrieveAllAppartamento();
            utenti = (ArrayList<UtenteBean>) utenteModelDM.doRetrieveAll();
            agenti = (ArrayList<AgenteBean>) agenteModelDM.RetrieveAgente();
            multimedia = galleriaModelDM.RetrieveAll(appartamenti);
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.getSession().setAttribute("lista-immobili", appartamenti);
        request.getSession().setAttribute("lista-utenti-immobili", utenti);
        request.getSession().setAttribute("agenti-immobili", agenti);
        request.getSession().setAttribute("multimedia-immobili", multimedia);
        request.getSession().setAttribute("entrato-immobili", "si");
        response.sendRedirect("gestione-lista-immobili.jsp");
    }
}
