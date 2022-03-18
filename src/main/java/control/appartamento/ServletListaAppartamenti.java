package control.appartamento;

import UtilityClass.CompositeKeyAgenteCase;
import model.agente.AgenteBean;
import model.agente.AgenteModelDM;
import model.appartamento.AppartamentoBean;
import model.appartamento.AppartamentoModelDM;
import model.utente.UtenteBean;
import model.utente.UtenteModelDM;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "ServletListaAppartamenti", value = "/ServletListaAppartamenti")
public class ServletListaAppartamenti extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String numeroString = request.getParameter("numero");
        int num = 0;
        int sizeArray=0;
        String sizeArrayString=null;
        if (numeroString == null) {
            num = 1;
        } else {
            num = Integer.parseInt(numeroString);
        }
        AppartamentoModelDM appartamentoModelDM = new AppartamentoModelDM();
        ArrayList<AppartamentoBean> appArray = new ArrayList<AppartamentoBean>();
        ArrayList<AppartamentoBean> appArray2 = new ArrayList<AppartamentoBean>();
        AgenteModelDM agenteModelDM = new AgenteModelDM();
        ArrayList<AgenteBean> agenteArray = new ArrayList<AgenteBean>();
        UtenteModelDM utenteModelDM = new UtenteModelDM();
        ArrayList<UtenteBean> utenteArray = new ArrayList<UtenteBean>();
        ArrayList<CompositeKeyAgenteCase> arrayComp= new ArrayList<CompositeKeyAgenteCase>();
        try {
            appArray = (ArrayList<AppartamentoBean>) appartamentoModelDM.RetrieveAllAppartamento();
            sizeArray=(int) Math.ceil((double)appArray.size()/10);
            sizeArrayString=Integer.toString(sizeArray);
            agenteArray = (ArrayList<AgenteBean>) agenteModelDM.RetrieveAgente();
            utenteArray = (ArrayList<UtenteBean>) utenteModelDM.doRetrieveAll();
            arrayComp=(ArrayList<CompositeKeyAgenteCase>) agenteModelDM.RetrieveAgenteCase();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (appArray != null) {
            if (appArray.size() < 10) {
                request.setAttribute("array", appArray);
                request.setAttribute("arrayAgente", agenteArray);
                request.setAttribute("arrayUtente", utenteArray);
                request.setAttribute("sizeArray", sizeArrayString);
                request.setAttribute("arrayComp", arrayComp);
                RequestDispatcher rd = request.getRequestDispatcher("/listaappartamenti.jsp");
                rd.forward(request, response);
            } else if (appArray.size() < num * 10) {
                for (int i = (num - 1) * 10; i < appArray.size(); i++) {
                    appArray2.add(appArray.get(i));
                }
                request.setAttribute("array", appArray2);
                request.setAttribute("arrayAgente", agenteArray);
                request.setAttribute("arrayUtente", utenteArray);
                request.setAttribute("sizeArray", sizeArrayString);
                request.setAttribute("arrayComp", arrayComp);
                RequestDispatcher rd = request.getRequestDispatcher("/listaappartamenti.jsp");
                rd.forward(request, response);
            } else if (appArray.size() > num * 10) {
                for (int i = (num - 1) * 10; i < (num * 10); i++) {
                    appArray2.add(appArray.get(i));
                }
                request.setAttribute("array", appArray2);
                request.setAttribute("arrayAgente", agenteArray);
                request.setAttribute("arrayUtente", utenteArray);
                request.setAttribute("sizeArray", sizeArrayString);
                request.setAttribute("arrayComp", arrayComp);
                RequestDispatcher rd = request.getRequestDispatcher("/listaappartamenti.jsp");
                rd.forward(request, response);
            }
        }
    }
}