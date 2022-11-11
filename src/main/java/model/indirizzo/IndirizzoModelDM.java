package model.indirizzo;

import UtilityClass.Città;
import model.DriverManagerConnectionPool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

public class IndirizzoModelDM implements IndirizzoModel {
    private DriverManagerConnectionPool dmcp = null;

    public IndirizzoModelDM() {
    }

    public IndirizzoModelDM(DriverManagerConnectionPool dmcp) {
        this.dmcp = dmcp;
    }

    @Override
    public void doSave(IndirizzoBean indirizzo) {
        Connection connection = null;
        PreparedStatement ps = null;
        String insertSql = "INSERT INTO indirizzo(via, numeroCivico, cap, città, provincia, Appartamento_idAppartamento, zona, regione) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            connection = dmcp.getConnection();
            if (indirizzo instanceof IndirizzoBean) {
                ps = connection.prepareStatement(insertSql);
                ps.setString(1, indirizzo.getVia());
                ps.setString(2, indirizzo.getNumeroCivico());
                ps.setString(3, indirizzo.getCap());
                ps.setString(4, indirizzo.getCitta());
                ps.setString(5, indirizzo.getProvincia());
                ps.setInt(6, indirizzo.getIdAppartamento());
                ps.setString(7, indirizzo.getZona());
                ps.setString(8, indirizzo.getRegione());
                ps.executeUpdate();
                connection.commit();
                System.out.println("doSave: " + indirizzo);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public void doUpdate(IndirizzoBean indirizzo) {
        Connection connection = null;
        PreparedStatement ps = null;
        String updateSql = "UPDATE appartamento SET nomeAppartamento=? , descrizioneAppartamento=? , superficie=? , locali=? , bagni=? , piano=? , riscaldamento=? , classeEnergetica=? , tipoVendita=? , prezzo=? , data=? , Agente_idAgente=? , categoria=? , camereLetto=? , postoAuto=? WHERE idAgente=?";

        String insertSql = "UPDATE indirizzo SET via=? , numeroCivico=? , cap=? , città=? , provincia=? , zona=?, regione=? WHERE Appartamento_idAppartamento=?;";
        try {
            connection = dmcp.getConnection();
            if (indirizzo instanceof IndirizzoBean) {
                ps = connection.prepareStatement(insertSql);
                ps.setString(1, indirizzo.getVia());
                ps.setString(2, indirizzo.getNumeroCivico());
                ps.setString(3, indirizzo.getCap());
                ps.setString(4, indirizzo.getCitta());
                ps.setString(5, indirizzo.getProvincia());
                ps.setString(6, indirizzo.getZona());
                ps.setString(7, indirizzo.getRegione());
                ps.setInt(8,indirizzo.getIdAppartamento());
                ps.executeUpdate();
                connection.commit();
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    @Override
    public IndirizzoBean RetrieveIndirizzoByAppId(int id) {
        Connection connection = null;
        PreparedStatement ps = null;
        String selectSql = "SELECT * FROM indirizzo WHERE Appartamento_idAppartamento=?";
        IndirizzoBean bean = new IndirizzoBean();
        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(selectSql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            rs.next();
            bean.setIdIndirizzo(rs.getInt("idIndirizzo"));
            bean.setVia(rs.getString("via"));
            bean.setNumeroCivico(rs.getString("numeroCivico"));
            bean.setCap(rs.getString("cap"));
            bean.setCitta(rs.getString("città"));
            bean.setProvincia(rs.getString("provincia"));
            bean.setIdAppartamento(rs.getInt("Appartamento_idAppartamento"));
            bean.setZona(rs.getString("zona"));
            bean.setRegione(rs.getString("regione"));
        }catch (SQLException e){
            e.printStackTrace();
        }
        return bean;
    }

    @Override
    public Collection<IndirizzoBean> RetrieveAll(){
        Connection connection = null;
        PreparedStatement ps = null;
        String selectSql = "SELECT * FROM indirizzo";
        ArrayList<IndirizzoBean> array = new ArrayList<IndirizzoBean>();
        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(selectSql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                IndirizzoBean bean = new IndirizzoBean();
                bean.setIdIndirizzo(rs.getInt("idIndirizzo"));
                bean.setVia(rs.getString("via"));
                bean.setNumeroCivico(rs.getString("numeroCivico"));
                bean.setCap(rs.getString("cap"));
                bean.setCitta(rs.getString("città"));
                bean.setProvincia(rs.getString("provincia"));
                bean.setIdAppartamento(rs.getInt("Appartamento_idAppartamento"));
                bean.setZona(rs.getString("zona"));
                bean.setRegione(rs.getString("regione"));
                array.add(bean);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return array;
    }

    public ArrayList<String> RetrieveAllCittà() {
        Connection connection = null;
        PreparedStatement ps = null;
        String selectSql = "SELECT DISTINCT città FROM indirizzo";
        ArrayList<String> città = new ArrayList<String>();
        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(selectSql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String cittàString = rs.getString("città");
                città.add(cittàString);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return città;
    }

    public ArrayList<String> RetrieveAllRegioni() {
        Connection connection = null;
        PreparedStatement ps = null;
        String selectSql = "SELECT DISTINCT regione FROM indirizzo";
        ArrayList<String> regioni = new ArrayList<String>();
        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(selectSql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String regione = rs.getString("regione");
                regioni.add(regione);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return regioni;
    }

    public ArrayList<String> RetrieveAllProvince() {
        Connection connection = null;
        PreparedStatement ps = null;
        String selectSql = "SELECT DISTINCT provincia FROM indirizzo";
        ArrayList<String> province = new ArrayList<String>();
        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(selectSql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String provincia = rs.getString("provincia");
                province.add(provincia);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return province;
    }

    public ArrayList<String> RetrieveProvinciaByRegione(String regione) {
        Connection connection = null;
        PreparedStatement ps = null;
        String selectSql = "SELECT DISTINCT provincia FROM indirizzo WHERE regione=?";
        ArrayList<String> province = new ArrayList<String>();
        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(selectSql);
            ps.setString(1,regione);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String provincia = rs.getString("provincia");
                province.add(provincia);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return province;
    }

    public ArrayList<String> RetrieveCittaByRegione(String regione) {
        Connection connection = null;
        PreparedStatement ps = null;
        String selectSql = "SELECT DISTINCT città FROM indirizzo WHERE regione=?";
        ArrayList<String> listaCitta = new ArrayList<String>();
        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(selectSql);
            ps.setString(1,regione);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String citta = rs.getString("città");
                listaCitta.add(citta);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return listaCitta;
    }

    public ArrayList<String> RetrieveCittaByProvincia(String provincia) {
        Connection connection = null;
        PreparedStatement ps = null;
        String selectSql = "SELECT DISTINCT città FROM indirizzo WHERE provincia=?";
        ArrayList<String> listaCitta = new ArrayList<String>();
        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(selectSql);
            ps.setString(1,provincia);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String citta = rs.getString("città");
                listaCitta.add(citta);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return listaCitta;
    }

    public ArrayList<String> RetrieveCittaByProvinciaAndCitta(String regione, String provincia) {
        Connection connection = null;
        PreparedStatement ps = null;
        String selectSql = "SELECT DISTINCT città FROM indirizzo WHERE regione=? AND provincia=?";
        ArrayList<String> listaCitta = new ArrayList<String>();
        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(selectSql);
            ps.setString(1,regione);
            ps.setString(2,provincia);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String citta = rs.getString("città");
                listaCitta.add(citta);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return listaCitta;
    }

    public ArrayList<String> RetrieveZonaByCitta(String citta) {
        Connection connection = null;
        PreparedStatement ps = null;
        String selectSql = "SELECT DISTINCT zona FROM indirizzo WHERE città=?";
        ArrayList<String> zone = new ArrayList<String>();
        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(selectSql);
            ps.setString(1,citta);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String zona = rs.getString("zona");
                zone.add(zona);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return zone;
    }
    @Override
    public ArrayList<Città> RetrieveAllCittàZone(ArrayList città) {
        Connection connection = null;
        PreparedStatement ps = null;
        String selectSQL = "SELECT DISTINCT zona FROM indirizzo where città=?";
        ArrayList<Città> allCittà = new ArrayList<Città>();

        for (String c : (ArrayList<String>) città) {
            try {
                ArrayList<String> allZone = new ArrayList<String>();
                Città city = new Città();
                connection = dmcp.getConnection();
                ps = connection.prepareStatement(selectSQL);
                ps.setString(1, c);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    String zona="";
                    zona=rs.getString("zona");
                    if(!zona.equals(c)){
                        allZone.add(zona);
                    }
                    city.setNomeCittà(c);
                    city.setZone(allZone);
                }
                allCittà.add(city);
            }catch (SQLException e){
                e.printStackTrace();
            }
        }
        return allCittà;
    }

    @Override
    public Città RetrieveCittàZone(String zona) throws SQLException {
        Connection connection = null;
        PreparedStatement ps = null;
        String selectSql = "SELECT DISTINCT città FROM indirizzo WHERE zona=?";
        Città città = new Città();
        ArrayList<String> arrayCittà = new ArrayList<String>();
        IndirizzoModelDM indirizzoModelDM = new IndirizzoModelDM();
        arrayCittà = indirizzoModelDM.RetrieveAllCittà();
        boolean trovato = false;
        try {
            for (String c : arrayCittà) {
                if (c.equals(zona)) {
                    trovato = true;
                    città.setNomeCittà(c);
                }
            }
            if (!trovato) {
                connection = dmcp.getConnection();
                ps = connection.prepareStatement(selectSql);
                ps.setString(1, zona);
                ResultSet rs = ps.executeQuery();
                rs.next();
                città.setNomeCittà(rs.getString("città"));
            }
        } finally {
            selectSql = "SELECT DISTINCT zona FROM indirizzo WHERE città=?";
            if (connection == null) {
                connection = dmcp.getConnection();
            }
            ps = connection.prepareStatement(selectSql);
            ps.setString(1, città.getNomeCittà());
            ResultSet rs = ps.executeQuery();
            ArrayList<String> zone = new ArrayList<String>();
            while (rs.next()) {
                zone.add(rs.getString("zona"));
            }
            città.setZone(zone);
            try {
                if (ps != null) {
                    ps.close();
                }
            } finally {
                dmcp.releaseConnection(connection);
            }
        }
        return città;
    }

    @Override
    public boolean isCittà(String zona) throws SQLException {
        Città città;
        IndirizzoModelDM indirizzoModelDM = new IndirizzoModelDM();
        città = indirizzoModelDM.RetrieveCittàZone(zona);
        if (zona.equals(città.getNomeCittà())) {
            return true;
        } else {
            return false;
        }
    }
}

