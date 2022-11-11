package control.utente;

import model.agente.AgenteBean;
import model.agente.AgenteModelDM;
import model.utente.UtenteBean;
import model.utente.UtenteModelDM;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ServletAggiungiUtente", value = "/AggiungiUtente")
@MultipartConfig
public class ServletAggiungiUtente extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String inviata = "no";
        String tipo = request.getParameter("ruolo");
        UtenteBean utenteBean = new UtenteBean();
        UtenteModelDM utenteModelDM = new UtenteModelDM();
        ArrayList<UtenteBean> utenti = null;
        if (tipo.equals("Admin")) {
            utenteBean.setNome(request.getParameter("nome"));
            utenteBean.setCognome(request.getParameter("cognome"));
            utenteBean.setEmail(request.getParameter("email"));
            utenteBean.setUsername(request.getParameter("username"));
            utenteBean.setPassword(request.getParameter("ruolo"));
            utenteBean.setRuolo(request.getParameter("ruolo"));
            utenteBean.setFoto(request.getPart("foto"));

            utenteModelDM.doSave(utenteBean);
            utenti = new ArrayList<UtenteBean>();
            utenti = (ArrayList<UtenteBean>) utenteModelDM.doRetrieveAll();
        } else if (tipo.equals("Segretario")) {
            utenteBean.setNome(request.getParameter("nome"));
            utenteBean.setCognome(request.getParameter("cognome"));
            utenteBean.setEmail(request.getParameter("email"));
            utenteBean.setUsername(request.getParameter("username"));
            utenteBean.setPassword(request.getParameter("password"));
            utenteBean.setRuolo(request.getParameter("ruolo"));
            utenteBean.setFoto(request.getPart("foto"));
            utenteModelDM.doSave(utenteBean);
            utenti = new ArrayList<UtenteBean>();
            utenti = (ArrayList<UtenteBean>) utenteModelDM.doRetrieveAll();
        } else if (tipo.equals("Agente")) {
            AgenteBean agenteBean = new AgenteBean();
            AgenteModelDM agenteModelDM = new AgenteModelDM();
            UtenteBean u;
            utenteBean.setNome(request.getParameter("nome"));
            utenteBean.setCognome(request.getParameter("cognome"));
            utenteBean.setEmail(request.getParameter("email"));
            utenteBean.setUsername(request.getParameter("username"));
            utenteBean.setPassword(request.getParameter("password"));
            utenteBean.setRuolo(request.getParameter("ruolo"));
            utenteBean.setFoto(request.getPart("foto"));
            utenteModelDM.doSave(utenteBean);
            u = utenteModelDM.RetrieveByEmail(utenteBean.getEmail());
            agenteBean.setIdUtente(u.getIdUtente());
            agenteBean.setDescrizionePersonale(request.getParameter("descrizione"));
            agenteBean.setTelefonoCellulare(request.getParameter("telefono"));
            agenteBean.setLinkFacebook(request.getParameter("facebook"));
            agenteBean.setLinkInstagram(request.getParameter("instagram"));
            agenteBean.setCollaboratore(0);
            agenteModelDM.doSave(agenteBean);
            utenti = new ArrayList<UtenteBean>();
            utenti = (ArrayList<UtenteBean>) utenteModelDM.doRetrieveAll();
        } else if (tipo.equals("Collaboratore")) {
            AgenteBean agenteBean = new AgenteBean();
            AgenteBean result = new AgenteBean();
            AgenteModelDM agenteModelDM = new AgenteModelDM();
            UtenteBean u;
            utenteBean.setNome(request.getParameter("nome"));
            utenteBean.setCognome(request.getParameter("cognome"));
            utenteBean.setEmail(request.getParameter("email"));
            utenteBean.setUsername(request.getParameter("username"));
            utenteBean.setPassword(request.getParameter("password"));
            utenteBean.setRuolo(request.getParameter("ruolo"));
            utenteBean.setFoto(request.getPart("foto"));
            utenteModelDM.doSave(utenteBean);
            result = agenteModelDM.RetrieveAgenteByIdUtente(Integer.parseInt(request.getParameter("agente")));
            u = utenteModelDM.RetrieveByEmail(utenteBean.getEmail());
            agenteBean.setIdUtente(u.getIdUtente());
            agenteBean.setDescrizionePersonale(request.getParameter("descrizione"));
            agenteBean.setTelefonoCellulare(request.getParameter("telefono"));
            agenteBean.setLinkFacebook(request.getParameter("facebook"));
            agenteBean.setLinkInstagram(request.getParameter("instagram"));
            agenteBean.setCollaboratore(result.getIdAgente());
            agenteModelDM.doSave(agenteBean);
            utenti = new ArrayList<UtenteBean>();
            utenti = (ArrayList<UtenteBean>) utenteModelDM.doRetrieveAll();
        }
        inviata = "add";
        request.getSession().setAttribute("inviata",inviata);
        request.setAttribute("lista-utenti", utenti);
        response.sendRedirect("lista-utenti.jsp");
    }
}
