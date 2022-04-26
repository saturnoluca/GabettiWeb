package model.utente;

import UtilityClass.UtilityBlob;
import model.DriverManagerConnectionPool;
import model.agente.AgenteBean;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

public class UtenteModelDM implements UtenteModel {
    private DriverManagerConnectionPool dmcp = null;

    public UtenteModelDM(DriverManagerConnectionPool dmcp) {
        this.dmcp = dmcp;
        System.out.println("DriverManager Product Model: creazione...");
    }

    public UtenteModelDM() {
    }

    @Override
    public void doSave(Object utente) throws SQLException, IOException {
        Connection connection = null;
        PreparedStatement ps = null;
        InputStream in = null;
        String insertSql = null;
        try {
            connection = dmcp.getConnection();
            if (utente instanceof UtenteBean) {
                if (((UtenteBean) utente).getFoto().getSize() <= 0) {
                    insertSql = "INSERT INTO Utente(username, password, nome, cognome, email, ruolo) VALUES(?, ?, ?, ?, ?, ?)";
                    ps = connection.prepareStatement(insertSql);
                    ps.setString(1, ((UtenteBean) utente).getUsername());
                    ps.setString(2, ((UtenteBean) utente).getPassword());
                    ps.setString(3, ((UtenteBean) utente).getNome());
                    ps.setString(4, ((UtenteBean) utente).getCognome());
                    ps.setString(5, ((UtenteBean) utente).getEmail());
                    ps.setString(6, ((UtenteBean) utente).getRuolo());

                } else {

                    insertSql = "INSERT INTO Utente(username, password, nome, cognome, email, foto, ruolo) VALUES(?, ?, ?, ?, ?, ?, ?)";
                    ps = connection.prepareStatement(insertSql);
                    ps.setString(1, ((UtenteBean) utente).getUsername());
                    ps.setString(2, ((UtenteBean) utente).getPassword());
                    ps.setString(3, ((UtenteBean) utente).getNome());
                    ps.setString(4, ((UtenteBean) utente).getCognome());
                    ps.setString(5, ((UtenteBean) utente).getEmail());
                    in = ((UtenteBean) utente).getFoto().getInputStream();

                    ps.setBlob(6, in);
                    ps.setString(7, ((UtenteBean) utente).getRuolo());
                }
                System.out.println("doSave:" + ps.toString());
                ps.executeUpdate();
                connection.commit();
            }
            if (in != null) {
                in.close();
            }
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } finally {
                DriverManagerConnectionPool.releaseConnection(connection);
            }
        }
    }

    @Override
    public Collection<UtenteBean> doRetrieveAll() throws SQLException {
        Connection connection = null;
        PreparedStatement ps = null;
        ArrayList<UtenteBean> array = new ArrayList<UtenteBean>();
        String selectSql = "SELECT * FROM utente";
        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(selectSql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                UtenteBean bean = new UtenteBean();
                bean.setIdUtente(rs.getInt("idUtente"));
                bean.setUsername(rs.getString("username"));
                bean.setPassword(rs.getString("password"));
                bean.setNome(rs.getString("nome"));
                bean.setEmail(rs.getString("email"));
                bean.setCognome(rs.getString("cognome"));
                if (rs.getBlob("foto") != null) {
                    String fotoPart = null;
                    fotoPart = (UtilityBlob.base64ImageString(UtilityBlob.blobToBytes(rs.getBlob("foto"))));
                    bean.setFotoString(fotoPart);
                }
                bean.setRuolo(rs.getString("ruolo"));
                array.add(bean);
            }
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } finally {
                DriverManagerConnectionPool.releaseConnection(connection);
            }
        }
        return array;
    }

    @Override
    public Collection<UtenteBean> doRetrieveByRole(String ruolo) throws SQLException {
        return null;
    }

    @Override
    public UtenteBean doRetrieveUtenteByKey(int idUtente) throws SQLException {
        Connection connection = null;
        PreparedStatement ps = null;
        String selectSql = "SELECT * FROM utente WHERE idUtente=?";
        UtenteBean bean = new UtenteBean();
        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(selectSql);
            ps.setInt(1, idUtente);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                bean.setIdUtente(rs.getInt("idUtente"));
                bean.setUsername(rs.getString("username"));
                bean.setPassword(rs.getString("password"));
                bean.setNome(rs.getString("nome"));
                bean.setCognome(rs.getString("cognome"));
                bean.setEmail(rs.getString("email"));
                if (rs.getBlob("foto") != null) {
                    String fotoPart = null;
                    fotoPart = (UtilityBlob.base64ImageString(UtilityBlob.blobToBytes(rs.getBlob("foto"))));
                    bean.setFotoString(fotoPart);
                }
                bean.setRuolo(rs.getString("ruolo"));
            }
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } finally {
                dmcp.releaseConnection(connection);
            }
            return bean;
        }
    }

    @Override
    public void doDelete(int idUtente) throws SQLException {
        Connection connection = null;
        PreparedStatement ps = null;
        String deleteSql = "DELETE FROM utente WHERE idUtente=?";
        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(deleteSql);
            ps.setInt(1, idUtente);
            ps.executeUpdate();
            connection.commit();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } finally {
                DriverManagerConnectionPool.releaseConnection(connection);
            }
        }
    }

    @Override
    public UtenteBean doRetrieveUtenteByKeyAgente(int idUtente) throws SQLException {
        Connection connection = null;
        PreparedStatement ps = null;
        UtenteBean bean = new UtenteBean();
        String selectSql = "SELECT * FROM utente WHERE idUtente=?";
        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(selectSql);
            ps.setInt(1, idUtente);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                bean.setIdUtente(rs.getInt("idUtente"));
                bean.setUsername(rs.getString("username"));
                bean.setPassword(rs.getString("password"));
                bean.setNome(rs.getString("nome"));
                bean.setEmail(rs.getString("email"));
                bean.setCognome(rs.getString("cognome"));
                if (rs.getBlob("foto") != null) {
                    String fotoPart = null;
                    fotoPart = (UtilityBlob.base64ImageString(UtilityBlob.blobToBytes(rs.getBlob("foto"))));
                    bean.setFotoString(fotoPart);
                }
                bean.setRuolo(rs.getString("ruolo"));
            }
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } finally {
                DriverManagerConnectionPool.releaseConnection(connection);
            }
        }
        return bean;
    }

    @Override
    public UtenteBean Login(String email, String password) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        conn = dmcp.getConnection();
        String selectSql = "SELECT * FROM utente where email=? AND password=?";
        UtenteBean bean = new UtenteBean();
        try {
            ps = conn.prepareStatement(selectSql);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                bean.setIdUtente(rs.getInt("idUtente"));
                bean.setUsername(rs.getString("username"));
                bean.setPassword(rs.getString("password"));
                bean.setNome(rs.getString("nome"));
                bean.setEmail(rs.getString("email"));
                bean.setCognome(rs.getString("cognome"));
                if (rs.getBlob("foto") != null) {
                    String fotoPart = null;
                    fotoPart = (UtilityBlob.base64ImageString(UtilityBlob.blobToBytes(rs.getBlob("foto"))));
                    bean.setFotoString(fotoPart);
                }
                bean.setRuolo(rs.getString("ruolo"));
            }
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } finally {
                DriverManagerConnectionPool.releaseConnection(conn);
            }
        }
        return bean;
    }

    @Override
    public UtenteBean RetrieveByEmail(String email) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        String selectSql = "SELECT * FROM utente where email=?";
        UtenteBean bean = new UtenteBean();
        try {
            conn = dmcp.getConnection();
            ps = conn.prepareStatement(selectSql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                bean.setIdUtente(rs.getInt("idUtente"));
                bean.setUsername(rs.getString("username"));
                bean.setPassword(rs.getString("password"));
                bean.setNome(rs.getString("nome"));
                bean.setEmail(rs.getString("email"));
                bean.setCognome(rs.getString("cognome"));
                if (rs.getBlob("foto") != null) {
                    String fotoPart = null;
                    fotoPart = (UtilityBlob.base64ImageString(UtilityBlob.blobToBytes(rs.getBlob("foto"))));
                    bean.setFotoString(fotoPart);
                }
                bean.setRuolo(rs.getString("ruolo"));
            }
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } finally {
                DriverManagerConnectionPool.releaseConnection(conn);
            }
        }
        return bean;
    }

    @Override
    public UtenteBean RetrieveNomeCognome(String nome, String cognome) {
        return null;
    }

    @Override
    public void doUpdate(UtenteBean utenteBean) throws SQLException, IOException {
        Connection connection = null;
        PreparedStatement ps = null;
        InputStream in = null;
        String updateSql="UPDATE utente SET username=? , password=? , nome=? , cognome=? , email=? , foto=? , ruolo=? WHERE idUtente=?";
        try{
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(updateSql);
            ps.setString(1, utenteBean.getCognome());
            ps.setString(2, utenteBean.getPassword());
            ps.setString(3, utenteBean.getNome());
            ps.setString(4, utenteBean.getCognome());
            ps.setString(5, utenteBean.getEmail());
            in = ((UtenteBean) utenteBean).getFoto().getInputStream();
            ps.setBlob(6, in);
            ps.setString(7, utenteBean.getRuolo());
            ps.setInt(8, utenteBean.getIdUtente());
            ps.executeUpdate();
            connection.commit();
        }finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } finally {
                DriverManagerConnectionPool.releaseConnection(connection);
            }
        }
    }
}
