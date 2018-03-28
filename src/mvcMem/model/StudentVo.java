/*vo 클래스*/

package mvcMem.model;

public class StudentVo{

    private String id;
    private String pass;
    private String name;
    private String phone;
    private String email;
    private String address1;
    private String address2;

    public StudentVo(String id, String pass, String name, String phone, String email, String address1, String address2) {
        this.id = id;
        this.pass = pass;
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.address1 = address1;
        this.address2 = address2;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress1() {
        return address1;
    }

    public void setAddress1(String address1) {
        this.address1 = address1;
    }

    public String getAddress2() {
        return address2;
    }

    public void setAddress2(String address2) {
        this.address2 = address2;
    }
}
