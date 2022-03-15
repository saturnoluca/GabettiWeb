package model.collaboratore;

import java.sql.SQLException;
import java.util.ArrayList;

public interface CollaboratoreModel<T> {
    public void doSave(CollaboratoreBean bean) throws SQLException;

    public CollaboratoreBean RetrieveCollaboratore(int idCollaboratore) throws SQLException;

    public ArrayList<CollaboratoreBean> RetrieveCollaboratoreByAgente(int idAgente) throws SQLException;

    public ArrayList<CollaboratoreBean> RetrieveAllCollaboratore() throws SQLException;

}
