package control.multimedia;

import UtilityClass.VisualizzazioneMultimedia;
import model.galleria.GalleriaModelDM;
import model.multimedia.MultimediaBean;
import model.multimedia.MultimediaModelDM;
import model.planimetria.PlanimetriaModelDM;
import org.json.JSONObject;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.concurrent.ConcurrentHashMap;

@WebServlet(name = "VisualizzaPlanimetria", value = "/VisualizzaPlanimetria")
public class VisualizzaPlanimetria extends HttpServlet {

    private PlanimetriaModelDM planimetriaModelDM = new PlanimetriaModelDM();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("idPlanimetria");

        byte[] pdf = planimetriaModelDM.doRetrievePdf(Integer.parseInt(id));

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition","inline");
        response.setContentLength(pdf.length);
        OutputStream outputStream = response.getOutputStream();
        outputStream.write(pdf);
        outputStream.flush();
        RequestDispatcher rd = request.getRequestDispatcher("pdf.jsp");
    }
}
