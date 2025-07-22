package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import model.RescueRequest;
import model.Ngo;
import util.DBConnection;

public class RescueDAO {

    // ✅ 1. Save Rescue Request to DB
    public static boolean saveRescueRequest(RescueRequest r) {
    try (Connection con = DBConnection.getConnection()) {
        String sql = "INSERT INTO rescue_request(email, location, city, description, image_path, status, request_date) VALUES (?, ?, ?, ?, ?, ?, CURRENT_TIMESTAMP)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, r.getEmail());
        ps.setString(2, r.getLocation());
        ps.setString(3, r.getCity());
        ps.setString(4, r.getDescription());
        ps.setString(5, r.getImagePath());
        ps.setString(6, r.getStatus());
        return ps.executeUpdate() > 0;
    } catch (Exception ex) {
        ex.printStackTrace();
        return false;
    }
}


    // ✅ 2. Fetch All Rescue Requests by NGO's City
    public static List<RescueRequest> getRescueRequestsByNgoCity(String ngoCity) {
        List<RescueRequest> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT id, email, location, city, description, image_path AS imagePath, status, request_date AS requestDate " +
                         "FROM rescue_request WHERE LOWER(city) = LOWER(?) ORDER BY request_date DESC";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, ngoCity);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                RescueRequest r = new RescueRequest();
                r.setId(rs.getInt("id"));
                r.setEmail(rs.getString("email"));
                r.setLocation(rs.getString("location"));
                r.setCity(rs.getString("city"));
                r.setDescription(rs.getString("description"));
                r.setImagePath(rs.getString("imagePath"));
                r.setStatus(rs.getString("status"));
                r.setRequestDate(rs.getTimestamp("requestDate"));
                list.add(r);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return list;
    }

    // ✅ 3. Update Rescue Request Status
    public static boolean updateStatus(int id, String status) {
        boolean result = false;
        try (Connection con = DBConnection.getConnection()) {
            String sql = "UPDATE rescue_request SET status = ? WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, status);
            ps.setInt(2, id);
            result = ps.executeUpdate() > 0;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return result;
    }

    // ✅ 4. Delete Rescue Request
    public static boolean deleteRescueRequest(int id) {
        boolean result = false;
        try (Connection con = DBConnection.getConnection()) {
            String sql = "DELETE FROM rescue_request WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            result = ps.executeUpdate() > 0;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return result;
    }

    // ✅ 5. Get Approved NGO in Given City (Excluding Admin)
    public static Ngo getMatchingNgo(String city) {
        Ngo ngo = null;
        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM ngo WHERE LOWER(city) = LOWER(?) AND status = 1 AND role = 'ngo' LIMIT 1";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, city);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                ngo = new Ngo();
                ngo.setName(rs.getString("name"));
                ngo.setEmail(rs.getString("email"));
                ngo.setCity(rs.getString("city"));
                // Optional: set other fields if needed
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ngo;
    }
}
