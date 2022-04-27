package control.utente;

import model.agente.AgenteBean;
import model.agente.AgenteModelDM;
import model.utente.UtenteBean;
import model.utente.UtenteModelDM;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ServletModificaUtente", value = "/ServletModificaUtente")
@MultipartConfig
public class ServletModificaUtente extends HttpServlet {
    UtenteModelDM utente = new UtenteModelDM();
    AgenteModelDM agenteModel = new AgenteModelDM();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UtenteBean utenteBean = new UtenteBean();
        UtenteBean utenteAgente = new UtenteBean();
        utenteBean.setIdUtente(Integer.parseInt(request.getParameter("idUtente")));
        utenteBean.setNome(request.getParameter("nome"));
        utenteBean.setCognome(request.getParameter("cognome"));
        utenteBean.setEmail(request.getParameter("email"));
        utenteBean.setPassword(request.getParameter("password"));
        utenteBean.setUsername(request.getParameter("username"));
        utenteBean.setRuolo(request.getParameter("ruolo"));
        utenteBean.setFoto(request.getPart("foto"));

        utenteAgente = utente.doRetrieveUtenteByKey(Integer.parseInt(request.getParameter("idUtente")));

        if (utenteAgente != null) {
            if (!utenteBean.getRuolo().equals("Agente") && utenteAgente.getRuolo().equals("Agente")) {
                agenteModel.doDelete(utenteAgente);
                utente.doUpdate(utenteBean);
            }
        }
        if (!request.getParameter("ruolo").equals("Agente") && !request.getParameter("ruolo").equals("Collaboratore")) {
            System.out.println(utenteBean);
            utente.doUpdate(utenteBean);
        } else if (request.getParameter("ruolo").equals("Agente") || request.getParameter("ruolo").equals("Collaboratore")) {
            AgenteBean agenteBean = new AgenteBean();
            agenteBean.setIdAgente(agenteModel.RetrieveAgenteByIdUtente(Integer.parseInt(request.getParameter("idUtente"))).getIdAgente());
            agenteBean.setLinkFacebook(request.getParameter("linkFacebook"));
            agenteBean.setLinkInstagram(request.getParameter("linkInstagram"));
            agenteBean.setDescrizionePersonale(request.getParameter("descrizionePersonale"));
            agenteBean.setTelefonoCellulare(request.getParameter("telefono"));
            agenteBean.setIdUtente(Integer.parseInt(request.getParameter("idUtente")));
            System.out.println(agenteBean);
            try {
                agenteModel.doUpdate(agenteBean);
                utente.doUpdate(utenteBean);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
