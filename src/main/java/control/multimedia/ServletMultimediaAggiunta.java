package control.multimedia;

import model.multimedia.MultimediaBean;
import model.multimedia.MultimediaModelDM;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

@WebServlet(name = "ServletMultimediaAggiunta", value = "/ServletMultimediaAggiunta")
@MultipartConfig
public class ServletMultimediaAggiunta extends HttpServlet {
    private static MultimediaModelDM multimediaModelDM = new MultimediaModelDM();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idAppartamento = Integer.parseInt(request.getParameter("idAppartamento"));
        String azione = request.getParameter("azione");
        String redirect="";
        if(azione.equals("foto")){
            ArrayList<Part> foto = (ArrayList<Part>) request.getParts();
            MultimediaBean multi = new MultimediaBean();
            multi.setIdAppartamento(idAppartamento);
            multi.setFoto(foto);
            try{
                multimediaModelDM.doSaveFoto(multi);
            }catch (Exception e){
                e.printStackTrace();
            }
            request.setAttribute("idAppartamento", idAppartamento);
            redirect = "/aggiunta-immobile-video.jsp";
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
            ArrayList<Part> planimetria = new ArrayList<Part>();
            planimetria = (ArrayList<Part>) request.getParts();
            MultimediaBean multi = new MultimediaBean();
            multi.setIdAppartamento(idAppartamento);
            multi.setPlanimetria(planimetria);
            try{
                multimediaModelDM.doSavePlanimetria(multi);
            }catch (Exception e){
                e.printStackTrace();
            }
            redirect = "/myprofile.jsp";
        }
        RequestDispatcher rd = request.getRequestDispatcher(redirect);
        rd.forward(request, response);
    }
}