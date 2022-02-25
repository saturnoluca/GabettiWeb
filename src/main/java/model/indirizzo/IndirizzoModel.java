package model.indirizzo;

import java.sql.SQLException;

public interface IndirizzoModel<T> {
    public void doSave(IndirizzoBean indirizzo) throws SQLException;

    public IndirizzoBean RetrieveIndirizzoByAppId(int id) throws SQLException;
}
