package control.appartamento;

import model.appartamento.AppartamentoBean;
import model.appartamento.AppartamentoModelDM;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

import static java.lang.Float.parseFloat;
import static java.lang.Integer.parseInt;

@WebServlet(name = "SalvaAppartamento", value = "/SalvaAppartamento")
public class SalvaAppartamento extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AppartamentoModelDM model = new AppartamentoModelDM();
        AppartamentoBean bean = new AppartamentoBean();
        bean.setCategoria(request.getParameter("categoria"));
        bean.setNomeAppartamento(request.getParameter("nomeAppartamento"));
        bean.setDescrizioneAppartamento(request.getParameter("descrizioneAppartamneto"));
        bean.setSuperficie(parseFloat(request.getParameter("superficie")));
        bean.setLocali(request.getParameter("locali"));
        bean.setBagni(request.getParameter("bagni"));
        bean.setPiano(request.getParameter("piano"));
        bean.setRiscaldamento(request.getParameter("riscaldamento"));
        bean.setClasseEnergetica(request.getParameter("classeEnergetica"));
        bean.setTipoVendita(request.getParameter("tipoVendita"));
        bean.setPrezzo(parseFloat(request.getParameter("prezzo")));
        bean.setData(Date.valueOf(request.getParameter("data")));
        bean.setIdAgente(parseInt(request.getParameter("idAgente")));
        bean.setCamereLetto(parseInt(request.getParameter("camereLetto")));
        bean.setPostoAuto(parseInt(request.getParameter("postoAuto")));
        try{
            model.doSave(bean);
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
}
