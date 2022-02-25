package UtilityClass;

import model.agente.AgenteBean;

import java.io.Serializable;

public class CompositeKeyAgenteCase implements Serializable {
    private AgenteBean bean;
    private int contaCase;

    public CompositeKeyAgenteCase() {
    }

    public CompositeKeyAgenteCase(AgenteBean bean, int contaCase) {
        this.bean = bean;
        this.contaCase = contaCase;
    }

    public AgenteBean getBean() {
        return bean;
    }

    @Override
    public String toString() {
        return "CompositeKeyAgenteCase{" +
                "bean=" + bean +
                ", contaCase=" + contaCase +
                '}';
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
}
