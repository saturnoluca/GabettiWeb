package control.agente;

import UtilityClass.CompositeKeyAgenteCase;
import UtilityClass.VisualizzazioneImmobile;
import model.agente.AgenteBean;
import model.agente.AgenteModelDM;
import model.appartamento.AppartamentoBean;
import model.appartamento.AppartamentoModelDM;
import model.collaboratore.CollaboratoreBean;
import model.collaboratore.CollaboratoreModelDM;
import model.multimedia.MultimediaBean;
import model.multimedia.MultimediaModelDM;
import model.utente.UtenteBean;
import model.utente.UtenteModelDM;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ServletAgentiPage", value = "/ServletAgentiPage")
public class ServletAgentiPage extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static AgenteModelDM modelAgenti = new AgenteModelDM();
    private static UtenteModelDM modelUtente = new UtenteModelDM();
    private static AppartamentoModelDM modelAppartamento = new AppartamentoModelDM();
    private static CollaboratoreModelDM modelCollaboratore = new CollaboratoreModelDM();
    private static MultimediaModelDM modelMultimedia = new MultimediaModelDM();
    private static AppartamentoModelDM appartamentoModelDM = new AppartamentoModelDM();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<UtenteBean> utente = new ArrayList<UtenteBean>();
        ArrayList<CompositeKeyAgenteCase> agentiCase = new ArrayList<CompositeKeyAgenteCase>();
        ArrayList<AppartamentoBean> inEvidenza = new ArrayList<AppartamentoBean>();
        ArrayList<CollaboratoreBean> collaboratoreBeans = new ArrayList<CollaboratoreBean>();
        ArrayList<MultimediaBean> multimediaBeans = new ArrayList<MultimediaBean>();
        VisualizzazioneImmobile visualizzazione = new VisualizzazioneImmobile();
        try {
            if (request.getSession().getAttribute("NoDbConnection") != null) {
                modelAgenti = null;
                modelUtente = null;
                modelAppartamento = null;
                modelCollaboratore = null;
                modelMultimedia=null;
            }
            agentiCase = (ArrayList<CompositeKeyAgenteCase>) modelAgenti.RetrieveAgenteCase();
            utente = (ArrayList<UtenteBean>) modelUtente.doRetrieveAll();
            inEvidenza = (ArrayList<AppartamentoBean>) modelAppartamento.OrderByVisite();
            collaboratoreBeans = (ArrayList<CollaboratoreBean>) modelCollaboratore.RetrieveAllCollaboratore();
            multimediaBeans=modelMultimedia.RetrieveAllMultimedia();
            ArrayList<AppartamentoBean> ordinamento = (ArrayList<AppartamentoBean>) appartamentoModelDM.OrderByVisite();
            visualizzazione.setIdAppartamento(ordinamento.get(0).getIdAppartamento());
            visualizzazione.setTipoVendita(ordinamento.get(0).getTipoVendita());
            visualizzazione.setNomeAppartamento(ordinamento.get(0).getNomeAppartamento());
            visualizzazione.setDescrizioneAppartamento(ordinamento.get(0).getDescrizioneAppartamento());
            visualizzazione.setSuperficie(ordinamento.get(0).getSuperficie());
            visualizzazione.setBagni(ordinamento.get(0).getBagni());
            visualizzazione.setCamereLetto(ordinamento.get(0).getCamereLetto());
            visualizzazione.setData(ordinamento.get(0).getData());
            visualizzazione.setPrezzo(ordinamento.get(0).getPrezzo());
            visualizzazione.setVisualizzaPrezzo(ordinamento.get(0).getVisualizzaPrezzo());
            visualizzazione.setFoto(modelMultimedia.doRetrieveFoto(ordinamento.get(0).getIdAppartamento()).get(0));
        } catch (Exception e) {
            e.printStackTrace();
        }
        ArrayList<UtenteBean> utenti = new ArrayList<UtenteBean>();
        for(UtenteBean u : utente){
            if(u.getRuolo().equals("Collaboratore")||u.getRuolo().equals("Agente")){
                utenti.add(u);
            }
        }
        request.setAttribute("featured",visualizzazione);
        request.setAttribute("multimedia", multimediaBeans);
        request.setAttribute("utenti", utenti);
        request.setAttribute("agentiCase", agentiCase);
        request.setAttribute("inEvidenza", inEvidenza);
        request.setAttribute("collaboratori", collaboratoreBeans);
        RequestDispatcher rd = request.getRequestDispatcher("/listaagenti.jsp");
        rd.forward(request, response);
    }

}
