package control.appartamento;

import model.appartamento.AppartamentoBean;
import model.indirizzo.IndirizzoBean;
import model.multimedia.MultimediaBean;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Scanner;

@WebServlet(name = "ScegliProvincia", value = "/ScegliProvincia")
public class ScegliProvincia extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String regioneScelta = request.getParameter("regione");

        StringBuilder sb = new StringBuilder();

        JSONArray array = new JSONArray();

        ArrayList<String> listaProvince = null;
        try {
            int i = 0;
            listaProvince = new ArrayList<String>();
            String currentPath = new java.io.File(".").getCanonicalPath();
            File myObj = new File(currentPath +"/webapps/GabettiNocera/ITALIA.txt");
            Scanner myReader = new Scanner(myObj);
            while (myReader.hasNextLine()) {
                String data = myReader.nextLine();
                String segments[] = data.split("\t");
                String regione = segments[1];
                if(regione.equals(regioneScelta)){
                    String provincia = segments[2];

                    if (i == 0) {
                        listaProvince.add(provincia);
                    } else {
                        if (!provincia.equals(listaProvince.get(listaProvince.size()-1))) {
                            listaProvince.add(provincia);
                        }
                    }
                    i++;
                }
            }
            myReader.close();
        } catch (FileNotFoundException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }
        for(int i = 0;i<listaProvince.size();i++){
            array.put(toJson1(listaProvince.get(i)));
        }
        response.getWriter().print(array);
    }

    public JSONObject toJson1(String provincia){
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
}
