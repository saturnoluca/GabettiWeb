package control.utente;

import model.agente.AgenteBean;
import model.agente.AgenteModelDM;
import model.utente.UtenteBean;
import model.utente.UtenteModelDM;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;


@WebServlet(name = "ServletModificaUtente", value = "/ModificaUtente")
@MultipartConfig
public class ServletModificaUtente extends HttpServlet {
    UtenteModelDM utenteModelDM = new UtenteModelDM();
    AgenteModelDM agenteModelDM = new AgenteModelDM();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UtenteBean utenteBean = new UtenteBean();
        UtenteBean utenteAgente = new UtenteBean();
        String inviata = "no";
        utenteAgente = utenteModelDM.doRetrieveUtenteByKey(Integer.parseInt(request.getParameter("idUtente")));
        utenteBean.setIdUtente(Integer.parseInt(request.getParameter("idUtente")));
        utenteBean.setNome(request.getParameter("nome"));
        utenteBean.setCognome(request.getParameter("cognome"));
        utenteBean.setEmail(request.getParameter("email"));
        utenteBean.setPassword(request.getParameter("password"));
        utenteBean.setUsername(request.getParameter("username"));
        utenteBean.setRuolo(request.getParameter("ruolo"));
        if(request.getPart("foto").getSize() == 0){
            utenteBean.setFotoString(utenteAgente.getFotoString());
        }
        else{
            utenteBean.setFoto(request.getPart("foto"));
        }


        //UtenteBean nuovi dati
        //UtenteAgente vecchi dati

        if (utenteAgente != null) {
            if(utenteAgente.getRuolo().equals("Admin") || utenteAgente.getRuolo().equals("Segretario")){
                if(utenteBean.getRuolo().equals("Admin") || utenteBean.getRuolo().equals("Segretario")){
                    //solo aggiornamento utente
                    utenteModelDM.doUpdate(utenteBean);
                }
                else if(utenteBean.getRuolo().equals("Agente")){
                    //aggiunta agente
                    utenteModelDM.doUpdate(utenteBean);
                    AgenteBean agenteBean = new AgenteBean();
                    agenteBean.setIdAgente(agenteModelDM.RetrieveAgenteByIdUtente(utenteBean.getIdUtente()).getIdAgente());
                    agenteBean.setLinkFacebook(request.getParameter("linkFacebook"));
                    agenteBean.setLinkInstagram(request.getParameter("linkInstagram"));
                    agenteBean.setDescrizionePersonale(request.getParameter("descrizionePersonale"));
                    agenteBean.setTelefonoCellulare(request.getParameter("telefono"));
                    agenteBean.setIdUtente(utenteBean.getIdUtente());
                    agenteBean.setCollaboratore(0);
                    agenteModelDM.doSave(agenteBean);

                }
                else if(utenteBean.getRuolo().equals("Collaboratore")){
                    //Aggiunta collaboratore
                    utenteModelDM.doUpdate(utenteBean);
                    AgenteBean agenteBean = new AgenteBean();
                    agenteBean.setIdAgente(agenteModelDM.RetrieveAgenteByIdUtente(utenteBean.getIdUtente()).getIdAgente());
                    agenteBean.setLinkFacebook(request.getParameter("linkFacebook"));
                    agenteBean.setLinkInstagram(request.getParameter("linkInstagram"));
                    agenteBean.setDescrizionePersonale(request.getParameter("descrizionePersonale"));
                    agenteBean.setTelefonoCellulare(request.getParameter("telefono"));
                    agenteBean.setIdUtente(utenteBean.getIdUtente());
                    agenteBean.setCollaboratore(Integer.parseInt(request.getParameter("idAgente")));
                    agenteModelDM.doSave(agenteBean);
                }
            }
            else if(utenteAgente.getRuolo().equals("Agente")){
                if(utenteBean.getRuolo().equals("Agente")){
                    //solo aggiornamento utente e agente
                    utenteModelDM.doUpdate(utenteBean);
                    AgenteBean agenteBean = new AgenteBean();
                    agenteBean.setIdAgente(agenteModelDM.RetrieveAgenteByIdUtente(utenteBean.getIdUtente()).getIdAgente());
                    agenteBean.setLinkFacebook(request.getParameter("linkFacebook"));
                    agenteBean.setLinkInstagram(request.getParameter("linkInstagram"));
                    agenteBean.setDescrizionePersonale(request.getParameter("descrizionePersonale"));
                    agenteBean.setTelefonoCellulare(request.getParameter("telefono"));
                    agenteBean.setIdUtente(utenteBean.getIdUtente());
                    agenteBean.setCollaboratore(0);
                    agenteModelDM.doUpdate(agenteBean);

                }
                else if(utenteBean.getRuolo().equals("Collaboratore")){
                    //rimuovi agente
                    //aggiungi collaboratore
                    System.out.println(request.getParameter("idAgente"));
                    utenteModelDM.doUpdate(utenteBean);
                    AgenteBean agenteBean = new AgenteBean();
                    agenteBean.setIdAgente(agenteModelDM.RetrieveAgenteByIdUtente(utenteBean.getIdUtente()).getIdAgente());
                    agenteBean.setLinkFacebook(request.getParameter("linkFacebook"));
                    agenteBean.setLinkInstagram(request.getParameter("linkInstagram"));
                    agenteBean.setDescrizionePersonale(request.getParameter("descrizionePersonale"));
                    agenteBean.setTelefonoCellulare(request.getParameter("telefono"));
                    agenteBean.setIdUtente(utenteBean.getIdUtente());
                    agenteBean.setCollaboratore(Integer.parseInt(request.getParameter("idAgente")));
                    agenteModelDM.doUpdate(agenteBean);


                }
                else if(utenteBean.getRuolo().equals("Admin") || utenteBean.getRuolo().equals("Segretario")){
                    //rimuovi agente
                    utenteModelDM.doUpdate(utenteBean);
                    agenteModelDM.doDelete(utenteBean);
                }
            }
            else if(utenteAgente.getRuolo().equals("Collaboratore")){
                if(utenteBean.getRuolo().equals("Agente")){
                    //rimuovi collaboratore e aggiungi agente
                    utenteModelDM.doUpdate(utenteBean);
                    AgenteBean agenteBean = new AgenteBean();
                    agenteBean.setIdAgente(agenteModelDM.RetrieveAgenteByIdUtente(utenteBean.getIdUtente()).getIdAgente());
                    agenteBean.setLinkFacebook(request.getParameter("linkFacebook"));
                    agenteBean.setLinkInstagram(request.getParameter("linkInstagram"));
                    agenteBean.setDescrizionePersonale(request.getParameter("descrizionePersonale"));
                    agenteBean.setTelefonoCellulare(request.getParameter("telefono"));
                    agenteBean.setIdUtente(utenteBean.getIdUtente());
                    agenteBean.setCollaboratore(0);
                    agenteModelDM.doUpdate(agenteBean);

                }
                else if(utenteBean.getRuolo().equals("Collaboratore")){
                    //aggiornamento collaboratore e utente
                    utenteModelDM.doUpdate(utenteBean);
                    AgenteBean agenteBean = new AgenteBean();
                    agenteBean.setIdAgente(agenteModelDM.RetrieveAgenteByIdUtente(utenteBean.getIdUtente()).getIdAgente());
                    agenteBean.setLinkFacebook(request.getParameter("linkFacebook"));
                    agenteBean.setLinkInstagram(request.getParameter("linkInstagram"));
                    agenteBean.setDescrizionePersonale(request.getParameter("descrizionePersonale"));
                    agenteBean.setTelefonoCellulare(request.getParameter("telefono"));
                    agenteBean.setIdUtente(utenteBean.getIdUtente());
                    agenteBean.setCollaboratore(Integer.parseInt(request.getParameter("idAgente")));
                    agenteModelDM.doUpdate(agenteBean);
                }
                else if(utenteBean.getRuolo().equals("Admin") || utenteBean.getRuolo().equals("Segretario")){
                    //rimuovi collaboratore
                    utenteModelDM.doUpdate(utenteBean);
                    agenteModelDM.doDelete(utenteBean);

                }
            }
            inviata = "mod";
        }
        request.getSession().setAttribute("inviata",inviata);
        RequestDispatcher rd = request.getRequestDispatcher("/lista-utenti.jsp");
        rd.forward(request, response);
    }
}
