package UtilityClass;

import model.agente.AgenteBean;

public class CompositeKeyAgenteCase {
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
