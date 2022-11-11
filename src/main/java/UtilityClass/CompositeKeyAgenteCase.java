package UtilityClass;

import model.agente.AgenteBean;

import java.io.Serializable;

public class CompositeKeyAgenteCase implements Serializable {
    private AgenteBean bean;
    private int contaCase;
    private int totvisite;

    public CompositeKeyAgenteCase() {
    }

    public CompositeKeyAgenteCase(AgenteBean bean, int contaCase, int totvisite) {
        this.bean = bean;
        this.contaCase = contaCase;
        this.totvisite = totvisite;
    }

    public AgenteBean getBean() {
        return bean;
    }

    public void setBean(AgenteBean bean) {
        this.bean = bean;
    }

    public int getContaCase() {
        return contaCase;
    }

    public void setContaCase(int contaCase) {
        this.contaCase = contaCase;
    }

    public int getTotvisite() {
        return totvisite;
    }

    public void setTotvisite(int totvisite) {
        this.totvisite = totvisite;
    }

    @Override
    public String toString() {
        return "CompositeKeyAgenteCase{" +
                "bean=" + bean +
                ", contaCase=" + contaCase +
                ", totvisite=" + totvisite +
                '}';
    }
}
