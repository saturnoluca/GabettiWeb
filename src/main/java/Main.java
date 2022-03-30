import UtilityClass.Ricerca;
import model.agente.AgenteBean;
import model.agente.AgenteModelDM;
import model.appartamento.AppartamentoBean;
import model.appartamento.AppartamentoModelDM;
import model.multimedia.MultimediaBean;
import model.multimedia.MultimediaModelDM;
import model.utente.UtenteBean;
import model.utente.UtenteModelDM;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        MultimediaModelDM multimediaModelDM = new MultimediaModelDM();
        AppartamentoModelDM appartamentoModelDM = new AppartamentoModelDM();
        ArrayList<AppartamentoBean> appartamentoBeans = new ArrayList<>();
        ArrayList<MultimediaBean> multimedia = new ArrayList<>();
        try {
            appartamentoBeans = (ArrayList<AppartamentoBean>) appartamentoModelDM.RetrieveAllAppartamento();
            multimedia = multimediaModelDM.RetrieveAll(appartamentoBeans);
        } catch (Exception e) {
            e.printStackTrace();
        }

        for (MultimediaBean multimediaBean : multimedia) {
            System.out.println(multimediaBean.getFotoString());
        }
    }
}
