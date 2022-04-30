package control.appartamento;

import model.appartamento.AppartamentoBean;
import model.appartamento.AppartamentoModelDM;
import model.indirizzo.IndirizzoBean;
import model.indirizzo.IndirizzoModelDM;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ServletPaginaModificaAppartamento", value = "/ServletPaginaModificaAppartamento")
public class ServletPaginaModificaAppartamento extends HttpServlet {

    private static AppartamentoModelDM appartamentoModelDM = new AppartamentoModelDM();
    private static IndirizzoModelDM indirizzoModelDM = new IndirizzoModelDM();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idImmobile = Integer.parseInt(request.getParameter("idImmobile"));
        AppartamentoBean appartamentoBean = new AppartamentoBean();
        IndirizzoBean indirizzoBean = new IndirizzoBean();
        try{
            appartamentoBean = appartamentoModelDM.RetrieveById(idImmobile);
            indirizzoBean = indirizzoModelDM.RetrieveIndirizzoByAppId(idImmobile);
        }catch (Exception e){
            e.printStackTrace();
        }
        request.setAttribute("modifica-appartamento", appartamentoBean);
        request.setAttribute("modifica-indirizzo", indirizzoBean);
        RequestDispatcher rd = request.getRequestDispatcher("modifica-immobile.jsp");
        rd.forward(request, response);
    }
}
