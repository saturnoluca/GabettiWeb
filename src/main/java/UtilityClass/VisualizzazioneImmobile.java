package UtilityClass;

import model.indirizzo.IndirizzoBean;

import javax.servlet.http.Part;
import java.util.Date;

public class VisualizzazioneImmobile {
    private int idAppartamento;
    private String categoria;
    private String nomeAppartamento;
    private String descrizioneAppartamento;
    private float superficie;
    private String bagni;
    private int camereLetto;
    private Date data;
    private Float prezzo;
    private String foto;
    private String tipoVendita;

    private IndirizzoBean indirizzoBean;

    private int idUtente;
    private String nomeAgente;

    private String cognomeAgente;
    private int visualizzaPrezzo;
    public VisualizzazioneImmobile(){
        super();
    }

    public int getIdAppartamento() {
        return idAppartamento;
    }

    public void setIdAppartamento(int idAppartamento) {
        this.idAppartamento = idAppartamento;
    }

    public int getVisualizzaPrezzo() {
        return visualizzaPrezzo;
    }

    public void setVisualizzaPrezzo(int visualizzaPrezzo) {
        this.visualizzaPrezzo = visualizzaPrezzo;
    }

    public String getTipoVendita() {
        return tipoVendita;
    }

    public void setTipoVendita(String tipoVendita) {
        this.tipoVendita = tipoVendita;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getNomeAppartamento() {
        return nomeAppartamento;
    }

    public void setNomeAppartamento(String nomeAppartamento) {
        this.nomeAppartamento = nomeAppartamento;
    }

    public String getDescrizioneAppartamento() {
        return descrizioneAppartamento;
    }

    public void setDescrizioneAppartamento(String descrizioneAppartamento) {
        this.descrizioneAppartamento = descrizioneAppartamento;
    }

    public float getSuperficie() {
        return superficie;
    }

    public void setSuperficie(float superficie) {
        this.superficie = superficie;
    }

    public String getBagni() {
        return bagni;
    }

    public void setBagni(String bagni) {
        this.bagni = bagni;
    }

    public int getCamereLetto() {
        return camereLetto;
    }

    public void setCamereLetto(int camereLetto) {
        this.camereLetto = camereLetto;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public Float getPrezzo() {
        return prezzo;
    }

    public void setPrezzo(Float prezzo) {
        this.prezzo = prezzo;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public IndirizzoBean getIndirizzoBean() {
        return indirizzoBean;
    }

    public void setIndirizzoBean(IndirizzoBean indirizzoBean) {
        this.indirizzoBean = indirizzoBean;
    }

    public String getNomeAgente() {
        return nomeAgente;
    }

    public void setNomeAgente(String nomeAgente) {
        this.nomeAgente = nomeAgente;
    }

    public String getCognomeAgente() {
        return cognomeAgente;
    }

    public void setCognomeAgente(String cognomeAgente) {
        this.cognomeAgente = cognomeAgente;
    }

    public int getIdUtente() {
        return idUtente;
    }

    public void setIdUtente(int idUtente) {
        this.idUtente = idUtente;
    }

    @Override
    public String toString() {
        return "VisualizzazioneImmobile{" +
                "idAppartamento=" + idAppartamento +
                ", categoria='" + categoria + '\'' +
                ", nomeAppartamento='" + nomeAppartamento + '\'' +
                ", descrizioneAppartamento='" + descrizioneAppartamento + '\'' +
                ", superficie=" + superficie +
                ", bagni='" + bagni + '\'' +
                ", camereLetto=" + camereLetto +
                ", data=" + data +
                ", prezzo=" + prezzo +
                ", foto='" + foto + '\'' +
                ", tipoVendita='" + tipoVendita + '\'' +
                ", indirizzoBean=" + indirizzoBean +
                ", idUtente=" + idUtente +
                ", nomeAgente='" + nomeAgente + '\'' +
                ", cognomeAgente='" + cognomeAgente + '\'' +
                ", visualizzaPrezzo=" + visualizzaPrezzo +
                '}';
    }
}
