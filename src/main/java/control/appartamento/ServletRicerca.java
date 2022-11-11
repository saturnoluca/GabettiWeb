package control.appartamento;

import UtilityClass.Ricerca;
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
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "ServletRicerca", value = "/Ricerca")
public class ServletRicerca extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Ricerca ricerca = new Ricerca();
        String regione = request.getParameter("hidden-regione");
        if (regione.equals("Qualsiasi")) {
            ricerca.setRegione(null);
        } else {
            ricerca.setRegione(regione);
        }
        String provincia = request.getParameter("hidden-provincia");
        if (provincia.equals("Qualsiasi")) {
            ricerca.setProvincia(null);
        } else {
            ricerca.setProvincia(provincia);
        }
        String citta = request.getParameter("hidden-citta");
        if (citta.equals("Qualsiasi")) {
            ricerca.setCittà(null);
        } else {
            ricerca.setCittà(citta);
        }
        String zona = request.getParameter("hidden-zona");
        if (zona.equals("Qualsiasi")) {
            ricerca.setZona(null);
        } else {
            ricerca.setZona(zona);
        }
        String vendita = request.getParameter("hidden-stato");
        if (vendita.equals("Qualsiasi")) {
            ricerca.setVendita(null);
        } else {
            ricerca.setVendita(vendita);
        }
        String categoria = request.getParameter("hidden-tipo");
        if (categoria.equals("Qualsiasi")) {
            ricerca.setCategoria(null);
        } else {
            ricerca.setCategoria(categoria);
        }
        String camere = request.getParameter("hidden-minCamere");
        if (camere.equals("Qualsiasi")) {
            ricerca.setLetti(-1);
        } else {
            ricerca.setLetti(Integer.parseInt(camere));
        }
        String bagni = request.getParameter("hidden-minBagni");
        if (bagni.equals("Qualsiasi")) {
            ricerca.setBagni(null);
        } else {
            ricerca.setBagni(bagni);
        }
        String prezzoMin = request.getParameter("minPrezzo_immobile");
        if (prezzoMin == null || prezzoMin.equals("")) {
            ricerca.setMinPrezzo(-1);
        } else {
            ricerca.setMinPrezzo(Float.parseFloat(prezzoMin));
        }
        String prezzoMax = request.getParameter("maxPrezzo_immobile");
        if (prezzoMax == null || prezzoMax.equals("")) {
            ricerca.setMaxPrezzo(-1);
        } else {
            ricerca.setMaxPrezzo(Float.parseFloat(prezzoMax));
        }
        String posti = request.getParameter("hidden-minAuto");
        if (posti.equals("Qualsiasi")) {
            ricerca.setMinGarage(-1);
        } else {
            ricerca.setMinGarage(Integer.parseInt(posti));
        }
        String minSuperfice = request.getParameter("minSuperficie_immobile");
        if (minSuperfice == null || minSuperfice.equals("")) {
            ricerca.setMinSuperficie(-1);
        } else {
            ricerca.setMinSuperficie(Float.parseFloat(minSuperfice));
        }
        String maxSuperfice = request.getParameter("maxSuperficie_immobile");
        if (maxSuperfice == null || maxSuperfice.equals("")) {
            ricerca.setMaxSuperficie(-1);
        } else {
            ricerca.setMaxSuperficie(Float.parseFloat(maxSuperfice));
        }

        AppartamentoModelDM appartamentoModelDM = new AppartamentoModelDM();
        ArrayList<AppartamentoBean> arrayApp = null;
        arrayApp = appartamentoModelDM.barraRicerca(ricerca);

        request.getSession().setAttribute("ricercaString", "ricerca");
        request.getSession().setAttribute("ricerca", arrayApp);
        response.sendRedirect("RicercaAppartamenti?ordina=default");
    }

    public UtenteBean nomeCognome(String agente) {
        int iend = agente.indexOf(" ");
        String nome = null;
        String cognome = null;
        if (iend != -1) {
            nome = agente.substring(0, iend);
            cognome = agente.substring(iend, agente.length() - 1);
        }
        UtenteModelDM utenteModelDM = new UtenteModelDM();
        UtenteBean utenteBean;
        utenteBean = utenteModelDM.RetrieveNomeCognome(nome, cognome);
        return utenteBean;
    }
}
