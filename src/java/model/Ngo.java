package model;

public class Ngo {
    private int id;
    private String name;
    private String email;
    private String mobile;
    private String address;
    private String pincode;
    private String city;
    private String password;
    private int status;      // 0 = pending, 1 = approved
    private String role;     // "ngo" or "admin"

    // Constructors (optional)
    public Ngo() {}

    public Ngo(int id, String name, String email, String city, int status, String role) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.city = city;
        this.status = status;
        this.role = role;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getMobile() { return mobile; }
    public void setMobile(String mobile) { this.mobile = mobile; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getPincode() { return pincode; }
    public void setPincode(String pincode) { this.pincode = pincode; }

    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public int getStatus() { return status; }
    public void setStatus(int status) { this.status = status; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }

    // Optional Utility Method
    public boolean isApprovedNgo() {
        return this.status == 1 && "ngo".equalsIgnoreCase(this.role);
    }
}
