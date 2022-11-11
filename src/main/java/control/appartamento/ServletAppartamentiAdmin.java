package control.appartamento;

import UtilityClass.VisualizzazioneImmobile;
import model.agente.AgenteBean;
import model.agente.AgenteModelDM;
import model.appartamento.AppartamentoBean;
import model.appartamento.AppartamentoModelDM;
import model.galleria.GalleriaModelDM;
import model.multimedia.MultimediaBean;
import model.utente.UtenteBean;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ServletAppartamentiAdmin", value = "/AppartamentiAdmin")
public class ServletAppartamentiAdmin extends HttpServlet {
    AppartamentoModelDM appartamentoModelDM = new AppartamentoModelDM();
    GalleriaModelDM galleriaModelDM = new GalleriaModelDM();
    AgenteModelDM agenteModelDM = new AgenteModelDM();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        UtenteBean utente = (UtenteBean) session.getAttribute("utente");

        ArrayList<AppartamentoBean> appartamento = new ArrayList<AppartamentoBean>();
        ArrayList<MultimediaBean> multimedia = new ArrayList<MultimediaBean>();
        ArrayList<VisualizzazioneImmobile> immobili = new ArrayList<VisualizzazioneImmobile>();
        String foto;
        if (utente.getRuolo().equals("Admin") || utente.getRuolo().equals("Segretario")) {
            appartamento = (ArrayList<AppartamentoBean>) appartamentoModelDM.OrderByData();
        } else if (utente.getRuolo().equals("Agente") || utente.getRuolo().equals("Collaboratore")) {
            AgenteBean agenteBean = new AgenteBean();
            agenteBean = agenteModelDM.RetrieveAgenteByIdUtente(utente.getIdUtente());
            appartamento = (ArrayList<AppartamentoBean>) appartamentoModelDM.RetrieveAllByAgente(agenteBean.getIdAgente());
        }
        for (int i = 0; i < appartamento.size(); i++) {
            int id = appartamento.get(i).getIdAppartamento();
            if (galleriaModelDM.doRetrieveFoto(id).size() == 0)
                foto = null;
            else{
                foto = galleriaModelDM.doRetrieveFoto(id,1);
            }

            VisualizzazioneImmobile visualizzazioneImmobile = new VisualizzazioneImmobile();
            visualizzazioneImmobile.setIdAppartamento(appartamento.get(i).getIdAppartamento());
            visualizzazioneImmobile.setFoto(foto);
            visualizzazioneImmobile.setNomeAppartamento(appartamento.get(i).getNomeAppartamento());
            visualizzazioneImmobile.setDescrizioneAppartamento(appartamento.get(i).getDescrizioneAppartamento());
            visualizzazioneImmobile.setCamereLetto(appartamento.get(i).getCamereLetto());
            visualizzazioneImmobile.setBagni(appartamento.get(i).getBagni());
            visualizzazioneImmobile.setSuperficie(appartamento.get(i).getSuperficie());
            visualizzazioneImmobile.setData(appartamento.get(i).getData());
            visualizzazioneImmobile.setCategoria(appartamento.get(i).getCategoria());
            visualizzazioneImmobile.setPrezzo(appartamento.get(i).getPrezzo());
            visualizzazioneImmobile.setVisualizzaPrezzo(appartamento.get(i).getVisualizzaPrezzo());
            immobili.add(visualizzazioneImmobile);
        }

        request.getSession().setAttribute("visualizzazione-immobile", immobili);
        request.getSession().setAttribute("entrato-immobili", "si");
        request.getRequestDispatcher("gestione-lista-immobili.jsp").forward(request, response);
    }
}
