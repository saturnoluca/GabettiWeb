package model.indirizzo;

import java.sql.SQLException;

public interface IndirizzoModel<T> {
    public void doSave(IndirizzoBean indirizzo) throws SQLException;
}
