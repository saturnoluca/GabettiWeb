package model.appartamento;

import model.DriverManagerConnectionPool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

public class AppartamentoModelDM implements AppartamentoModel {
    private DriverManagerConnectionPool dmcp = null;

    public AppartamentoModelDM() {
    }

    public AppartamentoModelDM(DriverManagerConnectionPool dmcp) {
        this.dmcp = dmcp;
    }

    @Override
    public Collection<AppartamentoBean> OrderByData() throws SQLException {
        Connection connection = null;
        PreparedStatement ps = null;
        ArrayList<AppartamentoBean> appartamento = new ArrayList<AppartamentoBean>();
        String selectSql = "SELECT * FROM appartamento ORDER BY appartamento.data"; //ordina dalla data meno recente alla più recente
        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(selectSql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                AppartamentoBean bean = new AppartamentoBean();
                bean.setCamereLetto(rs.getInt("camereLetto"));
                bean.setCategoria(rs.getString("categoria"));
                bean.setIdAppartamento(rs.getInt("idApparamento"));
                bean.setNomeAppartamento(rs.getString("nomeAppartamento"));
                bean.setDescrizioneAppartamento(rs.getString("descrizioneAppartamento"));
                bean.setSuperficie(rs.getFloat("superficie"));
                bean.setLocali(rs.getString("locali"));
                bean.setBagni(rs.getString("bagni"));
                bean.setPiano(rs.getString("piano"));
                bean.setRiscaldamento(rs.getString("riscaldamento"));
                bean.setClasseEnergetica(rs.getString("classeEnergetica"));
                bean.setTipoVendita(rs.getString("tipoVendita"));
                bean.setPrezzo(rs.getFloat("prezzo"));
                bean.setData(rs.getDate("data"));
                bean.setIdAgente(rs.getInt("Agente_idAgente"));
                bean.setPostoAuto(rs.getInt("postoAuto"));
                appartamento.add(bean);
            }
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } finally {
                dmcp.releaseConnection(connection);
            }
        }
        return appartamento;
    }

    @Override
    public Collection<AppartamentoBean> RetrieveByTipo(String tipo) throws SQLException {
        Connection connection = null;
        PreparedStatement ps = null;
        ArrayList<AppartamentoBean> appartamento = new ArrayList<AppartamentoBean>();
        String selectSql = "SELECT * FROM appartamento WHERE appartamento.tipo=?"; //restituisce la lista delle case per tipo
        try {
            connection = dmcp.getConnection();
            if (tipo instanceof String) {
                ps = connection.prepareStatement(selectSql);
                ps.setString(1, tipo);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    AppartamentoBean bean = new AppartamentoBean();
                    bean.setCategoria(rs.getString("caregoria"));
                    bean.setCamereLetto(rs.getInt("camereLetto"));
                    bean.setIdAppartamento(rs.getInt("idApparamento"));
                    bean.setNomeAppartamento(rs.getString("nomeAppartamento"));
                    bean.setDescrizioneAppartamento(rs.getString("descrizioneAppartamento"));
                    bean.setSuperficie(rs.getFloat("superficie"));
                    bean.setLocali(rs.getString("locali"));
                    bean.setBagni(rs.getString("bagni"));
                    bean.setPiano(rs.getString("piano"));
                    bean.setRiscaldamento(rs.getString("riscaldamento"));
                    bean.setClasseEnergetica(rs.getString("classeEnergetica"));
                    bean.setTipoVendita(rs.getString("tipo"));
                    bean.setPrezzo(rs.getFloat("prezzo"));
                    bean.setData(rs.getDate("data"));
                    bean.setIdAgente(rs.getInt("Agente_idAgente"));
                    bean.setPostoAuto(rs.getInt("postoAuto"));
                    appartamento.add(bean);
                }
            }
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } finally {
                dmcp.releaseConnection(connection);
            }
        }
        return appartamento;
    }

    @Override
    public Collection<AppartamentoBean> OrderByPrezzo() throws SQLException {
        Connection connection = null;
        PreparedStatement ps = null;
        ArrayList<AppartamentoBean> appartamento = new ArrayList<AppartamentoBean>();
        String selectSql = "SELECT * FROM appartamento ORDER BY appartamento.prezzo ASC "; //restituisce la lista delle case ordinata per prezzo in modo crescente
        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(selectSql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                AppartamentoBean bean = new AppartamentoBean();
                bean.setCamereLetto(rs.getInt("camereLetto"));
                bean.setCategoria(rs.getString("categoria"));
                bean.setIdAppartamento(rs.getInt("idApparamento"));
                bean.setNomeAppartamento(rs.getString("nomeAppartamento"));
                bean.setDescrizioneAppartamento(rs.getString("descrizioneAppartamento"));
                bean.setSuperficie(rs.getFloat("superficie"));
                bean.setLocali(rs.getString("locali"));
                bean.setBagni(rs.getString("bagni"));
                bean.setPiano(rs.getString("piano"));
                bean.setRiscaldamento(rs.getString("riscaldamento"));
                bean.setClasseEnergetica(rs.getString("classeEnergetica"));
                bean.setTipoVendita(rs.getString("tipo"));
                bean.setPrezzo(rs.getFloat("prezzo"));
                bean.setData(rs.getDate("data"));
                bean.setIdAgente(rs.getInt("Agente_idAgente"));
                bean.setPostoAuto(rs.getInt("postoAuto"));
                appartamento.add(bean);
            }
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } finally {
                dmcp.releaseConnection(connection);
            }
        }
        return appartamento;
    }

    @Override
    public Collection<AppartamentoBean> OrderByVisite() throws SQLException {
        Connection connection = null;
        PreparedStatement ps = null;
        ArrayList<AppartamentoBean> appartamento = new ArrayList<AppartamentoBean>();
        String selectSql = "SELECT * FROM appartamento ORDER BY appartamento.visualizzazioni ASC "; //restituisce la lista delle case ordinata per visite in modo crescente
        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(selectSql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                AppartamentoBean bean = new AppartamentoBean();
                bean.setCamereLetto(rs.getInt("camereLetto"));
                bean.setCategoria(rs.getString("categoria"));
                bean.setIdAppartamento(rs.getInt("idApparamento"));
                bean.setNomeAppartamento(rs.getString("nomeAppartamento"));
                bean.setDescrizioneAppartamento(rs.getString("descrizioneAppartamento"));
                bean.setSuperficie(rs.getFloat("superficie"));
                bean.setLocali(rs.getString("locali"));
                bean.setBagni(rs.getString("bagni"));
                bean.setPiano(rs.getString("piano"));
                bean.setRiscaldamento(rs.getString("riscaldamento"));
                bean.setClasseEnergetica(rs.getString("classeEnergetica"));
                bean.setTipoVendita(rs.getString("tipo"));
                bean.setPrezzo(rs.getFloat("prezzo"));
                bean.setData(rs.getDate("data"));
                bean.setIdAgente(rs.getInt("Agente_idAgente"));
                bean.setPostoAuto(rs.getInt("postoAuto"));
                appartamento.add(bean);
            }
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } finally {
                dmcp.releaseConnection(connection);
            }
        }
        return appartamento;
    }

    @Override
    public void doSave(AppartamentoBean app) throws SQLException {
        Connection connection = null;
        PreparedStatement ps = null;
        String insertSql = "INSERT into appartamento(nomeAppartamento, descrizioneAppartamento, superficie, locali, bagni, piano, riscaldamento, classeEnergetica, tipoVendita, prezzo, data, Agente_idAgente, categoria, camereLetto, postoAuto) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            connection = dmcp.getConnection();
            if (app instanceof AppartamentoBean) {
                ps = connection.prepareStatement(insertSql);
                ps.setString(1, app.getNomeAppartamento());
                ps.setString(2, app.getDescrizioneAppartamento());
                ps.setFloat(3, app.getSuperficie());
                ps.setString(4, app.getLocali());
                ps.setString(5, app.getBagni());
                ps.setString(6, app.getPiano());
                ps.setString(7, app.getRiscaldamento());
                ps.setString(8, app.getClasseEnergetica());
                ps.setString(9, app.getTipoVendita());
                ps.setFloat(10, app.getPrezzo());
                ps.setDate(11, app.getData());
                ps.setInt(12, app.getIdAgente());
                ps.setInt(13, app.getCamereLetto());
                ps.setString(14, app.getCategoria());
                ps.setInt(15, app.getPostoAuto());
                connection.commit();
                System.out.println("doSave: " + app);
            }
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } finally {
                dmcp.releaseConnection(connection);
            }
        }
    }
}
