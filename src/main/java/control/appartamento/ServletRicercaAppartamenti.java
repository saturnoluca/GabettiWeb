package control.appartamento;

import UtilityClass.CompositeKeyAgenteCase;
import UtilityClass.VisualizzazioneImmobile;
import model.agente.AgenteBean;
import model.agente.AgenteModelDM;
import model.appartamento.AppartamentoBean;
import model.appartamento.AppartamentoModelDM;
import model.multimedia.MultimediaBean;
import model.multimedia.MultimediaModelDM;
import model.utente.UtenteBean;
import model.utente.UtenteModelDM;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "ServletRicercaAppartamenti", value = "/ServletRicercaAppartamenti")
public class ServletRicercaAppartamenti extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("ricercaString").equals("ricerca")) {
            ArrayList<AppartamentoBean> arrayList = (ArrayList<AppartamentoBean>) request.getSession().getAttribute("ricerca");
            String numeroString = request.getParameter("numero");

            int num = 0;
            int sizeArray = 0;
            String sizeArrayString = null;
            if (numeroString == null) {
                num = 1;
            } else {
                num = Integer.parseInt(numeroString);
            }
            MultimediaModelDM multimediaModelDM = new MultimediaModelDM();
            AppartamentoModelDM appartamentoModelDM = new AppartamentoModelDM();
            ArrayList<AppartamentoBean> appArray2 = new ArrayList<AppartamentoBean>();
            AgenteModelDM agenteModelDM = new AgenteModelDM();
            ArrayList<AgenteBean> agenteArray = new ArrayList<AgenteBean>();
            UtenteModelDM utenteModelDM = new UtenteModelDM();
            ArrayList<UtenteBean> utenteArray = new ArrayList<UtenteBean>();
            ArrayList<CompositeKeyAgenteCase> arrayComp = new ArrayList<CompositeKeyAgenteCase>();
            ArrayList<MultimediaBean> multimediaBeans = new ArrayList<MultimediaBean>();
            sizeArray = (int) Math.ceil((double) arrayList.size() / 10);
            sizeArrayString = Integer.toString(sizeArray);
            agenteArray = (ArrayList<AgenteBean>) agenteModelDM.RetrieveAgente();
            utenteArray = (ArrayList<UtenteBean>) utenteModelDM.doRetrieveAll();
            arrayComp = (ArrayList<CompositeKeyAgenteCase>) agenteModelDM.RetrieveAgenteCase();
            VisualizzazioneImmobile visualizzazione = new VisualizzazioneImmobile();
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
            visualizzazione.setFoto(multimediaModelDM.doRetrieveFoto(ordinamento.get(0).getIdAppartamento()).get(0));
            ArrayList<MultimediaBean> multi = new ArrayList<MultimediaBean>();
            multi = multimediaModelDM.RetrieveAllMultimedia();


            if (arrayList != null) {
                if (arrayList.size() < 10) {
                    request.setAttribute("multimedia", multi);
                    request.setAttribute("featured",visualizzazione);
                    request.setAttribute("array", arrayList);
                    request.setAttribute("arrayAgente", agenteArray);
                    request.setAttribute("arrayUtente", utenteArray);
                    request.setAttribute("sizeArray", sizeArrayString);
                    request.setAttribute("arrayComp", arrayComp);
                    RequestDispatcher rd = request.getRequestDispatcher("/listaappartamenti.jsp");
                    rd.forward(request, response);
                } else if (arrayList.size() < num * 10) {
                    for (int i = (num - 1) * 10; i < arrayList.size(); i++) {
                        appArray2.add(arrayList.get(i));
                    }
                    request.setAttribute("multimedia", multi);
                    request.setAttribute("featured",visualizzazione);
                    request.setAttribute("array", appArray2);
                    request.setAttribute("arrayAgente", agenteArray);
                    request.setAttribute("arrayUtente", utenteArray);
                    request.setAttribute("sizeArray", sizeArrayString);
                    request.setAttribute("arrayComp", arrayComp);
                    RequestDispatcher rd = request.getRequestDispatcher("/listaappartamenti.jsp");
                    rd.forward(request, response);
                } else if (arrayList.size() > num * 10) {
                    for (int i = (num - 1) * 10; i < (num * 10); i++) {
                        appArray2.add(arrayList.get(i));
                    }
                    request.setAttribute("multimedia", multi);
                    request.setAttribute("featured",visualizzazione);
                    request.setAttribute("array", appArray2);
                    request.setAttribute("arrayAgente", agenteArray);
                    request.setAttribute("arrayUtente", utenteArray);
                    request.setAttribute("sizeArray", sizeArrayString);
                    request.setAttribute("arrayComp", arrayComp);
                    RequestDispatcher rd = request.getRequestDispatcher("/listaappartamentiricerca.jsp");
                    rd.forward(request, response);
                }
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
