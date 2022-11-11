package control.multimedia;

import UtilityClass.VisualizzazioneMultimedia;
import model.galleria.GalleriaBean;
import model.galleria.GalleriaModelDM;
import model.multimedia.MultimediaBean;
import model.multimedia.MultimediaModelDM;
import org.json.JSONObject;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.concurrent.ConcurrentHashMap;

@WebServlet(name = "ServletRimuoviImmagini", value = "/RimuoviImmagini")
public class ServletRimuoviImmagini extends HttpServlet {

    private GalleriaModelDM galleriaModelDM = new GalleriaModelDM();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        int idAppartamento = Integer.parseInt(request.getParameter("idAppartamento"));
        String valore = request.getParameter("eliminati");
        int copertina = Integer.parseInt(request.getParameter("copertina"));
        boolean eliminato = false;
        // Creating array of string length
        char[] ch = new char[valore.length()];
        String risultato = "";
        int count=valore.length();

        int result = galleriaModelDM.doRetrieveCopertina(idAppartamento,1);
        galleriaModelDM.doUpdateCopertina(result,0);
        galleriaModelDM.doUpdateCopertina(copertina,1);
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
                    galleriaModelDM.doDeleteFoto(risultato);
                    eliminato = true;
                    risultato = "";
                    count--;
                }
            }
            ArrayList<VisualizzazioneMultimedia> listaFoto = new ArrayList<VisualizzazioneMultimedia>();
            ArrayList<VisualizzazioneMultimedia> multimedia = new ArrayList<VisualizzazioneMultimedia>();
            try {
                listaFoto = galleriaModelDM.doRetrieveVisualizzazioneMultimedia(idAppartamento);
                for(int i=0; i<listaFoto.size(); i++){
                    if(listaFoto.get(i).fotoString != null){
                        multimedia.add(listaFoto.get(0));
                    }
                }


            } catch (Exception e) {
                e.printStackTrace();
            }
            request.setAttribute("idAppartamento",idAppartamento);
            request.setAttribute("lista-foto",multimedia);
            if(eliminato == true){
                out.print("true");
            }
            else{
                out.print("false");
            }
        }
    }
}
