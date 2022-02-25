package model.appartamento;

import java.io.Serializable;
import java.sql.Date;

public class AppartamentoBean implements Serializable {
    private int idAppartamento;
    private String categoria;
    private String nomeAppartamento;
    private String descrizioneAppartamento;
    private float superficie;
    private String locali;
    private String bagni;
    private String piano;
    private String riscaldamento;
    private String classeEnergetica;
    private String tipoVendita;
    private Float prezzo;
    private Date data;
    private int idAgente;
    private int visualizzazioni;
    private int camereLetto;
    private int postoAuto;
    
	public AppartamentoBean() {
		super();
	}

	public AppartamentoBean(int idAppartamento, String categoria, String nomeAppartamento,
			String descrizioneAppartamento, float superficie, String locali, String bagni, String piano,
			String riscaldamento, String classeEnergetica, String tipoVendita, Float prezzo, Date data, int idAgente,
			int visualizzazioni, int camereLetto, int postoAuto) {
		super();
		this.idAppartamento = idAppartamento;
		this.categoria = categoria;
		this.nomeAppartamento = nomeAppartamento;
		this.descrizioneAppartamento = descrizioneAppartamento;
		this.superficie = superficie;
		this.locali = locali;
		this.bagni = bagni;
		this.piano = piano;
		this.riscaldamento = riscaldamento;
		this.classeEnergetica = classeEnergetica;
		this.tipoVendita = tipoVendita;
		this.prezzo = prezzo;
		this.data = data;
		this.idAgente = idAgente;
		this.visualizzazioni = visualizzazioni;
		this.camereLetto = camereLetto;
		this.postoAuto = postoAuto;
	}

	public int getIdAppartamento() {
		return idAppartamento;
	}

	public void setIdAppartamento(int idAppartamento) {
		this.idAppartamento = idAppartamento;
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

	public String getLocali() {
		return locali;
	}

	public void setLocali(String locali) {
		this.locali = locali;
	}

	public String getBagni() {
		return bagni;
	}

	public void setBagni(String bagni) {
		this.bagni = bagni;
	}

	public String getPiano() {
		return piano;
	}

	public void setPiano(String piano) {
		this.piano = piano;
	}

	public String getRiscaldamento() {
		return riscaldamento;
	}

	public void setRiscaldamento(String riscaldamento) {
		this.riscaldamento = riscaldamento;
	}

	public String getClasseEnergetica() {
		return classeEnergetica;
	}

	public void setClasseEnergetica(String classeEnergetica) {
		this.classeEnergetica = classeEnergetica;
	}

	public String getTipoVendita() {
		return tipoVendita;
	}

	public void setTipoVendita(String tipoVendita) {
		this.tipoVendita = tipoVendita;
	}

	public Float getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(Float prezzo) {
		this.prezzo = prezzo;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public int getIdAgente() {
		return idAgente;
	}

	public void setIdAgente(int idAgente) {
		this.idAgente = idAgente;
	}

	public int getVisualizzazioni() {
		return visualizzazioni;
	}

	public void setVisualizzazioni(int visualizzazioni) {
		this.visualizzazioni = visualizzazioni;
	}

	public int getCamereLetto() {
		return camereLetto;
	}

	public void setCamereLetto(int camereLetto) {
		this.camereLetto = camereLetto;
	}

	public int getPostoAuto() {
		return postoAuto;
	}

	public void setPostoAuto(int postoAuto) {
		this.postoAuto = postoAuto;
	}

	@Override
	public String toString() {
		return "AppartamentoBean{" +
				"idAppartamento=" + idAppartamento +
				", categoria='" + categoria + '\'' +
				", nomeAppartamento='" + nomeAppartamento + '\'' +
				", descrizioneAppartamento='" + descrizioneAppartamento + '\'' +
				", superficie=" + superficie +
				", locali='" + locali + '\'' +
				", bagni='" + bagni + '\'' +
				", piano='" + piano + '\'' +
				", riscaldamento='" + riscaldamento + '\'' +
				", classeEnergetica='" + classeEnergetica + '\'' +
				", tipoVendita='" + tipoVendita + '\'' +
				", prezzo=" + prezzo +
				", data=" + data +
				", idAgente=" + idAgente +
				", visualizzazioni=" + visualizzazioni +
				", camereLetto=" + camereLetto +
				", postoAuto=" + postoAuto +
				'}';
	}
}
