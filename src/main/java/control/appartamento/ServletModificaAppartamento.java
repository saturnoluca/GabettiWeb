package control.appartamento;

import model.agente.AgenteBean;
import model.agente.AgenteModelDM;
import model.appartamento.AppartamentoBean;
import model.appartamento.AppartamentoModelDM;
import model.indirizzo.IndirizzoBean;
import model.indirizzo.IndirizzoModelDM;
import model.multimedia.MultimediaBean;
import model.multimedia.MultimediaModelDM;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

@WebServlet(name = "ServletModificaAppartamento", value = "/ServletModificaAppartamento")
public class ServletModificaAppartamento extends HttpServlet {

    private static AppartamentoModelDM appartamentoModelDM = new AppartamentoModelDM();
    private static IndirizzoModelDM indirizzoModelDM = new IndirizzoModelDM();

    private static MultimediaModelDM multimediaModelDM = new MultimediaModelDM();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idAppartamento = Integer.parseInt(request.getParameter("idAppartamento"));
        String titoloImmobile = request.getParameter("titoloImmobile");
        String citta = request.getParameter("citta");
        String provincia = request.getParameter("provincia");
        String indirizzo = request.getParameter("indirizzo");
        String numeroCivico = request.getParameter("numeroCivico");
        String cap = request.getParameter("cap");
        String zona = request.getParameter("zona");
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
        bean.setIdAppartamento(idAppartamento);
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
        appartamentoModelDM.doUpdate(bean);

        IndirizzoBean indirizzoBean = new IndirizzoBean();
        indirizzoBean.setProvincia(provincia);
        indirizzoBean.setCitta(citta);
        indirizzoBean.setVia(indirizzo);
        indirizzoBean.setNumeroCivico(numeroCivico);
        indirizzoBean.setCap(cap);
        indirizzoBean.setZona(zona);

        indirizzoBean.setIdAppartamento(bean.getIdAppartamento());

        indirizzoModelDM.doUpdate(indirizzoBean);
        ArrayList<MultimediaBean> listaFoto = new ArrayList<MultimediaBean>();
        MultimediaBean multimedia = new MultimediaBean();

        try {
            ArrayList<AppartamentoBean> appartamentoBeans = new ArrayList<AppartamentoBean>();
            appartamentoBeans.add(bean);
            listaFoto = multimediaModelDM.RetrieveAll(appartamentoBeans);
            for(MultimediaBean foto: listaFoto){
                if(bean.getIdAppartamento() == foto.getIdAppartamento() && foto.getFotoString() != null){
                    multimedia.setIdMultimedia(foto.getIdMultimedia());
                    multimedia.setIdAppartamento(foto.getIdAppartamento());
                    multimedia.setFotoString(foto.getFotoString());
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("lista-foto",multimedia);
        RequestDispatcher rd = request.getRequestDispatcher("modifica-immobile-galleria.jsp");
        rd.forward(request, response);

    }
}
