package model.planimetria;

import javax.servlet.http.Part;
import java.io.Serializable;

public class PlanimetriaBean implements Serializable {
    private int idPlanimetria;
    private Part planimetria;
    private String planimetriaString;
    private int idAppartamento;

    public PlanimetriaBean(){

    }

    public PlanimetriaBean(int idPlanimetria, Part planimetria, String planimetriaString, int idAppartamento) {
        this.idPlanimetria = idPlanimetria;
        this.planimetria = planimetria;
        this.planimetriaString = planimetriaString;
        this.idAppartamento = idAppartamento;
    }

    public int getIdPlanimetria() {
        return idPlanimetria;
    }

    public void setIdPlanimetria(int idPlanimetria) {
        this.idPlanimetria = idPlanimetria;
    }

    public Part getPlanimetria() {
        return planimetria;
    }

    public void setPlanimetria(Part planimetria) {
        this.planimetria = planimetria;
    }

    public String getPlanimetriaString() {
        return planimetriaString;
    }

    public void setPlanimetriaString(String planimetriaString) {
        this.planimetriaString = planimetriaString;
    }

    public int getIdAppartamento() {
        return idAppartamento;
    }

    public void setIdAppartamento(int idAppartamento) {
        this.idAppartamento = idAppartamento;
    }

    @Override
    public String toString() {
        return "PlanimetriaBean{" +
                "idPlanimetria=" + idPlanimetria +
                ", planimetria=" + planimetria +
                ", planimetriaString='" + planimetriaString + '\'' +
                ", idAppartamento=" + idAppartamento +
                '}';
    }
}
