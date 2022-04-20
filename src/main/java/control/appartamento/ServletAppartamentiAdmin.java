package control.appartamento;

import UtilityClass.VisualizzazioneImmobile;
import model.appartamento.AppartamentoBean;
import model.appartamento.AppartamentoModelDM;
import model.multimedia.MultimediaBean;
import model.multimedia.MultimediaModelDM;
import model.utente.UtenteBean;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "ServletAppartamentiAdmin", value = "/ServletAppartamentiAdmin")
public class ServletAppartamentiAdmin extends HttpServlet {
    AppartamentoModelDM appartamentoModelDM = new AppartamentoModelDM();
    MultimediaModelDM multimediaModelDM = new MultimediaModelDM();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        UtenteBean utente = (UtenteBean) session.getAttribute("utente");

        ArrayList<AppartamentoBean> appartamento = new ArrayList<AppartamentoBean>();
        ArrayList<MultimediaBean> multimedia = new ArrayList<MultimediaBean>();
        ArrayList<VisualizzazioneImmobile> immobili = new ArrayList<VisualizzazioneImmobile>();
        String foto;
        try{
            if(utente.getRuolo().equals("Admin") || utente.getRuolo().equals("Segretario")){
                appartamento = (ArrayList<AppartamentoBean>)  appartamentoModelDM.OrderByData();
            }
            else if(utente.getRuolo().equals("Agente") || utente.getRuolo().equals("Collaboratore")){
                appartamento = (ArrayList<AppartamentoBean>)  appartamentoModelDM.RetrieveAllByAgente(utente.getIdUtente());
            }
            for(int i = 0; i < appartamento.size(); i++){
                int id = appartamento.get(i).getIdAppartamento();
                if(multimediaModelDM.doRetrieveFoto(id).size() == 0)
                    foto  = null;
                else
                    foto = multimediaModelDM.doRetrieveFoto(id).get(0);
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
                immobili.add(visualizzazioneImmobile);
            }

        } catch (SQLException e){
            e.printStackTrace();
        }
        request.getSession().setAttribute("visualizzazione-immobile", immobili);
        request.getSession().setAttribute("entrato-immobili","si");
        request.getRequestDispatcher("gestione-lista-immobili.jsp").forward(request,response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
