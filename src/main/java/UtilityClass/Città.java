package UtilityClass;

import java.io.Serializable;
import java.util.ArrayList;

public class Città implements Serializable {
    private String nomeCittà;
    private ArrayList<String> zone;

    public Città() {
    }

    public Città(String nomeCittà, ArrayList<String> zone) {
        this.nomeCittà = nomeCittà;
        this.zone = zone;
    }

    public String getNomeCittà() {
        return nomeCittà;
    }

    public void setNomeCittà(String nomeCittà) {
        this.nomeCittà = nomeCittà;
    }

    public ArrayList<String> getZone() {
        return zone;
    }

    public void setZone(ArrayList<String> zone) {
        this.zone = zone;
    }
}
