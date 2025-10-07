package org.iesalixar.daw2.JaimeRamirezMuela.dao;

import org.iesalixar.daw2.JaimeRamirezMuela.entity.Pago;
import java.util.List;

public interface PagoDAO {
    boolean insertPago(Pago pago);
    boolean updatePago(Pago pago);
    boolean deletePago(int codPago);
    Pago getPagoById(int codPago);
    List<Pago> getAllPagos();
    List<Pago> getPagosBySocio(int codSocio);
}
