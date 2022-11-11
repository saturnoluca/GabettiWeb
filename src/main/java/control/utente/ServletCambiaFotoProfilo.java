package control.utente;

import model.utente.UtenteBean;
import model.utente.UtenteModelDM;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletCambiaFotoProfilo", value = "/CambiaFotoProfilo")
@MultipartConfig
public class ServletCambiaFotoProfilo extends HttpServlet {
    private static UtenteModelDM utenteModelDM = new UtenteModelDM();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String inviata = "no";
        int idUtente = Integer.parseInt(request.getParameter("idUtente"));
        Part foto = request.getPart("foto");
        UtenteBean utenteBean = new UtenteBean();
        try{
            if(foto.getSize() != 0){
                utenteModelDM.doUpdateFoto(idUtente, foto);
                inviata = "ok";
            }
            utenteBean= utenteModelDM.doRetrieveUtenteByKey(idUtente);
        }catch (Exception e){
            e.printStackTrace();
        }
        request.getSession().setAttribute("inviata",inviata);
        request.getSession().removeAttribute("utente");
        request.getSession().setAttribute("utente", utenteBean);
        RequestDispatcher rd = request.getRequestDispatcher("/myprofile.jsp");
        rd.forward(request, response);
    }
}
