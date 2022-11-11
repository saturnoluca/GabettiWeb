package control.appartamento;

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

@WebServlet(name = "ScegliRegione", value = "/ScegliRegione")
public class ScegliRegione extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StringBuilder sb = new StringBuilder();
        JSONArray array = new JSONArray();

        ArrayList<String> listaRegioni = null;
        try {
            int i = 0;
            listaRegioni = new ArrayList<String>();
            String currentPath = new java.io.File(".").getCanonicalPath();
            System.out.println("current " + currentPath);
            File myObj = new File(currentPath +"/webapps/GabettiNocera/ITALIA.txt");
            Scanner myReader = new Scanner(myObj);
            while (myReader.hasNextLine()) {
                String data = myReader.nextLine();
                String segments[] = data.split("\t");
                String regione = segments[1];
                if (i == 0) {
                    listaRegioni.add(regione);
                } else {
                    if (!regione.equals(listaRegioni.get(listaRegioni.size()-1))) {
                        listaRegioni.add(regione);
                    }
                }
                i++;
            }
            myReader.close();
        } catch (FileNotFoundException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }
        for(int i = 0;i<listaRegioni.size();i++){
            array.put(toJson1(listaRegioni.get(i)));
        }
        response.getWriter().print(array);
    }

    public JSONObject toJson1(String regione){
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
}
