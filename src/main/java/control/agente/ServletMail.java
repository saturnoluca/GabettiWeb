package control.agente;

import UtilityClass.Mail;
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

@WebServlet(name = "ServletMail", value = "/SendEmail")
public class ServletMail extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AgenteModelDM modelAgente = new AgenteModelDM();
    private UtenteModelDM modelUtent = new UtenteModelDM();
    private AppartamentoModelDM appartamentoModelDM = new AppartamentoModelDM();

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String inviata = "no";
        if (request.getParameter("action").equals("agente") || request.getParameter("action").equals("collaboratore")) {
            AgenteBean agente = new AgenteBean();
            UtenteBean utenteBean = new UtenteBean();
            request.setCharacterEncoding("UTF-8");
            String nomeGuest = request.getParameter("nomeGuest");
            String emailGuest = request.getParameter("emailGuest");
            String telefonoGuest = request.getParameter("telefonoGuest");
            String messaggioGuest = request.getParameter("messaggioGuest");
            String contenuto = "Nome Mittente: " + nomeGuest + "\nEmail Mittente: " + emailGuest + "\nTelefono Mittente: " + telefonoGuest + "\n\n" +"Messaggio: "+ messaggioGuest;
            agente = modelAgente.RetrieveAgenteById(Integer.parseInt(request.getParameter("agenteid")));
            utenteBean = modelUtent.doRetrieveUtenteByKey(agente.getIdUtente());
            try {
                inviata = "ok";
                Mail.sendMail(utenteBean.getEmail(), contenuto);
                Mail.sendMail("Kasaresrl@gmail.com", contenuto);
            } catch (Exception e) {
                e.printStackTrace();
            }
            request.getSession().setAttribute("inviata",inviata);
            response.sendRedirect("AgentePage?id="+agente.getIdUtente());
        }
        else if (request.getParameter("action").equals("contattaci")) {
            request.setCharacterEncoding("UTF-8");
            String nomeGuest = request.getParameter("nome");
            String emailGuest = request.getParameter("email");
            String telefonoGuest = request.getParameter("telefono");
            String messaggioGuest = request.getParameter("messaggio");
            String contenuto = "Nome Mittente: " + nomeGuest + "\nEmail Mittente: " + emailGuest + "\nTelefono Mittente: " + telefonoGuest + "\n\n" + messaggioGuest;
            try {
                inviata = "ok";
                Mail.sendMail("nocera@gabetti.it", contenuto);
            } catch (Exception e) {
                e.printStackTrace();
            }
            request.getSession().setAttribute("inviata",inviata);
            response.sendRedirect("contact.jsp");
        }else if (request.getParameter("action").equals("immobile")) {
            AgenteBean agente = new AgenteBean();
            UtenteBean utenteBean = new UtenteBean();
            request.setCharacterEncoding("UTF-8");
            String nomeGuest = request.getParameter("nomeGuest");
            String emailGuest = request.getParameter("emailGuest");
            String telefonoGuest = request.getParameter("telefonoGuest");
            String messaggioGuest = request.getParameter("messaggioGuest");
            int idAppartamento = Integer.parseInt(request.getParameter("idAppartamento"));
            AppartamentoBean appartamentoBean = appartamentoModelDM.RetrieveById(idAppartamento);
            String contenuto = "Richiesta per l'immobile con id: " + idAppartamento + " con nome annuncio " + appartamentoBean.getNomeAppartamento() + "\nNome Mittente: " + nomeGuest + "\nEmail Mittente: " + emailGuest + "\nTelefono Mittente: " + telefonoGuest + "\n\n" + messaggioGuest;
            agente = modelAgente.RetrieveAgenteById(Integer.parseInt(request.getParameter("agenteid")));
            utenteBean = modelUtent.doRetrieveUtenteByKey(agente.getIdUtente());
            try {
                inviata = "ok";
                Mail.sendMail(utenteBean.getEmail(), contenuto);
            } catch (Exception e) {
                e.printStackTrace();
            }
            request.getSession().setAttribute("inviata",inviata);
            response.sendRedirect("DettagliAppartamento?id="+idAppartamento);
        }else if (request.getParameter("action").equals("valutazione")) {
            String nomeGuest = request.getParameter("nome");
            String cognomeGuest = request.getParameter("cognome");
            String emailGuest = request.getParameter("email");
            String telefonoGuest = request.getParameter("telefono");
            String indirizzo = null;
            if (request.getParameter("indirizzo") != null) {
                indirizzo = request.getParameter("indirizzo");
            }
            String comune = null;
            if (request.getParameter("comune") != null) {
                comune = request.getParameter("comune");
            }
            String tipoImmobile = null;
            if (request.getParameter("tipoImmobile") != null) {
                tipoImmobile = request.getParameter("tipoImmobile");
            }
            String superficie = null;
            if (request.getParameter("superficie") != null) {
                superficie = request.getParameter("superficie");
            }
            String piano = null;
            if (request.getParameter("piano") != null) {
                piano = request.getParameter("piano");
            }
            String locali = null;
            if (request.getParameter("locali") != null) {
                locali = request.getParameter("locali");
            }
            String bagni = null;
            if(request.getParameter("bagni")!=null){
                bagni=request.getParameter("bagni");
            }
            String statoAppartamento=null;
            if(request.getParameter("statoAppartamento")!=null){
                statoAppartamento=request.getParameter("statoAppartamento");
            }
            String riscaldamento = null;
            if(request.getParameter("riscaldamento")!=null){
                riscaldamento=request.getParameter("riscaldamento");
            }
            String annoDiCostruzione=null;
            if(request.getParameter("annoDiCostruzione")!=null){
                annoDiCostruzione=request.getParameter("annoDiCostruzione");
            }

            String messaggio=nomeGuest+" "+cognomeGuest+"\n"+emailGuest+"\n"+telefonoGuest+"\n"+"Indirizzo Immobile: "+indirizzo+
                    "\nComune Immobile: "+comune+"\nTipo Immobile: "+tipoImmobile+"\nSuperficie: "+superficie+"\nPiano: "+piano+
                    "\nLocali: "+locali+"\nBagni: "+bagni+"\nStato dell'appartamento: "+statoAppartamento+
                    "\nRiscaldamento: "+riscaldamento+"\nAnno di costruzione: "+annoDiCostruzione;

            try {
                inviata = "ok";
                Mail.sendMail("u.ambrosio@gmail.com", messaggio);
            } catch (Exception e) {
                e.printStackTrace();
            }
            request.getSession().setAttribute("inviata",inviata);
            response.sendRedirect("valutazione.jsp");
        }
    }
}
