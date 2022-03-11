package model.collaboratore;

import java.io.Serializable;

public class CollaboratoreBean implements Serializable {
    private int idCollaboratore;
    private int idAgente;

    public CollaboratoreBean() {
    }

    public CollaboratoreBean(int idCollaboratore, int idAgente) {
        this.idCollaboratore = idCollaboratore;
        this.idAgente = idAgente;
    }

    public int getIdCollaboratore() {
        return idCollaboratore;
    }

    public void setIdCollaboratore(int idCollaboratore) {
        this.idCollaboratore = idCollaboratore;
    }

    public int getIdAgente() {
        return idAgente;
    }

    public void setIdAgente(int idAgente) {
        this.idAgente = idAgente;
    }
}


