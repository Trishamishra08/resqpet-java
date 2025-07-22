package dao;

import model.Ngo;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NgoDAO {

    // ========== Register NGO ==========
    public static boolean registerNgo(Ngo ngo) {
        boolean status = false;
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO ngo (name, email, mobile, address, pincode, city, password, status, role) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, ngo.getName());
            ps.setString(2, ngo.getEmail());
            ps.setString(3, ngo.getMobile());
            ps.setString(4, ngo.getAddress());
            ps.setString(5, ngo.getPincode());
            ps.setString(6, ngo.getCity());
            ps.setString(7, ngo.getPassword());
            ps.setInt(8, ngo.getStatus());  // 0 = pending
            ps.setString(9, ngo.getRole()); // "ngo"

            int rows = ps.executeUpdate();
            status = (rows > 0);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    // ========== Login NGO or Admin ==========
    public static Ngo loginNgo(String email, String password) {
        Ngo ngo = null;
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM ngo WHERE email = ? AND password = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                ngo = new Ngo();
                ngo.setId(rs.getInt("id"));
                ngo.setName(rs.getString("name"));
                ngo.setEmail(rs.getString("email"));
                ngo.setMobile(rs.getString("mobile"));
                ngo.setAddress(rs.getString("address"));
                ngo.setPincode(rs.getString("pincode"));
                ngo.setCity(rs.getString("city"));
                ngo.setPassword(rs.getString("password"));
                ngo.setStatus(rs.getInt("status"));
                ngo.setRole(rs.getString("role"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ngo;
    }

    // ========== Get All NGOs (excluding admins) ==========
    public static List<Ngo> getAllNgos() {
        List<Ngo> ngos = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM ngo WHERE role = 'ngo' ORDER BY id DESC";
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Ngo ngo = new Ngo();
                ngo.setId(rs.getInt("id"));
                ngo.setName(rs.getString("name"));
                ngo.setEmail(rs.getString("email"));
                ngo.setMobile(rs.getString("mobile"));
                ngo.setAddress(rs.getString("address"));
                ngo.setPincode(rs.getString("pincode"));
                ngo.setCity(rs.getString("city"));
                ngo.setPassword(rs.getString("password"));
                ngo.setStatus(rs.getInt("status"));
                ngo.setRole(rs.getString("role"));

                ngos.add(ngo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ngos;
    }

    // ========== Update NGO Status ==========
    public static boolean updateNgoStatus(int id, int newStatus) {
        boolean result = false;
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "UPDATE ngo SET status = ? WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, newStatus);
            ps.setInt(2, id);

            int rows = ps.executeUpdate();
            result = (rows > 0);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    // ========== Delete NGO ==========
    public static boolean deleteNgo(int id) {
        boolean status = false;
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "DELETE FROM ngo WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            int rows = ps.executeUpdate();
            status = (rows > 0);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
}
