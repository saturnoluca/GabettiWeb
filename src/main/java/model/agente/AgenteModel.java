package model.agente;

import UtilityClass.CompositeKeyAgenteCase;

import java.sql.SQLException;
import java.util.Collection;

public interface AgenteModel<T> {
    public void doSave(AgenteBean agente) throws SQLException;

    public Collection<CompositeKeyAgenteCase> RetrieveAgenteCase() throws SQLException;

    public Collection<AgenteBean> RetrieveAgente() throws SQLException;

    public AgenteBean RetrieveAgenteById(int id) throws SQLException;
}
