package UtilityClass;

public class Ricerca {

    private String regione;

    private String provincia;
    private String città;

    private String zona;
    private String vendita;
    private String categoria;
    private int letti=-1;
    private String bagni;

    private int postiAuto=-1;
    private float minPrezzo=-1;
    private float maxPrezzo=-1;
    private int minGarage=-1;
    private float minSuperficie=-1;
    private float maxSuperficie=-1;
    private int agente=-1;

    public Ricerca() {
    }

    public Ricerca(String regione, String provincia, String città, String zona, String vendita, String categoria, int letti, String bagni, int postiAuto, float minPrezzo, float maxPrezzo, int minGarage, float minSuperficie, float maxSuperficie, int agente) {
        this.regione = regione;
        this.provincia = provincia;
        this.città = città;
        this.zona = zona;
        this.vendita = vendita;
        this.categoria = categoria;
        this.letti = letti;
        this.bagni = bagni;
        this.postiAuto = postiAuto;
        this.minPrezzo = minPrezzo;
        this.maxPrezzo = maxPrezzo;
        this.minGarage = minGarage;
        this.minSuperficie = minSuperficie;
        this.maxSuperficie = maxSuperficie;
        this.agente = agente;
    }


    public String getRegione() {
        return regione;
    }

    public void setRegione(String regione) {
        this.regione = regione;
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

    public String getCittà() {
        return città;
    }

    public void setCittà(String città) {
        this.città = città;
    }

    public String getVendita() {
        return vendita;
    }

    public void setVendita(String vendita) {
        this.vendita = vendita;
    }

    public int getPostiAuto() {
        return postiAuto;
    }

    public void setPostiAuto(int postiAuto) {
        this.postiAuto = postiAuto;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public int getLetti() {
        return letti;
    }

    public void setLetti(int letti) {
        this.letti = letti;
    }

    public String getBagni() {
        return bagni;
    }

    public void setBagni(String bagni) {
        this.bagni = bagni;
    }

    public float getMinPrezzo() {
        return minPrezzo;
    }

    public void setMinPrezzo(float minPrezzo) {
        this.minPrezzo = minPrezzo;
    }

    public float getMaxPrezzo() {
        return maxPrezzo;
    }

    public void setMaxPrezzo(float maxPrezzo) {
        this.maxPrezzo = maxPrezzo;
    }

    public int getMinGarage() {
        return minGarage;
    }

    public void setMinGarage(int minGarage) {
        this.minGarage = minGarage;
    }

    public float getMinSuperficie() {
        return minSuperficie;
    }

    public void setMinSuperficie(float minSuperficie) {
        this.minSuperficie = minSuperficie;
    }

    public float getMaxSuperficie() {
        return maxSuperficie;
    }

    public void setMaxSuperficie(float maxSuperficie) {
        this.maxSuperficie = maxSuperficie;
    }

    public int getAgente() {
        return agente;
    }

    public void setAgente(int agente) {
        this.agente = agente;
    }
}
