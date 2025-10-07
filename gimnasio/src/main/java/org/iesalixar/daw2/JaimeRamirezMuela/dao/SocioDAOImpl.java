package org.iesalixar.daw2.JaimeRamirezMuela.dao;

import org.iesalixar.daw2.JaimeRamirezMuela.entity.Socio;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SocioDAOImpl implements SocioDAO {

    @Override
    public boolean insertSocio(Socio socio) {
        String sql = "INSERT INTO Socio (CodSocio, Nombre, Apellido, Edad, Telefono, Correo, Direccion, TipoMembresia, FechaInscripcion) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, socio.getCodSocio());
            ps.setString(2, socio.getNombre());
            ps.setString(3, socio.getApellido());
            ps.setInt(4, socio.getEdad());
            ps.setString(5, socio.getTelefono());
            ps.setString(6, socio.getCorreo());
            ps.setString(7, socio.getDireccion());
            ps.setString(8, socio.getTipoMembresia());
            ps.setDate(9, socio.getFechaInscripcion());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public Socio getSocioById(int codSocio) {
        String sql = "SELECT * FROM Socio WHERE CodSocio=?";
        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, codSocio);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Socio socio = new Socio();
                socio.setCodSocio(rs.getInt("CodSocio"));
                socio.setNombre(rs.getString("Nombre"));
                socio.setApellido(rs.getString("Apellido"));
                socio.setEdad(rs.getInt("Edad"));
                socio.setTelefono(rs.getString("Telefono"));
                socio.setCorreo(rs.getString("Correo"));
                socio.setDireccion(rs.getString("Direccion"));
                socio.setTipoMembresia(rs.getString("TipoMembresia"));
                socio.setFechaInscripcion(rs.getDate("FechaInscripcion"));
                return socio;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Socio> getAllSocios() {
        List<Socio> socios = new ArrayList<>();
        String sql = "SELECT * FROM Socio";
        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Socio socio = new Socio();
                socio.setCodSocio(rs.getInt("CodSocio"));
                socio.setNombre(rs.getString("Nombre"));
                socio.setApellido(rs.getString("Apellido"));
                socio.setEdad(rs.getInt("Edad"));
                socio.setTelefono(rs.getString("Telefono"));
                socio.setCorreo(rs.getString("Correo"));
                socio.setDireccion(rs.getString("Direccion"));
                socio.setTipoMembresia(rs.getString("TipoMembresia"));
                socio.setFechaInscripcion(rs.getDate("FechaInscripcion"));
                socios.add(socio);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return socios;
    }

    @Override
    public boolean updateSocio(Socio socio) {
        String sql = "UPDATE Socio SET Nombre=?, Apellido=?, Edad=?, Telefono=?, Correo=?, Direccion=?, TipoMembresia=?, FechaInscripcion=? WHERE CodSocio=?";
        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, socio.getNombre());
            ps.setString(2, socio.getApellido());
            ps.setInt(3, socio.getEdad());
            ps.setString(4, socio.getTelefono());
            ps.setString(5, socio.getCorreo());
            ps.setString(6, socio.getDireccion());
            ps.setString(7, socio.getTipoMembresia());
            ps.setDate(8, socio.getFechaInscripcion());
            ps.setInt(9, socio.getCodSocio());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean deleteSocio(int codSocio) {
        String sql = "DELETE FROM Socio WHERE CodSocio=?";
        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, codSocio);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
