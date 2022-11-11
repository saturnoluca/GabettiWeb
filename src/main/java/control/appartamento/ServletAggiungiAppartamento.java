package control.appartamento;

import model.agente.AgenteModelDM;
import model.appartamento.AppartamentoBean;
import model.appartamento.AppartamentoModelDM;
import model.indirizzo.IndirizzoBean;
import model.indirizzo.IndirizzoModelDM;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

@WebServlet(name = "ServletAggiungiAppartamento", value = "/AggiungiAppartamento")
public class ServletAggiungiAppartamento extends HttpServlet {

    private static AppartamentoModelDM appartamentoModelDM = new AppartamentoModelDM();
    private static IndirizzoModelDM indirizzoModelDM = new IndirizzoModelDM();
    private static AgenteModelDM agenteModelDM = new AgenteModelDM();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int key = 0;
        String ruolo = request.getParameter("ruolo");
        String titoloImmobile = request.getParameter("titoloImmobile");
        String regione = request.getParameter("hidden_regione");
        String citta = request.getParameter("hidden_citta");
        String provincia = request.getParameter("hidden_provincia");
        String indirizzo = request.getParameter("indirizzo");
        String numeroCivico = request.getParameter("numeroCivico");
        String cap = request.getParameter("cap");
        String zona = request.getParameter("zona");
        String descrizione = request.getParameter("descrizione");
        float prezzo = Float.parseFloat(request.getParameter("prezzo"));
        String visualizzazionePrezzo = request.getParameter("visualizzazionePrezzo");
        String tipoImmobile = request.getParameter("tipoImmobile");
        String statoAppartamento = request.getParameter("statoImmobile");
        float superficie = Float.parseFloat(request.getParameter("superficie"));
        String locali = request.getParameter("locali");
        String piano = request.getParameter("piano");
        int postiAuto = Integer.parseInt(request.getParameter("postiAuto"));
        String bagni = request.getParameter("numeroBagni");
        int camereLetto = Integer.parseInt(request.getParameter("camereLetto"));
        String riscaldamento = request.getParameter("riscaldamento");
        String classeEnergetica = request.getParameter("classeEnergetica");


        Date date = Date.valueOf(request.getParameter("data"));

        AppartamentoBean bean = new AppartamentoBean();
        int idAg = 0;
        if (ruolo.equals("Agente") || ruolo.equals("Collaboratore")) {
            idAg = Integer.parseInt(request.getParameter("Agente"));
            bean.setIdAgente(agenteModelDM.RetrieveAgenteByIdUtente(idAg).getIdAgente());
        }
        else{
            idAg = Integer.parseInt(request.getParameter("Admin"));
            bean.setIdAgente(agenteModelDM.RetrieveAgenteByIdUtente(idAg).getIdAgente());
        }
        bean.setNomeAppartamento(titoloImmobile);
        bean.setDescrizioneAppartamento(descrizione);
        bean.setPrezzo(prezzo);
        if (visualizzazionePrezzo.equals("Si")) {
            bean.setVisualizzaPrezzo(1);
        } else if (visualizzazionePrezzo.equals("No")) {
            bean.setVisualizzaPrezzo(0);
        }
        bean.setTipoVendita(statoAppartamento);
        bean.setSuperficie(superficie);
        bean.setLocali(locali);
        bean.setPiano(piano);
        bean.setPostoAuto(postiAuto);
        bean.setBagni(bagni);
        bean.setCamereLetto(camereLetto);
        bean.setRiscaldamento(riscaldamento);
        bean.setClasseEnergetica(classeEnergetica);
        bean.setCategoria(tipoImmobile);
        bean.setData(date);
        System.out.println("immobile " + bean);
        key = appartamentoModelDM.doSave(bean);
        IndirizzoBean indirizzoBean = new IndirizzoBean();
        indirizzoBean.setRegione(regione);
        indirizzoBean.setProvincia(provincia);
        indirizzoBean.setCitta(citta);
        indirizzoBean.setVia(indirizzo);
        indirizzoBean.setNumeroCivico(numeroCivico);
        indirizzoBean.setCap(cap);
        indirizzoBean.setZona(zona);

        indirizzoBean.setIdAppartamento(key);

        indirizzoModelDM.doSave(indirizzoBean);

        request.setAttribute("idAppartamento", key);
        RequestDispatcher rd = request.getRequestDispatcher("/aggiungi-immobile-galleria.jsp");
        rd.forward(request, response);

    }
}
