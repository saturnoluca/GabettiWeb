package control;

import model.appartamento.AppartamentoBean;
import model.appartamento.AppartamentoModelDM;
import model.indirizzo.IndirizzoBean;
import model.indirizzo.IndirizzoModelDM;
import model.multimedia.MultimediaBean;
import model.multimedia.MultimediaModelDM;
import org.json.JSONArray;
import org.json.JSONObject;

import javax.json.Json;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "ServletProvaJson", value = "/ServletProvaJson")
public class ServletProvaJson extends HttpServlet {
    public static AppartamentoModelDM app = new AppartamentoModelDM();
    public static MultimediaModelDM multi = new MultimediaModelDM();
    public static IndirizzoModelDM indirizzo = new IndirizzoModelDM();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idAppartamenti = request.getParameter("idAppartamenti");
        idAppartamenti=idAppartamenti.substring(1, idAppartamenti.length()-1);
        idAppartamenti=idAppartamenti+",1";
        String numero = "";
        String carattere = "";
        StringBuilder sb = new StringBuilder();
        ArrayList<Integer> idApps = new ArrayList<Integer>();
        for (int i = 0; i < idAppartamenti.length(); i++) {
            carattere = ""+idAppartamenti.charAt(i);
            System.out.println(carattere);
            if (!carattere.equals(",") || i==idAppartamenti.length()-1) {
                sb.append(idAppartamenti.charAt(i));
            } else {
                numero=sb.toString();
                idApps.add(Integer.parseInt(numero));
                sb = new StringBuilder();
                numero = null;
                carattere= null;
            }
        }
        System.out.println(idApps);
        ArrayList<AppartamentoBean> appartamenti = new ArrayList<AppartamentoBean>();
        for(int i =0;i< idApps.size();i++){
            appartamenti.add(app.RetrieveById(idApps.get(i)));
        }

        ArrayList<IndirizzoBean> indirizzoBeans = new ArrayList<IndirizzoBean>();
        indirizzoBeans=(ArrayList<IndirizzoBean>) indirizzo.RetrieveAll();


        JSONArray array = new JSONArray();


        for(int i = 0;i<appartamenti.size();i++){
            for(IndirizzoBean indirizzoBean : indirizzoBeans){
                if(indirizzoBean.getIdAppartamento() == appartamenti.get(i).getIdAppartamento()){
                    array.put(toJson1(appartamenti.get(i), indirizzoBean, multi.doRetrieveFotoBean(appartamenti.get(i).getIdAppartamento())));
                }
            }
        }
        response.getWriter().print(array);
    }

    public JSONObject toJson1(AppartamentoBean appartamento, IndirizzoBean indirizzo, ArrayList<MultimediaBean> multimedia){
        String myJson="";
        myJson=myJson+"{\"idAppartamento\":\""+appartamento.getIdAppartamento()+"\",";
        myJson=myJson+"\"nome\":\""+appartamento.getNomeAppartamento()+"\",\n";
        myJson=myJson+"\"descrizione\":\""+appartamento.getDescrizioneAppartamento()+"\",";
        myJson=myJson+"\"bagni\":\""+appartamento.getBagni()+"\",\n";
        myJson=myJson+"\"letti\":\""+appartamento.getCamereLetto()+"\",";
        myJson=myJson+"\"superficie\":\""+appartamento.getSuperficie()+"\",\n";
        myJson=myJson+"\"prezzo\":\""+appartamento.getPrezzo()+"\",\n";
        myJson=myJson+"\"tipoVendita\":\""+appartamento.getTipoVendita()+"\",\n";
        myJson=myJson+"\"foto\":\""+multimedia.get(0).getFotoString().get(0)+"\",";
        myJson=myJson+"\"indirizzo\":\""+indirizzo.getVia()+", "+indirizzo.getNumeroCivico()+", "+indirizzo.getCap()+"\"\n},";
        JSONObject obj = new JSONObject(myJson);
        return obj;
    }
}
