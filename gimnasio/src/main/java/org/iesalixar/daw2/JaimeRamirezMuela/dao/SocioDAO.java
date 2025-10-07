package org.iesalixar.daw2.JaimeRamirezMuela.dao;

import org.iesalixar.daw2.JaimeRamirezMuela.entity.Socio;
import java.util.List;

public interface SocioDAO {
    boolean insertSocio(Socio socio);
    Socio getSocioById(int codSocio);
    List<Socio> getAllSocios();
    boolean updateSocio(Socio socio);
    boolean deleteSocio(int codSocio);
}
