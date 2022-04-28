package control.agente;

import model.agente.AgenteBean;
import model.agente.AgenteModelDM;
import model.utente.UtenteBean;
import model.utente.UtenteModelDM;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ServletCambiaInformazioniAgente", value = "/ServletCambiaInformazioniAgente")
public class ServletCambiaInformazioniAgente extends HttpServlet {

    AgenteModelDM agenteModelDM = new AgenteModelDM();
    UtenteModelDM utenteModelDM = new UtenteModelDM();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AgenteBean agenteBean = new AgenteBean();
        int idAgente = Integer.parseInt(request.getParameter(("idAgente")));
        agenteBean = agenteModelDM.RetrieveAgenteById(idAgente);

        if (request.getParameter("descrizioneAgente").length() == 0) {
            agenteBean.setDescrizionePersonale(agenteBean.getDescrizionePersonale());
        } else {
            agenteBean.setDescrizionePersonale(request.getParameter("descrizioneAgente"));
        }
        if (request.getParameter("linkFacebook").length() == 0) {
            agenteBean.setLinkFacebook(agenteBean.getLinkFacebook());
        } else {
            agenteBean.setLinkFacebook(request.getParameter("linkFacebook"));
        }
        if (request.getParameter("linkInstagram").length() == 0) {
            agenteBean.setLinkInstagram(agenteBean.getLinkInstagram());
        } else {
            agenteBean.setLinkInstagram(request.getParameter("linkInstagram"));
        }
        agenteModelDM.doUpdate(agenteBean);
        request.getSession().removeAttribute("agente");
        request.getSession().setAttribute("agente",agenteBean);
        RequestDispatcher rd = request.getRequestDispatcher("/myprofile.jsp");
        rd.forward(request, response);
    }
}
