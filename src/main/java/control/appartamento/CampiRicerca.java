package control.appartamento;


import model.appartamento.AppartamentoModelDM;
import model.indirizzo.IndirizzoModelDM;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;


@WebServlet(name = "CampiRicerca", value = "/CampiRicerca")
public class CampiRicerca extends HttpServlet {
    private static IndirizzoModelDM indirizzoModelDM = new IndirizzoModelDM();
    private static AppartamentoModelDM appartamentoModelDM = new AppartamentoModelDM();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StringBuilder sb = new StringBuilder();
        JSONArray array = new JSONArray();
        String action = request.getParameter("action");
        if(action.equals("regione")){
            ArrayList<String> listaRegioni = null;
            listaRegioni = indirizzoModelDM.RetrieveAllRegioni();
            array.put(toJsonRegione("Qualsiasi"));
            for(int i = 0;i<listaRegioni.size();i++){
                array.put(toJsonRegione(listaRegioni.get(i)));
            }
            response.getWriter().print(array);
        }
        else if(action.equals("provincia")){
            String regioneScelta = request.getParameter("regione");
            if(regioneScelta.equals("Qualsiasi")){
                ArrayList<String> listaProvince = null;
                listaProvince = indirizzoModelDM.RetrieveAllProvince();
                array.put(toJsonProvince("Qualsiasi"));
                for(int i = 0;i<listaProvince.size();i++){
                    array.put(toJsonProvince(listaProvince.get(i)));
                }
                response.getWriter().print(array);
            }
            else{
                ArrayList<String> listaProvince = null;
                listaProvince = indirizzoModelDM.RetrieveProvinciaByRegione(regioneScelta);
                array.put(toJsonProvince("Qualsiasi"));
                for(int i = 0;i<listaProvince.size();i++){
                    array.put(toJsonProvince(listaProvince.get(i)));
                }
                response.getWriter().print(array);
            }
        }
        else if(action.equals("citta")){
            String regioneScelta = request.getParameter("regione");
            String provinciaScelta = request.getParameter("provincia");
            if(!regioneScelta.equals("Qualsiasi") && provinciaScelta.equals("Qualsiasi")){
                ArrayList<String> listaCitta = null;
                listaCitta = indirizzoModelDM.RetrieveCittaByRegione(regioneScelta);
                array.put(toJsonCitta("Qualsiasi"));
                for(int i = 0;i<listaCitta.size();i++){
                    array.put(toJsonCitta(listaCitta.get(i)));
                }
                response.getWriter().print(array);
            }
            else if(regioneScelta.equals("Qualsiasi") && !provinciaScelta.equals("Qualsiasi")){
                ArrayList<String> listaCitta = null;
                listaCitta = indirizzoModelDM.RetrieveCittaByProvincia(provinciaScelta);
                array.put(toJsonCitta("Qualsiasi"));
                for(int i = 0;i<listaCitta.size();i++){
                    array.put(toJsonCitta(listaCitta.get(i)));
                }
                response.getWriter().print(array);
            }
            else if(!regioneScelta.equals("Qualsiasi") && !provinciaScelta.equals("Qualsiasi")){
                ArrayList<String> listaCitta = null;
                listaCitta = indirizzoModelDM.RetrieveCittaByProvinciaAndCitta(regioneScelta,provinciaScelta);
                array.put(toJsonCitta("Qualsiasi"));
                for(int i = 0;i<listaCitta.size();i++){
                    array.put(toJsonCitta(listaCitta.get(i)));
                }
                response.getWriter().print(array);
            }
            else if(regioneScelta.equals("Qualsiasi") && provinciaScelta.equals("Qualsiasi")){
                ArrayList<String> listaCitta = null;
                listaCitta = indirizzoModelDM.RetrieveAllCittà();
                array.put(toJsonCitta("Qualsiasi"));
                for(int i = 0;i<listaCitta.size();i++){
                    array.put(toJsonCitta(listaCitta.get(i)));
                }
                response.getWriter().print(array);
            }
        }
        else if(action.equals("zona")){
            String cittaScelta = request.getParameter("citta");
            if(!cittaScelta.equals("Qualsiasi")){
                ArrayList<String> listaZone = null;
                listaZone = indirizzoModelDM.RetrieveZonaByCitta(cittaScelta);
                array.put(toJsonZone("Qualsiasi"));
                for(int i = 0;i<listaZone.size();i++){
                    array.put(toJsonZone(listaZone.get(i)));
                }
                response.getWriter().print(array);
            }
            else if(cittaScelta.equals("Qualsiasi")){
                ArrayList<String> listaZone = null;
                listaZone = indirizzoModelDM.RetrieveZonaByCitta(cittaScelta);
                array.put(toJsonZone("Qualsiasi"));
                response.getWriter().print(array);
            }
        }
        else if(action.equals("stato")){
            ArrayList<String> listaStati = null;
            listaStati = appartamentoModelDM.RetrieveAllStati();
            array.put(toJsonStati("Qualsiasi"));
            for(int i = 0;i<listaStati.size();i++){
                array.put(toJsonStati(listaStati.get(i)));
            }
            response.getWriter().print(array);
        }
        else if(action.equals("tipo")){
            ArrayList<String> listaTipi = null;
            listaTipi = appartamentoModelDM.RetrieveAllTipoAppartamento();
            array.put(toJsonTipi("Qualsiasi"));
            for(int i = 0;i<listaTipi.size();i++){
                array.put(toJsonTipi(listaTipi.get(i)));
            }
            response.getWriter().print(array);
        }
        else if(action.equals("minCamere")){
            ArrayList<String> listaCamere = null;
            listaCamere = appartamentoModelDM.RetrieveNumeroCamereLetto();
            array.put(toJsonCamere("Qualsiasi"));
            for(int i = 0;i<listaCamere.size();i++){
                array.put(toJsonCamere(listaCamere.get(i)));
            }
            response.getWriter().print(array);
        }
        else if(action.equals("minBagni")){
            ArrayList<String> listaBagni = null;
            listaBagni = appartamentoModelDM.RetrieveNumeroBagni();
            array.put(toJsonBagni("Qualsiasi"));
            for(int i = 0;i<listaBagni.size();i++){
                array.put(toJsonBagni(listaBagni.get(i)));
            }
            response.getWriter().print(array);
        }
        else if(action.equals("minAuto")){
            ArrayList<String> listaAuto = null;
            listaAuto = appartamentoModelDM.RetrieveNumeroPostoAuto();
            array.put(toJsonAuto("Qualsiasi"));
            for(int i = 0;i<listaAuto.size();i++){
                array.put(toJsonAuto(listaAuto.get(i)));
            }
            response.getWriter().print(array);
        }
    }

    public JSONObject toJsonRegione(String regione){
        String myJson="";
        myJson=myJson+"{\"regione\":\""+regione+"\"\n},";
        JSONObject obj = null;
        try {
            obj = new JSONObject(myJson);
        } catch (JSONException e) {
            throw new RuntimeException(e);
        }
        return obj;
    }

    public JSONObject toJsonProvince(String provincia){
        String myJson="";
        myJson=myJson+"{\"provincia\":\""+provincia+"\"\n},";
        JSONObject obj = null;
        try {
            obj = new JSONObject(myJson);
        } catch (JSONException e) {
            throw new RuntimeException(e);
        }
        return obj;
    }

    public JSONObject toJsonCitta(String citta){
        String myJson="";
        myJson=myJson+"{\"citta\":\""+citta+"\"\n},";
        JSONObject obj = null;
        try {
            obj = new JSONObject(myJson);
        } catch (JSONException e) {
            throw new RuntimeException(e);
        }
        return obj;
    }

    public JSONObject toJsonZone(String zona){
        String myJson="";
        myJson=myJson+"{\"zona\":\""+zona+"\"\n},";
        JSONObject obj = null;
        try {
            obj = new JSONObject(myJson);
        } catch (JSONException e) {
            throw new RuntimeException(e);
        }
        return obj;
    }

    public JSONObject toJsonStati(String stato){
        String myJson="";
        myJson=myJson+"{\"stato\":\""+stato+"\"\n},";
        JSONObject obj = null;
        try {
            obj = new JSONObject(myJson);
        } catch (JSONException e) {
            throw new RuntimeException(e);
        }
        return obj;
    }

    public JSONObject toJsonTipi(String tipo){
        String myJson="";
        myJson=myJson+"{\"tipo\":\""+tipo+"\"\n},";
        JSONObject obj = null;
        try {
            obj = new JSONObject(myJson);
        } catch (JSONException e) {
            throw new RuntimeException(e);
        }
        return obj;
    }

    public JSONObject toJsonCamere(String camera){
        String myJson="";
        myJson=myJson+"{\"minCamere\":\""+camera+"\"\n},";
        JSONObject obj = null;
        try {
            obj = new JSONObject(myJson);
        } catch (JSONException e) {
            throw new RuntimeException(e);
        }
        return obj;
    }

    public JSONObject toJsonBagni(String bagno){
        String myJson="";
        myJson=myJson+"{\"minBagni\":\""+bagno+"\"\n},";
        JSONObject obj = null;
        try {
            obj = new JSONObject(myJson);
        } catch (JSONException e) {
            throw new RuntimeException(e);
        }
        return obj;
    }

    public JSONObject toJsonAuto(String auto){
        String myJson="";
        myJson=myJson+"{\"minAuto\":\""+auto+"\"\n},";
        JSONObject obj = null;
        try {
            obj = new JSONObject(myJson);
        } catch (JSONException e) {
            throw new RuntimeException(e);
        }
        return obj;
    }
}
