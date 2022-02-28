package model.multimedia;

import model.appartamento.AppartamentoBean;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

public interface MultimediaModel<T> {
    public void doSaveFoto(MultimediaBean multi) throws SQLException, IOException;
    
    public void doSaveVideo(MultimediaBean multi) throws SQLException, IOException;

    public ArrayList<String> doRetrieveFoto(int idAppartamento) throws SQLException, IOException;

    public ArrayList<String> doRetrieveVideo(int idAppartamento) throws SQLException, IOException;

    public ArrayList<String> doRetrievePlanimetria(int idAppartamento) throws SQLException, IOException;

    public ArrayList<MultimediaBean> RetrieveAll(ArrayList<AppartamentoBean> arrayAppartamento) throws SQLException, IOException;
}
