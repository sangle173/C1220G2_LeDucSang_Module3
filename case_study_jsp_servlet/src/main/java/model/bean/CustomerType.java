package model.bean;

public class CustomerType {
    private int id;
    private String typeName;

    public CustomerType(int id, String typeName) {
        this.id = id;
        this.typeName = typeName;
    }

    public CustomerType() {
    }

    public CustomerType(String typeName) {
        this.typeName = typeName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    @Override
    public String toString() {
        return "CustomerType{" +
                "id=" + id +
                ", typeName='" + typeName + '\'' +
                '}';
    }
}
