package control.appartamento;

import model.agente.AgenteBean;
import model.agente.AgenteModelDM;
import model.appartamento.AppartamentoBean;
import model.appartamento.AppartamentoModelDM;
import model.indirizzo.IndirizzoBean;
import model.indirizzo.IndirizzoModelDM;
import model.utente.UtenteBean;
import model.utente.UtenteModelDM;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "ServletPaginaModificaAppartamento", value = "/PaginaModificaAppartamento")
public class ServletPaginaModificaAppartamento extends HttpServlet {

    private static AppartamentoModelDM appartamentoModelDM = new AppartamentoModelDM();
    private static IndirizzoModelDM indirizzoModelDM = new IndirizzoModelDM();
    private static UtenteModelDM utenteModelDM = new UtenteModelDM();
    private static  AgenteModelDM agenteModelDM = new AgenteModelDM();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idImmobile = Integer.parseInt(request.getParameter("idImmobile"));
        AppartamentoBean appartamentoBean = new AppartamentoBean();
        IndirizzoBean indirizzoBean = new IndirizzoBean();
        AgenteBean agente = new AgenteBean();
        ArrayList<UtenteBean> utentiRuolo = new ArrayList<UtenteBean>();
        utentiRuolo = (ArrayList<UtenteBean>) utenteModelDM.doRetrieveByRole();

        try{
            appartamentoBean = appartamentoModelDM.RetrieveById(idImmobile);
            indirizzoBean = indirizzoModelDM.RetrieveIndirizzoByAppId(idImmobile);
            agente = agenteModelDM.RetrieveAgenteById(appartamentoBean.getIdAgente());
        }catch (Exception e){
            e.printStackTrace();
        }
        request.setAttribute("utentiRuolo",utentiRuolo);
        request.setAttribute("agente",agente);
        request.setAttribute("modifica-appartamento", appartamentoBean);
        request.setAttribute("modifica-indirizzo", indirizzoBean);
        RequestDispatcher rd = request.getRequestDispatcher("modifica-immobile.jsp");
        rd.forward(request, response);
    }
}
