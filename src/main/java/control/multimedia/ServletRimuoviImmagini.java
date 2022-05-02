package control.multimedia;

import model.multimedia.MultimediaBean;
import model.multimedia.MultimediaModelDM;
import org.json.JSONObject;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.concurrent.ConcurrentHashMap;

@WebServlet(name = "ServletRimuoviImmagini", value = "/ServletRimuoviImmagini")
public class ServletRimuoviImmagini extends HttpServlet {

    private MultimediaModelDM multimediaModelDM = new MultimediaModelDM();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idAppartamento = Integer.parseInt(request.getParameter("idAppartamento"));
        String valore = request.getParameter("eliminati");
        System.out.println(valore);
        System.out.println("MANNAGGIA LA MADONNA " +valore);
        // Creating array of string length
        char[] ch = new char[valore.length()];
        String risultato = "";
        // Copy character by character into array
        for (int i = 0; i < valore.length(); i++) {
            char c = valore.charAt(i);

            if(Character.isDigit(c)){
                risultato = risultato + c;
                System.out.println("valore " + risultato);
            }
            if(!Character.isDigit(c) || risultato.length() == valore.length()){
                System.out.println("ciaoo");
                multimediaModelDM.doDeleteFoto(risultato);
                risultato = "";
            }
        }
        ArrayList<MultimediaBean> listaFoto = new ArrayList<MultimediaBean>();
        MultimediaBean multimedia = new MultimediaBean();
        listaFoto = multimediaModelDM.RetrieveAllMultimedia();
        for (MultimediaBean foto : listaFoto) {
            if (idAppartamento == foto.getIdAppartamento() && foto.getFotoString() != null) {

                multimedia.setIdAppartamento(foto.getIdAppartamento());
                multimedia.setFotoString(foto.getFotoString());
            }
        }
        request.setAttribute("lista-foto",multimedia);
        RequestDispatcher rd = request.getRequestDispatcher("/modifica-immobile-galleria.jsp");
        rd.forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
