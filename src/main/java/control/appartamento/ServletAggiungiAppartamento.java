package control.appartamento;

import model.appartamento.AppartamentoBean;
import model.appartamento.AppartamentoModelDM;
import model.indirizzo.IndirizzoBean;
import model.indirizzo.IndirizzoModelDM;

import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

@WebServlet(name = "ServletAggiungiAppartamento", value = "/ServletAggiungiAppartamento")
public class ServletAggiungiAppartamento extends HttpServlet {

    private static AppartamentoModelDM appartamentoModelDM = new AppartamentoModelDM();
    private static IndirizzoModelDM indirizzoModelDM = new IndirizzoModelDM();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int key=0;
        String ruolo = request.getParameter("ruolo");
        String zona = request.getParameter("zona");
        String titoloImmobile = request.getParameter("titoloImmobile");
        String citta = request.getParameter("citta");
        String provincia = request.getParameter("provincia");
        String indirizzo = request.getParameter("indirizzo");
        String numeroCivico = request.getParameter("numeroCivico");
        String cap = request.getParameter("cap");
        String descrizione = request.getParameter("descrizione");
        float prezzo = Float.parseFloat(request.getParameter("prezzo"));
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
        int idAgente = Integer.parseInt(request.getParameter("Agente"));
        Date date = Date.valueOf(request.getParameter("data"));

        AppartamentoBean bean = new AppartamentoBean();
        bean.setIdAgente(idAgente);
        bean.setNomeAppartamento(titoloImmobile);
        bean.setDescrizioneAppartamento(descrizione);
        bean.setPrezzo(prezzo);
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
        try {
            key=appartamentoModelDM.doSave(bean);
        }catch(SQLException e){
            e.printStackTrace();
        }
        System.out.println(key);
        IndirizzoBean indirizzoBean = new IndirizzoBean();
        indirizzoBean.setProvincia(provincia);
        indirizzoBean.setCitta(citta);
        indirizzoBean.setVia(indirizzo);
        indirizzoBean.setNumeroCivico(numeroCivico);
        indirizzoBean.setCap(cap);
        indirizzoBean.setZona("Foce");

        indirizzoBean.setIdAppartamento(key);

        try{
            indirizzoModelDM.doSave(indirizzoBean);
        }catch(SQLException e){
            e.printStackTrace();
        }

        request.setAttribute("idAppartamento", key);
        RequestDispatcher rd = request.getRequestDispatcher("/aggiungi-immobile-galleria.jsp");
        rd.forward(request, response);

    }
}
