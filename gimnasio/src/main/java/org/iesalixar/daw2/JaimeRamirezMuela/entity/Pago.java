package org.iesalixar.daw2.JaimeRamirezMuela.entity;

import java.sql.Date;

public class Pago {
    private int codPago;
    private int codSocio;
    private double monto;
    private Date fechaPago;
    private String metodoPago;
    private String estadoPago;

    public Pago() {}

    public int getCodPago() { return codPago; }
    public void setCodPago(int codPago) { this.codPago = codPago; }

    public int getCodSocio() { return codSocio; }
    public void setCodSocio(int codSocio) { this.codSocio = codSocio; }

    public double getMonto() { return monto; }
    public void setMonto(double monto) { this.monto = monto; }

    public Date getFechaPago() { return fechaPago; }
    public void setFechaPago(Date fechaPago) { this.fechaPago = fechaPago; }

    public String getMetodoPago() { return metodoPago; }
    public void setMetodoPago(String metodoPago) { this.metodoPago = metodoPago; }

    public String getEstadoPago() { return estadoPago; }
    public void setEstadoPago(String estadoPago) { this.estadoPago = estadoPago; }
}
