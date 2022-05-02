package model.appartamento;

import UtilityClass.Città;
import UtilityClass.Ricerca;
import com.mysql.cj.result.SqlDateValueFactory;
import model.DriverManagerConnectionPool;
import model.agente.AgenteBean;
import model.indirizzo.IndirizzoModelDM;

import java.sql.*;
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
    public Collection<AppartamentoBean> OrderByData() {
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
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return appartamento;
    }

    @Override
    public Collection<AppartamentoBean> RetrieveByTipo(String tipo) {
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
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return appartamento;
    }

    @Override
    public Collection<AppartamentoBean> OrderByPrezzo() {
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
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return appartamento;
    }

    @Override
    public Collection<AppartamentoBean> OrderByVisite() {
        Connection connection = null;
        PreparedStatement ps = null;
        ArrayList<AppartamentoBean> appartamento = new ArrayList<AppartamentoBean>();
        String selectSql = "SELECT * FROM appartamento ORDER BY appartamento.visualizzazioni DESC "; //restituisce la lista delle case ordinata per visite in modo crescente
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
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return appartamento;
    }

    @Override
    public int doSave(AppartamentoBean app) {
        Connection connection = null;
        PreparedStatement ps = null;
        int key = 0;
        String insertSql = "INSERT into appartamento(nomeAppartamento, descrizioneAppartamento, superficie, locali, bagni, piano, riscaldamento, classeEnergetica, tipoVendita, prezzo, data, Agente_idAgente, categoria, camereLetto, postoAuto) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            connection = dmcp.getConnection();
            if (app instanceof AppartamentoBean) {
                ps = connection.prepareStatement(insertSql, Statement.RETURN_GENERATED_KEYS);
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
                ps.setString(13, app.getCategoria());
                ps.setInt(14, app.getCamereLetto());
                ps.setInt(15, app.getPostoAuto());
                ps.executeUpdate();
                ResultSet rs = ps.getGeneratedKeys();
                while (rs.next()) {
                    key = rs.getInt(1);
                }
                connection.commit();
                System.out.println("doSave: " + app);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return key;
    }

    @Override
    public ArrayList<AppartamentoBean> barraRicerca(Ricerca ricerca) {
        Connection connection = null;
        PreparedStatement ps = null;
        ArrayList<AppartamentoBean> array = new ArrayList<AppartamentoBean>();
        String selectSql = "select appartamento.idAppartamento, appartamento.categoria, appartamento.nomeAppartamento, appartamento.descrizioneAppartamento, appartamento.superficie," +
                "appartamento.locali, appartamento.bagni, appartamento.piano, appartamento.riscaldamento, appartamento.classeEnergetica, appartamento.tipoVendita, appartamento.prezzo, " +
                "appartamento.data, appartamento.Agente_idAgente, appartamento.visualizzazioni, appartamento.camereLetto, appartamento.postoAuto from appartamento inner join indirizzo on appartamento.idAppartamento=indirizzo.Appartamento_idAppartamento";
        String zona = "";
        String vendita = "";
        String categoria = "";
        String letti = "";
        String bagni = "";
        String minPrezzo = "";
        String maxPrezzo = "";
        String minSuperficie = "";
        String maxSuperficie = "";
        String minGarage = "";
        String agente = "";
        try {
            if (ricerca.getCittà() != null) {
                IndirizzoModelDM indirizzoModelDM = new IndirizzoModelDM();
                if (indirizzoModelDM.isCittà(ricerca.getCittà())) {
                    zona = " AND indirizzo.città=" + "'" + ricerca.getCittà() + "'";
                    selectSql = selectSql + zona;
                } else {
                    zona = " AND indirizzo.zona=" + "'" + ricerca.getCittà() + "'";
                    selectSql = selectSql + zona;

                }
            }
            if (ricerca.getVendita() != null) {
                vendita = " AND appartamento.tipoVendita=" + "'" + ricerca.getVendita() + "'";
                selectSql = selectSql + vendita;
            }
            if (ricerca.getCategoria() != null) {
                categoria = " AND appartamento.categoria=" + ricerca.getCategoria();
                selectSql = selectSql + categoria;
            }
            if (ricerca.getLetti() != -1) {
                letti = " AND appartamento.camereLetto=" + ricerca.getLetti();
                selectSql = selectSql + letti;
            }
            if (ricerca.getBagni() != null) {
                bagni = " AND appartamento.bagni=" + ricerca.getBagni();
                selectSql = selectSql + bagni;
            }
            if (ricerca.getMinPrezzo() != -1) {
                minPrezzo = " AND appartamento.prezzo>" + ricerca.getMinPrezzo();
                selectSql = selectSql + minPrezzo;
            }
            if (ricerca.getMaxPrezzo() != -1) {
                maxPrezzo = " AND appartamento.prezzo<" + ricerca.getMaxPrezzo();
                selectSql = selectSql + maxPrezzo;
            }
            if (ricerca.getMinSuperficie() != -1) {
                minSuperficie = " AND appartamento.superficie>" + ricerca.getMinSuperficie();
                selectSql = selectSql + minSuperficie;
            }
            if (ricerca.getMaxSuperficie() != -1) {
                maxSuperficie = " AND appartamento.superficie<" + ricerca.getMaxSuperficie();
                selectSql = selectSql + maxSuperficie;
            }

            if (ricerca.getAgente() != -1) {
                agente = "AND appartamento.Agente_idAgente=" + ricerca.getAgente();
                selectSql = selectSql + agente;
            }
            System.out.println(selectSql);
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
            System.out.println(array);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return array;
    }

    @Override
    public void updateVisite(AppartamentoBean app) {
        Connection connection = null;
        PreparedStatement ps = null;
        String updateSql = "UPDATE `mydb`.`appartamento` SET `visualizzazioni` = ? WHERE (`idAppartamento` = ?)";
        try {
            connection = dmcp.getConnection();
            if (app instanceof AppartamentoBean) {
                ps = connection.prepareStatement(updateSql);
                ps.setInt(1, app.getVisualizzazioni());
                ps.setInt(2, app.getVisualizzazioni() + 1);
                connection.commit();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public AppartamentoBean RetrieveById(int id) {
        Connection connection = null;
        PreparedStatement ps = null;
        String selectSql = "SELECT * FROM appartamento where idAppartamento = ?";
        AppartamentoBean bean = new AppartamentoBean();
        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(selectSql);
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
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bean;
    }

    @Override
    public Collection<AppartamentoBean> RetrieveAllByAgente(int idAgente) {
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
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return appartamento;
    }

    @Override
    public Collection<AppartamentoBean> RetrieveAllAppartamento() {
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
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return appartamento;
    }

    @Override
    public int RetrieveByBean(AppartamentoBean bean) {
        Connection conn = null;
        PreparedStatement ps = null;
        String selectSQL = "SELECT idAppartamento FROM appartamento WHERE nomeAppartamento=? AND descrizioneAppartamento=? AND Agente_idAgente=?";
        int id = 0;
        try {
            conn = dmcp.getConnection();
            ps = conn.prepareStatement(selectSQL);
            ps.setString(1, bean.getNomeAppartamento());
            ps.setString(2, bean.getDescrizioneAppartamento());
            ps.setInt(3, bean.getIdAgente());
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                id = rs.getInt("idAppartamento");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return id;
    }

    @Override
    public ArrayList<String> RetrieveAllTipoAppartamento() {
        Connection conn = null;
        PreparedStatement ps = null;
        String selectSQL = "SELECT DISTINCT categoria FROM appartamento";
        ArrayList<String> allCategorie = new ArrayList<String>();
        try {
            conn = dmcp.getConnection();
            ps = conn.prepareStatement(selectSQL);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                allCategorie.add(rs.getString("categoria"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return allCategorie;
    }

    @Override
    public void doDelete(int idAppartamento) {
        Connection connection = null;
        PreparedStatement ps = null;
        String deleteSql = "DELETE FROM appartamento WHERE idAppartamento=?";
        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(deleteSql);
            ps.setInt(1, idAppartamento);
            ps.executeUpdate();
            connection.commit();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void AggiungiVisualizzazione(int idAppartamento) throws SQLException {
        Connection connection = null;
        PreparedStatement ps = null;
        String selectSql = "SELECT visualizzazioni FROM appartamento WHERE idAppartamento = ?";
        int visualizzazioni = 0;
        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(selectSql);
            ps.setInt(1, idAppartamento);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                visualizzazioni = rs.getInt("visualizzazioni");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        String updateSql = "UPDATE appartamento SET visualizzazioni = ? WHERE idAppartamento=?";
        visualizzazioni = visualizzazioni + 1;
        try{
            connection=dmcp.getConnection();
            ps=connection.prepareStatement(updateSql);
            ps.setInt(1, visualizzazioni);
            ps.setInt(2, idAppartamento);
            ps.executeUpdate();
            connection.commit();
        }catch (SQLException e){
            e.printStackTrace();
        }

    }

    public int doUpdate(AppartamentoBean appartamentoBean) {
        Connection connection = null;
        PreparedStatement ps = null;
        System.out.println(appartamentoBean);
        int key = 0;
        String updateSql = "UPDATE appartamento SET nomeAppartamento=? , descrizioneAppartamento=? , superficie=? , locali=? , bagni=? , piano=? , riscaldamento=? , classeEnergetica=? , tipoVendita=? , prezzo=? , data=? , Agente_idAgente=? , categoria=? , camereLetto=? , postoAuto=? WHERE idAppartamento=?";
        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(updateSql);
            ps.setString(1, appartamentoBean.getNomeAppartamento());
            ps.setString(2, appartamentoBean.getDescrizioneAppartamento());
            ps.setFloat(3, appartamentoBean.getSuperficie());
            ps.setString(4, appartamentoBean.getLocali());
            ps.setString(5, appartamentoBean.getBagni());
            ps.setString(6, appartamentoBean.getPiano());
            ps.setString(7,appartamentoBean.getRiscaldamento());
            ps.setString(8, appartamentoBean.getClasseEnergetica());
            ps.setString(9, appartamentoBean.getTipoVendita());
            ps.setFloat(10,appartamentoBean.getPrezzo());
            ps.setDate(11,appartamentoBean.getData());
            ps.setInt(12, appartamentoBean.getIdAgente());
            ps.setString(13,appartamentoBean.getCategoria());
            ps.setInt(14,appartamentoBean.getCamereLetto());
            ps.setInt(15,appartamentoBean.getPostoAuto());
            ps.setInt(16, appartamentoBean.getIdAppartamento());
            ps.executeUpdate();
            connection.commit();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return appartamentoBean.getIdAppartamento();
    }
}
