package control.utente;

import model.utente.UtenteBean;
import model.utente.UtenteModelDM;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(name = "ControlloUsername", value = "/ControlloUsername")
@MultipartConfig
public class ControlloUsername extends HttpServlet {
    UtenteModelDM utenteModelDM = new UtenteModelDM();


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        UtenteModelDM model = new UtenteModelDM();
        int idUtente = Integer.parseInt(request.getParameter("idUtente"));
        String username = request.getParameter("username");
        ArrayList<UtenteBean> utenti = (ArrayList<UtenteBean>) utenteModelDM.doRetrieveAll();
        for(int i = 0; i<utenti.size(); i++){
            UtenteBean utente = utenteModelDM.doRetrieveUtenteByKey(idUtente);
            if(utente.getIdUtente() != utenti.get(i).getIdUtente()){
                if(username == utenti.get(i).getUsername()){
                    out.print("username");
                }

            }
        }
        out.print("true");
    }
}
