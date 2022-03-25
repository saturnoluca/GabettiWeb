package control.utente;

import model.agente.AgenteBean;
import model.agente.AgenteModelDM;
import model.collaboratore.CollaboratoreBean;
import model.collaboratore.CollaboratoreModelDM;
import model.utente.UtenteBean;
import model.utente.UtenteModelDM;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;

@WebServlet(name = "ServletAggiungiUtente", value = "/ServletAggiungiUtente")
@MultipartConfig
public class ServletAggiungiUtente extends HttpServlet {
    @Override
    protected void doPost   (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tipo = request.getParameter("ruolo");
        UtenteBean utenteBean = new UtenteBean();
        UtenteModelDM utenteModelDM = new UtenteModelDM();
        if(tipo.equals("Admin")){
            utenteBean.setNome(request.getParameter("nome"));
            utenteBean.setCognome(request.getParameter("cognome"));
            utenteBean.setEmail(request.getParameter("email"));
            utenteBean.setUsername(request.getParameter("username"));
            utenteBean.setPassword(request.getParameter("ruolo"));
            utenteBean.setRuolo(request.getParameter("ruolo"));
            utenteBean.setFoto(request.getPart("foto"));

            try{
                utenteModelDM.doSave(utenteBean);
            }catch (SQLException e){
                e.printStackTrace();
            }
        }else if(tipo.equals("Segretario")){
            utenteBean.setNome(request.getParameter("nome"));
            utenteBean.setCognome(request.getParameter("cognome"));
            utenteBean.setEmail(request.getParameter("email"));
            utenteBean.setUsername(request.getParameter("username"));
            utenteBean.setPassword(request.getParameter("password"));
            utenteBean.setRuolo(request.getParameter("ruolo"));
            utenteBean.setFoto(request.getPart("foto"));
            try{
                utenteModelDM.doSave(utenteBean);
            }catch (SQLException e){
                e.printStackTrace();
            }
        }else if(tipo.equals("Agente")){
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
            try{
                utenteModelDM.doSave(utenteBean);
                System.out.println(utenteModelDM.RetrieveByEmail(utenteBean.getEmail()).getIdUtente());
                u = utenteModelDM.RetrieveByEmail(utenteBean.getEmail());
                agenteBean.setIdUtente(u.getIdUtente());
                agenteBean.setDescrizionePersonale(request.getParameter("descrizione"));
                agenteBean.setTelefonoCellulare("telefonoCellulare");
                agenteBean.setTelefonoFisso("telefonoFisso");
                agenteBean.setLinkFacebook(request.getParameter("facebook"));
                agenteBean.setLinkInstagram(request.getParameter("instagram"));
                agenteModelDM.doSave(agenteBean);
            }catch (SQLException e){
                e.printStackTrace();
            }
        }else if(tipo.equals("Collaboratore")){
            AgenteBean agenteBean = new AgenteBean();
            AgenteModelDM agenteModelDM = new AgenteModelDM();
            UtenteBean u = new UtenteBean();
            CollaboratoreBean collaboratoreBean = new CollaboratoreBean();
            CollaboratoreModelDM collaboratoreModelDM = new CollaboratoreModelDM();
            utenteBean.setNome(request.getParameter("nome"));
            utenteBean.setCognome(request.getParameter("cognome"));
            utenteBean.setEmail(request.getParameter("email"));
            utenteBean.setUsername(request.getParameter("username"));
            utenteBean.setPassword(request.getParameter("ruolo"));
            utenteBean.setRuolo(request.getParameter("ruolo"));
            utenteBean.setFoto(request.getPart("foto"));
            try{
                u=utenteModelDM.RetrieveByEmail(utenteBean.getEmail());
                agenteBean = agenteModelDM.RetrieveAgenteByIdUtente(Integer.parseInt(request.getParameter("agente")));
                collaboratoreBean.setIdUtente(u.getIdUtente());
                collaboratoreBean.setIdAgente(agenteBean.getIdAgente());
                collaboratoreBean.setDescrizionePersonale(request.getParameter("descrizione"));
                collaboratoreBean.setLinkFacebook(request.getParameter("facebook"));
                collaboratoreBean.setLinkInstagram(request.getParameter("instagram"));
                collaboratoreModelDM.doSave(collaboratoreBean);
            }catch (SQLException e){
                e.printStackTrace();
            }
        }
        response.sendRedirect("aggiungi-utente.jsp");
    }
}
