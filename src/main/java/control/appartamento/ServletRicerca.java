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

@WebServlet(name = "ServletRicerca", value = "/ServletRicerca")
public class ServletRicerca extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Ricerca ricerca = new Ricerca();
        String città = request.getParameter("localita_immobile");
        if (città.equals("Qualsiasi")) {
            ricerca.setCittà(null);
        } else {
            System.out.println(città);
            ricerca.setCittà(città);
        }
        String vendita = request.getParameter("stato_immobile");
        if (vendita.equals("Qualsiasi")) {
            ricerca.setVendita(null);
        } else {
            ricerca.setVendita(vendita);
        }
        String categoria = request.getParameter("tipo_immobile");
        if (categoria.equals("Qualsiasi")) {
            ricerca.setCategoria(null);
        } else {
            ricerca.setCategoria(categoria);
        }
        String camere = request.getParameter("camere_immobile");
        if (camere.equals("Qualsiasi")) {
            ricerca.setLetti(-1);
        } else {
            ricerca.setLetti(Integer.parseInt(camere));
        }
        String bagni = request.getParameter("bagni_immobile");
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
        String posti = request.getParameter("auto_immobile");
        if (posti.equals("Qualsiasi")) {
            ricerca.setMinGarage(-1);
        } else {
            ricerca.setMinGarage(Integer.parseInt(posti));
        }
        String agente = request.getParameter("agente_immobile");
        if (agente.equals("Qualsiasi")) {
            ricerca.setAgente(-1);
        } else {
            UtenteBean utenteBean;
            utenteBean = nomeCognome(agente);
            AgenteBean agenteBean = new AgenteBean();
            AgenteModelDM agenteModelDM = new AgenteModelDM();
            try {
                agenteBean = agenteModelDM.RetrieveAgenteByIdUtente(utenteBean.getIdUtente());
            } catch (SQLException e) {
                e.printStackTrace();
            }
            ricerca.setAgente(agenteBean.getIdAgente());
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
        try {
            arrayApp = appartamentoModelDM.barraRicerca(ricerca);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.getSession().setAttribute("ricercaString", "ricerca");
        request.getSession().setAttribute("ricerca", arrayApp);
        response.sendRedirect("ServletRicercaAppartamenti");
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
