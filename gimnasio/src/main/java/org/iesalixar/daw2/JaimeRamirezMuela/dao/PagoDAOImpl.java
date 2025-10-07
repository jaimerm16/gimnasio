package org.iesalixar.daw2.JaimeRamirezMuela.dao;

import org.iesalixar.daw2.JaimeRamirezMuela.entity.Pago;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PagoDAOImpl implements PagoDAO {

    @Override
    public boolean insertPago(Pago pago) {
        String sql = "INSERT INTO Pago (CodPago, CodSocio, Monto, FechaPago, MetodoPago, EstadoPago) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, pago.getCodPago());
            ps.setInt(2, pago.getCodSocio());
            ps.setDouble(3, pago.getMonto());
            ps.setDate(4, pago.getFechaPago());
            ps.setString(5, pago.getMetodoPago());
            ps.setString(6, pago.getEstadoPago());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean updatePago(Pago pago) {
        String sql = "UPDATE Pago SET CodSocio=?, Monto=?, FechaPago=?, MetodoPago=?, EstadoPago=? WHERE CodPago=?";
        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, pago.getCodSocio());
            ps.setDouble(2, pago.getMonto());
            ps.setDate(3, pago.getFechaPago());
            ps.setString(4, pago.getMetodoPago());
            ps.setString(5, pago.getEstadoPago());
            ps.setInt(6, pago.getCodPago());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean deletePago(int codPago) {
        String sql = "DELETE FROM Pago WHERE CodPago=?";
        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, codPago);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public Pago getPagoById(int codPago) {
        String sql = "SELECT * FROM Pago WHERE CodPago=?";
        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, codPago);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Pago pago = new Pago();
                pago.setCodPago(rs.getInt("CodPago"));
                pago.setCodSocio(rs.getInt("CodSocio"));
                pago.setMonto(rs.getDouble("Monto"));
                pago.setFechaPago(rs.getDate("FechaPago"));
                pago.setMetodoPago(rs.getString("MetodoPago"));
                pago.setEstadoPago(rs.getString("EstadoPago"));
                return pago;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Pago> getAllPagos() {
        List<Pago> lista = new ArrayList<>();
        String sql = "SELECT * FROM Pago";
        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Pago pago = new Pago();
                pago.setCodPago(rs.getInt("CodPago"));
                pago.setCodSocio(rs.getInt("CodSocio"));
                pago.setMonto(rs.getDouble("Monto"));
                pago.setFechaPago(rs.getDate("FechaPago"));
                pago.setMetodoPago(rs.getString("MetodoPago"));
                pago.setEstadoPago(rs.getString("EstadoPago"));
                lista.add(pago);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    @Override
    public List<Pago> getPagosBySocio(int codSocio) {
        List<Pago> lista = new ArrayList<>();
        String sql = "SELECT * FROM Pago WHERE CodSocio=?";
        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, codSocio);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Pago pago = new Pago();
                pago.setCodPago(rs.getInt("CodPago"));
                pago.setCodSocio(rs.getInt("CodSocio"));
                pago.setMonto(rs.getDouble("Monto"));
                pago.setFechaPago(rs.getDate("FechaPago"));
                pago.setMetodoPago(rs.getString("MetodoPago"));
                pago.setEstadoPago(rs.getString("EstadoPago"));
                lista.add(pago);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }
}
