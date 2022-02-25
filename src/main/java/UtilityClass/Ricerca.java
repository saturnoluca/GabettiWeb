package UtilityClass;

public class Ricerca {

    private String città;
    private String vendita;
    private String categoria;
    private int letti=-1;
    private String bagni;
    private float minPrezzo=-1;
    private float maxPrezzo=-1;
    private int minGarage=-1;
    private float minSuperficie=-1;
    private float maxSuperficie=-1;

    public Ricerca() {
    }

    public Ricerca(String città, String vendita, String categoria, int letti, String bagni, float minPrezzo, float maxPrezzo, int minGarage, float minSuperficie, float maxSuperficie) {
        this.città = città;
        this.vendita = vendita;
        this.categoria = categoria;
        this.letti = letti;
        this.bagni = bagni;
        this.minPrezzo = minPrezzo;
        this.maxPrezzo = maxPrezzo;
        this.minGarage = minGarage;
        this.minSuperficie = minSuperficie;
        this.maxSuperficie = maxSuperficie;
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
}
