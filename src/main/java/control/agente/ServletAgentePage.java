package control.agente;

import UtilityClass.CompositeKeyAgenteCase;
import model.agente.AgenteBean;
import model.agente.AgenteModelDM;
import model.appartamento.AppartamentoBean;
import model.appartamento.AppartamentoModelDM;
import model.indirizzo.IndirizzoBean;
import model.indirizzo.IndirizzoModelDM;
import model.multimedia.MultimediaBean;
import model.multimedia.MultimediaModelDM;
import model.utente.UtenteBean;
import model.utente.UtenteModelDM;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "ServletAgentePage", value = "/ServletAgentePage")
@MultipartConfig
public class ServletAgentePage extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static AgenteModelDM modelAgenti = new AgenteModelDM();
    private static UtenteModelDM modelUtente = new UtenteModelDM();
    private static AppartamentoModelDM appartamentoModelDM = new AppartamentoModelDM();
    private static IndirizzoModelDM indirizzoModelDM = new IndirizzoModelDM();
    private static MultimediaModelDM multimediaModelDM = new MultimediaModelDM();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        UtenteBean utenteBean = new UtenteBean();
        AgenteBean agenteBean = new AgenteBean();
        ArrayList<AppartamentoBean> arrayAppartamento = new ArrayList<AppartamentoBean>();
        ArrayList<IndirizzoBean> arrayIndirizzo = new ArrayList<IndirizzoBean>();
        ArrayList<MultimediaBean> arrayMultimedia = new ArrayList<MultimediaBean>();
        CompositeKeyAgenteCase agenteCase = new CompositeKeyAgenteCase();

        try {
            agenteBean = modelAgenti.RetrieveAgenteById(id);
            utenteBean = modelUtente.doRetrieveUtenteByKeyAgente(agenteBean.getIdUtente());
            arrayAppartamento = (ArrayList<AppartamentoBean>) appartamentoModelDM.RetrieveAllByAgente(id);
            arrayIndirizzo = (ArrayList<IndirizzoBean>) indirizzoModelDM.RetrieveAll();
            arrayMultimedia = multimediaModelDM.RetrieveAll((ArrayList<AppartamentoBean>) appartamentoModelDM.RetrieveAllAppartamento());
            agenteCase=modelAgenti.RetrieveSingleAgenteCase(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("agente", agenteBean);
        request.setAttribute("utente", utenteBean);
        request.setAttribute("arrayAppartamento", arrayAppartamento);
        request.setAttribute("arrayIndirizzo", arrayIndirizzo);
        request.setAttribute("arrayMultimedia", arrayMultimedia);
        request.setAttribute("agenteCase", agenteCase);
        RequestDispatcher rd = request.getRequestDispatcher("/agente.jsp");
        rd.forward(request, response);
    }

}
