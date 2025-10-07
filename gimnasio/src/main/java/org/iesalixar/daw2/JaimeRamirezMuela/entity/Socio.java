package org.iesalixar.daw2.JaimeRamirezMuela.entity;

import java.sql.Date;

public class Socio {
    private int codSocio;
    private String nombre;
    private String apellido;
    private int edad;
    private String telefono;
    private String correo;
    private String direccion;
    private String tipoMembresia;
    private Date fechaInscripcion;

    // Getters y setters
    public int getCodSocio() { return codSocio; }
    public void setCodSocio(int codSocio) { this.codSocio = codSocio; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getApellido() { return apellido; }
    public void setApellido(String apellido) { this.apellido = apellido; }

    public int getEdad() { return edad; }
    public void setEdad(int edad) { this.edad = edad; }

    public String getTelefono() { return telefono; }
    public void setTelefono(String telefono) { this.telefono = telefono; }

    public String getCorreo() { return correo; }
    public void setCorreo(String correo) { this.correo = correo; }

    public String getDireccion() { return direccion; }
    public void setDireccion(String direccion) { this.direccion = direccion; }

    public String getTipoMembresia() { return tipoMembresia; }
    public void setTipoMembresia(String tipoMembresia) { this.tipoMembresia = tipoMembresia; }

    public Date getFechaInscripcion() { return fechaInscripcion; }
    public void setFechaInscripcion(Date fechaInscripcion) { this.fechaInscripcion = fechaInscripcion; }
}
