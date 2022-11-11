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
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

@WebServlet(name = "ServletMultimediaAggiunta", value = "/MultimediaAggiunta")
@MultipartConfig
public class ServletMultimediaAggiunta extends HttpServlet {
    private static MultimediaModelDM multimediaModelDM = new MultimediaModelDM();
    private static GalleriaModelDM galleriaModelDM = new GalleriaModelDM();
    private static PlanimetriaModelDM planimetriaModelDM = new PlanimetriaModelDM();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idAppartamento = Integer.parseInt(request.getParameter("idAppartamento"));
        String azione = request.getParameter("azione");

        String modificaPlanimetria = request.getParameter("modificaPla");
        String redirect="";
        String inviata = "no";
        if(azione.equals("foto")){
            String modificaImg = request.getParameter("modifica-Img");
            GalleriaBean galleria = new GalleriaBean();
            galleria.setIdAppartamento(idAppartamento);
            String valore  = request.getParameter("valore");
            int copertina =0;
            if(modificaImg == null){
                copertina = Integer.parseInt(request.getParameter("copertina"));
            }
            for(int i = 1; i <= Integer.parseInt(valore); i++){
                String s = "foto-"+i;
                if(i == copertina){
                    galleria.setCopertina(1);
                }
                else{
                    galleria.setCopertina(0);
                }
                galleria.setFoto(request.getPart(s));
                try{
                    galleriaModelDM.doSaveFoto(galleria);
                }catch (Exception e){
                    e.printStackTrace();
                }
            }
            if(modificaImg == null){
                request.setAttribute("idAppartamento", idAppartamento);
                redirect = "/aggiungi-immobile-planimetria.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(redirect);
                rd.forward(request, response);
                return;
            }
            else if(modificaImg.equals("modifica-Img")) {
                ArrayList<VisualizzazioneMultimedia> listaFoto = new ArrayList<VisualizzazioneMultimedia>();
                try {
                    inviata = "ok";
                    listaFoto = galleriaModelDM.doRetrieveVisualizzazioneMultimedia(idAppartamento);

                } catch (Exception e) {
                    e.printStackTrace();
                }
                request.getSession().setAttribute("inviata",inviata);
                request.setAttribute("idAppartamento", idAppartamento);
                request.setAttribute("lista-foto", listaFoto);
                redirect = "/modifica-immobile-galleria.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(redirect);
                rd.forward(request, response);
                return;
            }

        }else if(azione.equals("video")){
            ArrayList<Part> video = new ArrayList<Part>();
            video.add(request.getPart("video"));
            MultimediaBean multi = new MultimediaBean();
            multi.setIdAppartamento(idAppartamento);
            multi.setVideo(video);
            try{
                multimediaModelDM.doSaveVideo(multi);
            }catch (Exception e){
                e.printStackTrace();
            }
            request.setAttribute("idAppartamento", idAppartamento);
            redirect="/aggiungi-immobile-planimetria.jsp";
        }else if(azione.equals("planimetria")){
            PlanimetriaBean planimetria = new PlanimetriaBean();
            planimetria.setIdAppartamento(idAppartamento);
            String valore  = request.getParameter("valore");

            for(int i = 1; i <= Integer.parseInt(valore); i++){
                String s = "planimetria-"+i;
                planimetria.setPlanimetria(request.getPart(s));
                try{
                    planimetriaModelDM.doSavePlanimetria(planimetria);
                }catch (Exception e){
                    e.printStackTrace();
                }
            }
            if(modificaPlanimetria == null){
                inviata = "add";
            }
            else if(modificaPlanimetria.equals("modificaPla")){
                inviata = "mod";
            }
            redirect = "/gestione-lista-immobili.jsp";
        }
        request.getSession().setAttribute("inviata",inviata);
        RequestDispatcher rd = request.getRequestDispatcher(redirect);
        rd.forward(request, response);
    }
}
