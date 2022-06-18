package control.agente;

import UtilityClass.Mail;
import model.agente.AgenteBean;
import model.agente.AgenteModelDM;
import model.appartamento.AppartamentoBean;
import model.appartamento.AppartamentoModel;
import model.appartamento.AppartamentoModelDM;
import model.utente.UtenteBean;
import model.utente.UtenteModelDM;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ServletMail", value = "/ServletMail")
public class ServletMail extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AgenteModelDM modelAgente = new AgenteModelDM();
    private UtenteModelDM modelUtent = new UtenteModelDM();
    private AppartamentoModelDM appartamentoModelDM = new AppartamentoModelDM();
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("action").equals("agente")) {
            AgenteBean agente = new AgenteBean();
            UtenteBean utenteBean = new UtenteBean();
            request.setCharacterEncoding("UTF-8");
            String nomeGuest = request.getParameter("nomeGuest");
            String emailGuest = request.getParameter("emailGuest");
            String telefonoGuest = request.getParameter("telefonoGuest");
            String messaggioGuest = request.getParameter("messaggioGuest");
            String contenuto = "Nome Mittente: " + nomeGuest + "\nEmail Mittente: " + emailGuest + "\nTelefono Mittente: " + telefonoGuest + "\n\n" + messaggioGuest;
            agente = modelAgente.RetrieveAgenteById(Integer.parseInt(request.getParameter("agenteid")));
            utenteBean = modelUtent.doRetrieveUtenteByKey(agente.getIdUtente());
            try {
                Mail.sendMail(utenteBean.getEmail(), contenuto);
                Mail.sendMail("Kasaresrl@gmail.com", contenuto);
            } catch (Exception e) {
                e.printStackTrace();
            }

            response.sendRedirect("agente.jsp?id=");
        } else if (request.getParameter("action").equals("contattaci")) {
            request.setCharacterEncoding("UTF-8");
            String nomeGuest = request.getParameter("nome");
            String emailGuest = request.getParameter("email");
            String telefonoGuest = request.getParameter("telefono");
            String messaggioGuest = request.getParameter("messaggio");
            String contenuto = "Nome Mittente: " + nomeGuest + "\nEmail Mittente: " + emailGuest + "\nTelefono Mittente: " + telefonoGuest + "\n\n" + messaggioGuest;
            try {
                Mail.sendMail("nocera@gabetti.it", contenuto);
            } catch (Exception e) {
                e.printStackTrace();
            }
            response.sendRedirect("contact.html");
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
                Mail.sendMail(utenteBean.getEmail(), contenuto);
            } catch (Exception e) {
                e.printStackTrace();
            }
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
            String ultimoPiano = null;
            if (request.getParameter("ultimoPiano") != null) {
                ultimoPiano = request.getParameter("ultimoPiano");
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
                    "\nUltimpo Piano? "+ultimoPiano+"\nLocali: "+locali+"\nBagni: "+bagni+"\nStato dell'appartamento: "+statoAppartamento+
                    "\nRiscaldamento: "+riscaldamento+"\nAnno di costruzione: "+annoDiCostruzione;

            try {
                Mail.sendMail("u.ambrosio@gmail.com", messaggio);
            } catch (Exception e) {
                e.printStackTrace();
            }
            response.sendRedirect("valutazione.jsp");
        }
    }
}
