package control.appartamento;

import UtilityClass.CompositeKeyAgenteCase;
import UtilityClass.PrezzoCrescenteImmobileComparator;
import UtilityClass.PrezzoDecrescenteImmobileComparator;
import UtilityClass.VisualizzazioneImmobile;
import model.agente.AgenteBean;
import model.agente.AgenteModelDM;
import model.appartamento.AppartamentoBean;
import model.appartamento.AppartamentoModelDM;
import model.galleria.GalleriaModelDM;
import model.indirizzo.IndirizzoBean;
import model.indirizzo.IndirizzoModelDM;
import model.multimedia.MultimediaBean;
import model.multimedia.MultimediaModelDM;
import model.utente.UtenteBean;
import model.utente.UtenteModelDM;
import org.checkerframework.checker.units.qual.A;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;

@WebServlet(name = "ListaAppartamenti", value = "/ListaAppartamenti")
public class ListaAppartamenti extends HttpServlet {

    private static GalleriaModelDM galleriaModelDM = new GalleriaModelDM();
    private static AppartamentoModelDM appartamentoModelDM = new AppartamentoModelDM();
    private static IndirizzoModelDM indirizzoModelDM = new IndirizzoModelDM();
    private static UtenteModelDM utenteModelDM = new UtenteModelDM();
    private static AgenteModelDM agenteModelDM = new AgenteModelDM();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            ArrayList<AppartamentoBean> arrayList = (ArrayList<AppartamentoBean>) appartamentoModelDM.OrderByVisite();
            ArrayList<VisualizzazioneImmobile> immobili = new ArrayList<VisualizzazioneImmobile>();
            for(int i=0;i<arrayList.size(); i++){
                VisualizzazioneImmobile v = new VisualizzazioneImmobile();
                IndirizzoBean indirizzo = indirizzoModelDM.RetrieveIndirizzoByAppId(arrayList.get(i).getIdAppartamento());
                AgenteBean agenteBean = agenteModelDM.RetrieveAgenteById(arrayList.get(i).getIdAgente());
                UtenteBean utenteBean = utenteModelDM.doRetrieveUtenteByKey(agenteBean.getIdUtente());
                v.setIdAppartamento(arrayList.get(i).getIdAppartamento());
                v.setCategoria(arrayList.get(i).getCategoria());
                v.setNomeAppartamento(arrayList.get(i).getNomeAppartamento());
                v.setDescrizioneAppartamento(arrayList.get(i).getDescrizioneAppartamento());
                v.setSuperficie(arrayList.get(i).getSuperficie());
                v.setBagni(arrayList.get(i).getBagni());
                v.setVisualizzaPrezzo(arrayList.get(i).getVisualizzaPrezzo());
                v.setTipoVendita(arrayList.get(i).getTipoVendita());
                v.setPrezzo(arrayList.get(i).getPrezzo());
                v.setCamereLetto(arrayList.get(i).getCamereLetto());
                v.setIdUtente(utenteBean.getIdUtente());
                v.setNomeAgente(utenteBean.getNome());
                v.setCognomeAgente(utenteBean.getCognome());
                v.setIndirizzoBean(indirizzo);
                v.setFoto(galleriaModelDM.doRetrieveFoto(arrayList.get(i).getIdAppartamento(),1));
                immobili.add(v);
            }

            String numeroString = request.getParameter("numero");
            String ordina = request.getParameter("ordina");
            int num = 0;
            int sizeArray = 0;
            String sizeArrayString = null;
            if (numeroString == null) {
                num = 1;
            } else {
                num = Integer.parseInt(numeroString);
            }
            if(ordina.equals("prezzoCrescente")){
                Collections.sort(immobili, new PrezzoCrescenteImmobileComparator());
            }
            if(ordina.equals("prezzoDecrescente")){
                Collections.sort(immobili, new PrezzoDecrescenteImmobileComparator());
            }

            ArrayList<VisualizzazioneImmobile> appArray2 = new ArrayList<VisualizzazioneImmobile>();
            ArrayList<AgenteBean> agenteArray = new ArrayList<AgenteBean>();
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
            IndirizzoBean indirizzo = indirizzoModelDM.RetrieveIndirizzoByAppId(ordinamento.get(0).getIdAppartamento());
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
            visualizzazione.setIndirizzoBean(indirizzo);
            visualizzazione.setFoto(galleriaModelDM.doRetrieveFoto(ordinamento.get(0).getIdAppartamento(),1));
            AgenteBean agenteBean = new AgenteBean();
            UtenteBean utenteBean = new UtenteBean();
            agenteBean = agenteModelDM.RetrieveAgenteById(ordinamento.get(0).getIdAgente());
            utenteBean = utenteModelDM.doRetrieveUtenteByKey(agenteBean.getIdUtente());
            visualizzazione.setNomeAgente(utenteBean.getNome());
            visualizzazione.setCognomeAgente(utenteBean.getCognome());
            visualizzazione.setIdUtente(utenteBean.getIdUtente());
            ArrayList<MultimediaBean> multi = new ArrayList<MultimediaBean>();
            multi = galleriaModelDM.RetrieveAllMultimedia();

            if (immobili != null) {
                if (immobili.size() < 10) {
                    request.setAttribute("pagina","listaAppartamenti");
                    request.setAttribute("ordinamento", ordina);
                    request.setAttribute("multimedia", multi);
                    request.setAttribute("featured",visualizzazione);
                    request.setAttribute("array", immobili);
                    request.setAttribute("arrayAgente", agenteArray);
                    request.setAttribute("arrayUtente", utenteArray);
                    request.setAttribute("sizeArray", sizeArrayString);
                    request.setAttribute("arrayComp", arrayComp);
                    RequestDispatcher rd = request.getRequestDispatcher("/listaappartamenti.jsp");
                    rd.forward(request, response);
                } else if (arrayList.size() < num * 10) {
                    for (int i = (num - 1) * 10; i < arrayList.size(); i++) {
                        appArray2.add(immobili.get(i));
                    }
                    request.setAttribute("pagina","listaAppartamenti");
                    request.setAttribute("ordinamento", ordina);
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
                        appArray2.add(immobili.get(i));
                    }
                    request.setAttribute("pagina","listaAppartamenti");
                    request.setAttribute("ordinamento", ordina);
                    request.setAttribute("multimedia", multi);
                    request.setAttribute("featured",visualizzazione);
                    request.setAttribute("array", appArray2);
                    request.setAttribute("arrayAgente", agenteArray);
                    request.setAttribute("arrayUtente", utenteArray);
                    request.setAttribute("sizeArray", sizeArrayString);
                    request.setAttribute("arrayComp", arrayComp);
                    RequestDispatcher rd = request.getRequestDispatcher("/listaappartamenti.jsp");
                    rd.forward(request, response);
                }
            }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
