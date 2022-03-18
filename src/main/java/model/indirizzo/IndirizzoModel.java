package model.indirizzo;

import UtilityClass.Città;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

public interface IndirizzoModel<T> {
    public void doSave(IndirizzoBean indirizzo) throws SQLException;

    public IndirizzoBean RetrieveIndirizzoByAppId(int id) throws SQLException;

    public Collection<IndirizzoBean> RetrieveAll() throws SQLException;

    public Città RetrieveCittàZone(String zona) throws SQLException;

    public boolean isCittà(String zona) throws SQLException;

    public ArrayList<String> RetrieveAllCittà() throws SQLException;

    public ArrayList<Città> RetrieveAllCittàZone(ArrayList<String> città) throws SQLException;
}
