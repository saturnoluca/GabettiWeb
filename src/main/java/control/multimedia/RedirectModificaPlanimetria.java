package control.multimedia;

import UtilityClass.VisualizzazioneMultimedia;
import model.galleria.GalleriaBean;
import model.galleria.GalleriaModelDM;
import model.multimedia.MultimediaBean;
import model.multimedia.MultimediaModelDM;
import model.planimetria.PlanimetriaBean;
import model.planimetria.PlanimetriaModelDM;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "RedirectModificaPlanimetria", value = "/RedirectModificaPlanimetria")
@MultipartConfig
public class RedirectModificaPlanimetria extends HttpServlet {
    private static MultimediaModelDM multimediaModelDM = new MultimediaModelDM();
    private static GalleriaModelDM galleriaModelDM = new GalleriaModelDM();
    private static PlanimetriaModelDM planimetriaModelDM = new PlanimetriaModelDM();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idAppartamento = Integer.parseInt(request.getParameter("idAppartamento"));

        String redirect = "";
        ArrayList<VisualizzazioneMultimedia> listaPlanimetria = new ArrayList<VisualizzazioneMultimedia>();
        try {
            listaPlanimetria = galleriaModelDM.doRetrieveVisualizzazionePlanimetria(idAppartamento);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("lista " + listaPlanimetria.size());
        request.setAttribute("idAppartamento", idAppartamento);
        request.setAttribute("lista-planimetria", listaPlanimetria);
        redirect = "/modifica-immobile-planimetria.jsp";
        RequestDispatcher rd = request.getRequestDispatcher(redirect);
        rd.forward(request, response);
        return;
    }
}
