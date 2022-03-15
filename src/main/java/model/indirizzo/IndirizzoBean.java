package model.indirizzo;

import java.io.Serializable;

public class IndirizzoBean implements Serializable {
    private int idIndirizzo;
    private String via;
    private String numeroCivico;
    private String cap;
    private String citta;
    private String provincia;
    private String zona;
    private int idAppartamento;

    public IndirizzoBean() {
    }

    public IndirizzoBean(int idIndirizzo, String via, String numeroCivico, String cap, String citta, String provincia, String zona, int idAppartamento) {
        this.idIndirizzo = idIndirizzo;
        this.via = via;
        this.numeroCivico = numeroCivico;
        this.cap = cap;
        this.citta = citta;
        this.provincia = provincia;
        this.zona = zona;
        this.idAppartamento = idAppartamento;
    }

    @Override
    public String toString() {
        return via + " " + numeroCivico + ", " + citta + ", " + cap + ", (" + provincia+")";
    }

    public int getIdIndirizzo() {
        return idIndirizzo;
    }

    public void setIdIndirizzo(int idIndirizzo) {
        this.idIndirizzo = idIndirizzo;
    }

    public String getVia() {
        return via;
    }

    public void setVia(String via) {
        this.via = via;
    }

    public String getNumeroCivico() {
        return numeroCivico;
    }

    public void setNumeroCivico(String numeroCivico) {
        this.numeroCivico = numeroCivico;
    }

    public String getCap() {
        return cap;
    }

    public void setCap(String cap) {
        this.cap = cap;
    }

    public String getCitta() {
        return citta;
    }

    public void setCitta(String citta) {
        this.citta = citta;
    }

    public String getProvincia() {
        return provincia;
    }

    public void setProvincia(String provincia) {
        this.provincia = provincia;
    }

    public String getZona() {
        return zona;
    }

    public void setZona(String zona) {
        this.zona = zona;
    }

    public int getIdAppartamento() {
        return idAppartamento;
    }

    public void setIdAppartamento(int idAppartamento) {
        this.idAppartamento = idAppartamento;
    }
}
