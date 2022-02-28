package model.indirizzo;

import java.sql.SQLException;
import java.util.Collection;

public interface IndirizzoModel<T> {
    public void doSave(IndirizzoBean indirizzo) throws SQLException;

    public IndirizzoBean RetrieveIndirizzoByAppId(int id) throws SQLException;

    public Collection<IndirizzoBean> RetrieveAll() throws SQLException;

}
