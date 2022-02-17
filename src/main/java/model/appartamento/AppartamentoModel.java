package model.appartamento;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

public interface AppartamentoModel<T> {
    public Collection<AppartamentoBean> OrderByData() throws SQLException;

    public Collection<AppartamentoBean> RetrieveByTipo(String tipo) throws SQLException;

    public Collection<AppartamentoBean> OrderByPrezzo() throws SQLException;

    public Collection<AppartamentoBean> OrderByVisite() throws SQLException;

    public void doSave(AppartamentoBean app) throws SQLException;

}
