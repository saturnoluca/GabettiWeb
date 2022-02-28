package model.appartamento;

import UtilityClass.Ricerca;
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
                bean.setIdAppartamento(rs.getInt("idAppartamento"));
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

    @Override
    public ArrayList<AppartamentoBean> barraRicerca(Ricerca ricerca) throws SQLException {
        Connection connection = null;
        PreparedStatement ps = null;
        ArrayList<AppartamentoBean> array = new ArrayList<AppartamentoBean>();
        String selectSql = "select appartamento.idAppartamento, appartamento.categoria, appartamento.nomeAppartamento, appartamento.descrizioneAppartamento, appartamento.superficie," +
                "appartamento.locali, appartamento.bagni, appartamento.piano, appartamento.riscaldamento, appartamento.classeEnergetica, appartamento.tipoVendita, appartamento.prezzo, " +
                "appartamento.data, appartamento.Agente_idAgente, appartamento.visualizzazioni, appartamento.camereLetto, appartamento.postoAuto from appartamento inner join indirizzo on appartamento.idAppartamento=indirizzo.Appartamento_idAppartamento";
        String città = "";
        String vendita = "";
        String categoria = "";
        String letti = "";
        String bagni = "";
        String minPrezzo = "";
        String maxPrezzo = "";
        String minSuperficie = "";
        String maxSuperficie = "";
        String minGarage = "";
        if (ricerca.getCittà() != null) {
            città = " AND indirizzo.città=" + "'" + ricerca.getCittà()+"'";
            selectSql=selectSql+città;
        }
        if (ricerca.getVendita() != null){
            vendita = " AND appartamento.tipoVendita=" +"'" + ricerca.getVendita()+"'";
            selectSql=selectSql+vendita;
        }
        if (ricerca.getCategoria() != null){
            categoria = " AND appartamento.categoria=" + ricerca.getCategoria();
            selectSql=selectSql+categoria;
        }
        if (ricerca.getLetti() != -1){
            letti = " AND appartamento.camereLetto=" + ricerca.getLetti();
            selectSql=selectSql+letti;
        }
        if (ricerca.getBagni() != null){
            bagni = " AND appartamento.bagni=" + ricerca.getBagni();
            selectSql=selectSql+bagni;
        }
        if (ricerca.getMinPrezzo() != -1){
            minPrezzo = " AND appartamento.prezzo>" + ricerca.getMinPrezzo();
            selectSql=selectSql+minPrezzo;
        }
        if (ricerca.getMaxPrezzo() != -1){
            maxPrezzo = " AND appartamento.prezzo<" + ricerca.getMaxPrezzo();
            selectSql=selectSql+maxPrezzo;
        }
        if (ricerca.getMinSuperficie() != -1){
            minSuperficie = " AND appartamento.superficie>" + ricerca.getMinSuperficie();
            selectSql=selectSql+minSuperficie;
        }
        if (ricerca.getMaxSuperficie() != -1){
            maxSuperficie = " AND appartamento.superficie<" + ricerca.getMaxSuperficie();
            selectSql=selectSql+maxSuperficie;
        }
        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(selectSql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                AppartamentoBean bean = new AppartamentoBean();
                bean.setCamereLetto(rs.getInt("camereLetto"));
                bean.setCategoria(rs.getString("categoria"));
                bean.setIdAppartamento(rs.getInt("idAppartamento"));
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
                array.add(bean);
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
        return array;
    }

    @Override
    public void updateVisite(AppartamentoBean app) throws SQLException {
        Connection connection=null;
        PreparedStatement ps = null;
        String updateSql= "UPDATE `mydb`.`appartamento` SET `visualizzazioni` = ? WHERE (`idAppartamento` = ?)";
        try{
            connection = dmcp.getConnection();
            if(app instanceof AppartamentoBean){
                ps= connection.prepareStatement(updateSql);
                ps.setInt(1, app.getVisualizzazioni());
                ps.setInt(2, app.getVisualizzazioni()+1);
                connection.commit();
            }
        }finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } finally {
                dmcp.releaseConnection(connection);
            }
        }
    }

    @Override
    public AppartamentoBean RetrieveById(int id) throws SQLException {
        Connection connection = null;
        PreparedStatement ps = null;
        String selectSql = "SELECT * FROM appartamento where idAppartamento = ?";
        AppartamentoBean bean = new AppartamentoBean();
        try{
            connection= dmcp.getConnection();
            ps=connection.prepareStatement(selectSql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            rs.next();
            bean.setCamereLetto(rs.getInt("camereLetto"));
            bean.setCategoria(rs.getString("categoria"));
            bean.setIdAppartamento(rs.getInt("idAppartamento"));
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
        }finally {
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
    public Collection<AppartamentoBean> RetrieveAllByAgente(int idAgente) throws SQLException {
        Connection connection = null;
        PreparedStatement ps = null;
        ArrayList<AppartamentoBean> appartamento = new ArrayList<AppartamentoBean>();
        String selectSql = "SELECT * FROM appartamento WHERE Agente_idAgente=?"; //restituisce la lista delle case di un agente
        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(selectSql);
            ps.setInt(1, idAgente);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                AppartamentoBean bean = new AppartamentoBean();
                bean.setCamereLetto(rs.getInt("camereLetto"));
                bean.setCategoria(rs.getString("categoria"));
                bean.setIdAppartamento(rs.getInt("idAppartamento"));
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
    public Collection<AppartamentoBean> RetrieveAllAppartamento() throws SQLException {
        Connection connection = null;
        PreparedStatement ps = null;
        ArrayList<AppartamentoBean> appartamento = new ArrayList<AppartamentoBean>();
        String selectSql = "SELECT * FROM appartamento"; //restituisce la lista delle case
        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(selectSql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                AppartamentoBean bean = new AppartamentoBean();
                bean.setCamereLetto(rs.getInt("camereLetto"));
                bean.setCategoria(rs.getString("categoria"));
                bean.setIdAppartamento(rs.getInt("idAppartamento"));
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

}
