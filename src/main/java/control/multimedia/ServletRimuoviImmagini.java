package control.multimedia;

import model.multimedia.MultimediaModelDM;
import org.json.JSONObject;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ServletRimuoviImmagini", value = "/ServletRimuoviImmagini")
public class ServletRimuoviImmagini extends HttpServlet {

    private MultimediaModelDM multimediaModelDM = new MultimediaModelDM();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("ciao");
        String valore = request.getParameter("eliminati");

        // Creating array of string length
        char[] ch = new char[valore.length()];

        // Copy character by character into array
        for (int i = 0; i < valore.length(); i++) {
            ch[i] = valore.charAt(i);
        }

        for(int i = 0; i < ch.length; i++){
            multimediaModelDM.doDeleteFoto(ch[i]);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
