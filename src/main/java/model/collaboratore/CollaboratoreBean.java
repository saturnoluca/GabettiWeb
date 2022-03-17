package model.collaboratore;

import java.io.Serializable;

public class CollaboratoreBean implements Serializable {
    private int idCollaboratore;
    private int idAgente;
    private int idUtente;

    public CollaboratoreBean() {
    }

    public CollaboratoreBean(int idCollaboratore, int idAgente, int idUtente) {
        this.idCollaboratore = idCollaboratore;
        this.idAgente = idAgente;
        this.idUtente = idUtente;
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

    public int getIdUtente() {
        return idUtente;
    }

    public void setIdUtente(int idUtente) {
        this.idUtente = idUtente;
    }
}


