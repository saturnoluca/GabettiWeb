package control.utente;

import UtilityClass.UtenteAgente;
import model.agente.AgenteBean;
import model.agente.AgenteModelDM;
import model.utente.UtenteBean;
import model.utente.UtenteModelDM;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ServletControlloModificaUtente", value = "/ControlloModificaUtente")
public class ServletControlloModificaUtente extends HttpServlet {

    private AgenteModelDM agenteModelDM = new AgenteModelDM();
    private UtenteModelDM utenteModelDM = new UtenteModelDM();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idUtente = Integer.parseInt(request.getParameter(("idUtente")));
        UtenteModelDM utenteModelDM = new UtenteModelDM();
        AgenteModelDM agenteModelDM = new AgenteModelDM();
        UtenteBean utenteBean = new UtenteBean();
        UtenteAgente u = new UtenteAgente();
        AgenteBean agenteBean = new AgenteBean();

        utenteBean = utenteModelDM.doRetrieveUtenteByKey(idUtente);
        if(!utenteBean.getRuolo().equals("Agente") && !utenteBean.getRuolo().equals("Collaboratore")){
            u.setIdUtente(utenteBean.getIdUtente());
            u.setNome(utenteBean.getNome());
            u.setCognome(utenteBean.getCognome());
            u.setEmail(utenteBean.getEmail());
            u.setUsername(utenteBean.getUsername());
            u.setPassword(utenteBean.getPassword());
            u.setRuolo(utenteBean.getRuolo());
            u.setFotoString(utenteBean.getFotoString());
        }
        if(utenteBean.getRuolo().equals("Agente") || utenteBean.getRuolo().equals("Collaboratore")){
            agenteBean = agenteModelDM.RetrieveAgenteByIdUtente(utenteBean.getIdUtente());
            u.setIdUtente(idUtente);
            u.setIdAgente(agenteBean.getIdAgente());
            u.setNome(utenteBean.getNome());
            u.setCognome(utenteBean.getCognome());
            u.setEmail(utenteBean.getEmail());
            u.setUsername(utenteBean.getUsername());
            u.setPassword(utenteBean.getPassword());
            u.setRuolo(utenteBean.getRuolo());
            u.setFotoString(utenteBean.getFotoString());
            u.setDescrizione(agenteBean.getDescrizionePersonale());
            u.setLinkFacebook(agenteBean.getLinkFacebook());
            u.setLinkInstragram(agenteBean.getLinkInstagram());
            u.setTelefono(agenteBean.getTelefonoCellulare());
            u.setCollaboratore(agenteBean.getCollaboratore());
        }
        ArrayList<UtenteBean> utenteArray = (ArrayList<UtenteBean>) utenteModelDM.doRetrieveAll();

        ArrayList<AgenteBean> agenteArray = (ArrayList<AgenteBean>) agenteModelDM.doRetrieveAll();
        request.setAttribute("utenteDaModificare", u);
        request.setAttribute("lista-utenti",utenteArray);
        request.setAttribute("lista-agenti",agenteArray);
        RequestDispatcher rd = request.getRequestDispatcher("/modifica-utente.jsp");
        rd.forward(request, response);
    }
}
