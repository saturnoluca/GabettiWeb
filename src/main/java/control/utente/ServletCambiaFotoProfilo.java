package control.utente;

import model.utente.UtenteBean;
import model.utente.UtenteModelDM;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletCambiaFotoProfilo", value = "/ServletCambiaFotoProfilo")
@MultipartConfig
public class ServletCambiaFotoProfilo extends HttpServlet {
    private static UtenteModelDM utenteModelDM = new UtenteModelDM();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idUtente = Integer.parseInt(request.getParameter("idUtente"));
        Part foto = request.getPart("foto");
        UtenteBean utenteBean = new UtenteBean();
        try{
            utenteModelDM.doUpdateFoto(idUtente, foto);
            utenteBean= utenteModelDM.doRetrieveUtenteByKey(idUtente);
        }catch (Exception e){
            e.printStackTrace();
        }
        request.getSession().removeAttribute("utente");
        request.getSession().setAttribute("utente", utenteBean);
        RequestDispatcher rd = request.getRequestDispatcher("/myprofile.jsp");
        rd.forward(request, response);
    }
}
