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
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.concurrent.ConcurrentHashMap;

@WebServlet(name = "ServletRimuoviPlanimetria", value = "/RimuoviPlanimetria")
public class ServletRimuoviPlanimetria extends HttpServlet {

    private GalleriaModelDM galleriaModelDM = new GalleriaModelDM();
    private PlanimetriaModelDM planimetriaModelDM = new PlanimetriaModelDM();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        int idAppartamento = Integer.parseInt(request.getParameter("idAppartamento"));
        String valore = request.getParameter("eliminati");
        boolean eliminato = false;
        // Creating array of string length
        char[] ch = new char[valore.length()];
        String risultato = "";
        int count=valore.length();

        // Copy character by character into array
        if(valore.equals("")){
            out.print("false");
        }
        else {
            valore = valore +" ";
            for (int i = 0; i < valore.length(); i++) {
                char c = valore.charAt(i);
                if(Character.isDigit(c)){
                    risultato = risultato + c;
                    count--;
                }
                if(!Character.isDigit(c) || Character.isWhitespace(c)){
                    planimetriaModelDM.doDeletePlanimetria(risultato);
                    eliminato = true;
                    risultato = "";
                    count--;
                }
            }
            ArrayList<VisualizzazioneMultimedia> listaPlanimetria = new ArrayList<VisualizzazioneMultimedia>();
            ArrayList<VisualizzazioneMultimedia> multimedia = new ArrayList<VisualizzazioneMultimedia>();
            try {
                listaPlanimetria = galleriaModelDM.doRetrieveVisualizzazionePlanimetria(idAppartamento);
                for(int i=0; i<listaPlanimetria.size(); i++){
                    if(listaPlanimetria.get(i).fotoString != null){
                        multimedia.add(listaPlanimetria.get(0));
                    }
                }


            } catch (Exception e) {
                e.printStackTrace();
            }
            request.setAttribute("idAppartamento",idAppartamento);
            request.setAttribute("lista-planimetria",multimedia);
            if(eliminato == true){
                out.print("true");
            }
            else{
                out.print("false");
            }
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
