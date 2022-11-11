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

@WebServlet(name = "ScegliCitta", value = "/ScegliCitta")
public class ScegliCitta extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String provinciaScelta = request.getParameter("provincia");
        if(provinciaScelta.equals("Forlì-Cesena")){
            provinciaScelta = "Forl&igrave;-Cesena";
        }
        StringBuilder sb = new StringBuilder();

        JSONArray array = new JSONArray();

        ArrayList<String> listaCitta = null;
        try {
            int i = 0;
            listaCitta = new ArrayList<String>();
            String currentPath = new java.io.File(".").getCanonicalPath();
            File myObj = new File(currentPath +"/webapps/GabettiNocera/ITALIA.txt");
            Scanner myReader = new Scanner(myObj);
            while (myReader.hasNextLine()) {
                String data = myReader.nextLine();
                String segments[] = data.split("\t");
                String provincia = segments[2];
                if(provincia.equals(provinciaScelta)){
                    String citta = segments[0];
                    if (i == 0) {
                        listaCitta.add(citta);
                    } else {
                        if (!citta.equals(listaCitta.get(listaCitta.size()-1))) {
                            listaCitta.add(citta);
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
        for(int i = 0;i<listaCitta.size();i++){
            array.put(toJson1(listaCitta.get(i)));
        }
        response.getWriter().print(array);
    }

    public JSONObject toJson1(String provincia){
        String myJson="";
        myJson=myJson+"{\"citta\":\""+provincia+"\"\n},";
        JSONObject obj = null;
        try {
            obj = new JSONObject(myJson);
        } catch (JSONException e) {
            throw new RuntimeException(e);
        }
        return obj;
    }
}
