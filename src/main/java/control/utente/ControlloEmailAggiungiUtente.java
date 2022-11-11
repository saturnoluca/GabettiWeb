package control.utente;

import model.utente.UtenteBean;
import model.utente.UtenteModelDM;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(name = "ControlloEmailAggiungiUtente", value = "/ControlloEmailAggiungiUtente")
@MultipartConfig
public class ControlloEmailAggiungiUtente extends HttpServlet {
    UtenteModelDM utenteModelDM = new UtenteModelDM();


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        UtenteModelDM model = new UtenteModelDM();
        String email = request.getParameter("email");
        ArrayList<UtenteBean> utenti = (ArrayList<UtenteBean>) utenteModelDM.doRetrieveAll();
        System.out.println(email);
        for(int i = 0; i<utenti.size(); i++){
            if(email.equals(utenti.get(i).getEmail())){
                out.print("email");
            }
        }
        out.print("true");
    }
}
