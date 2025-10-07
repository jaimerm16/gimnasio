DROP DATABASE IF EXISTS gimnasio;
CREATE DATABASE gimnasio CHARACTER SET utf8mb4;
USE gimnasio;

CREATE TABLE Socio (
    CodSocio INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    Edad INT,
    Telefono VARCHAR(15),
    Correo VARCHAR(100),
    Direccion VARCHAR(100),
    TipoMembresia VARCHAR(30),
    FechaInscripcion DATE
);

CREATE TABLE Entrenador (
    CodEntrenador INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    Especialidad VARCHAR(50),
    Telefono VARCHAR(15),
    Correo VARCHAR(100),
    Salario DECIMAL(8 , 2 )
);

CREATE TABLE Clase (
    CodClase INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Descripcion TEXT,
    CodEntrenador INT,
    Horario DATETIME,
    Duracion INT,
    CapacidadMaxima INT,
    FOREIGN KEY (CodEntrenador)
        REFERENCES Entrenador (CodEntrenador)
);

CREATE TABLE Pago (
    CodPago INT PRIMARY KEY,
    CodSocio INT,
    Monto DECIMAL(8,2),
    FechaPago DATE,
    MetodoPago VARCHAR(30),
    EstadoPago VARCHAR(20),
    FOREIGN KEY (CodSocio)
        REFERENCES Socio (CodSocio)
        ON DELETE CASCADE
);


CREATE TABLE Reserva (
    CodReserva INT PRIMARY KEY,
    CodSocio INT,
    CodClase INT,
    FechaReserva DATE,
    EstadoReserva VARCHAR(20),
    FOREIGN KEY (CodSocio)
        REFERENCES Socio (CodSocio),
    FOREIGN KEY (CodClase)
        REFERENCES Clase (CodClase)
);

CREATE TABLE Asistencia (
    CodAsistencia INT PRIMARY KEY,
    CodSocio INT,
    CodClase INT,
    FechaHora DATETIME,
    FOREIGN KEY (CodSocio)
        REFERENCES Socio (CodSocio),
    FOREIGN KEY (CodClase)
        REFERENCES Clase (CodClase)
);

-- Socios
INSERT INTO Socio VALUES (1, 'Juan', 'Pérez', 28, '600123456', 'juan.perez@gmail.com', 'Calle 1', 'Mensual', '2024-01-10');
INSERT INTO Socio VALUES (2, 'Ana', 'García', 35, '600654321', 'ana.garcia@gmail.com', 'Calle 2', 'Anual', '2024-02-15');
INSERT INTO Socio VALUES (3, 'Luis', 'Martínez', 22, '600789012', 'luis.martinez@gmail.com', 'Calle 3', 'Mensual', '2024-03-20');
INSERT INTO Socio VALUES (4, 'Sofía', 'Hernández', 30, '600345678', 'sofia.hernandez@gmail.com', 'Calle 4', 'Trimestral', '2024-04-25');
INSERT INTO Socio VALUES (5, 'Miguel', 'Sánchez', 40, '600987654', 'miguel.sanchez@gmail.com', 'Calle 5', 'Anual', '2024-05-30');

-- Entrenadores
INSERT INTO Entrenador VALUES (1, 'Carlos', 'López', 'Yoga', '600111222', 'carlos.lopez@email.com', 1500.00);
INSERT INTO Entrenador VALUES (2, 'María', 'Ruiz', 'Spinning', '600333444', 'maria.ruiz@email.com', 1600.00);

-- Clases
INSERT INTO Clase VALUES (1, 'Yoga Básico', 'Clase para principiantes', 1, '2024-06-10 09:00:00', 60, 20);
INSERT INTO Clase VALUES (2, 'Spinning Avanzado', 'Clase intensa de spinning', 2, '2024-06-11 18:00:00', 45, 15);

-- Pagos
INSERT INTO Pago VALUES (1, 1, 50.00, '2024-01-10', 'Tarjeta', 'Pagado');
INSERT INTO Pago VALUES (2, 2, 500.00, '2024-02-15', 'Efectivo', 'Pagado');
INSERT INTO Pago VALUES (3, 3, 50.00, '2024-03-20', 'Tarjeta', 'Pagado');
INSERT INTO Pago VALUES (4, 4, 150.00, '2024-04-25', 'Transferencia', 'Pagado');
INSERT INTO Pago VALUES (5, 5, 500.00, '2024-05-30', 'Efectivo', 'Pagado');
INSERT INTO Pago VALUES (6, 1, 50.00, '2024-06-10', 'Tarjeta', 'Pagado');
INSERT INTO Pago VALUES (7, 2, 500.00, '2024-06-15', 'Efectivo', 'Pendiente');
INSERT INTO Pago VALUES (8, 3, 50.00, '2024-06-20', 'Tarjeta', 'Pagado');
INSERT INTO Pago VALUES (9, 4, 150.00, '2024-06-25', 'Transferencia', 'Pendiente');
INSERT INTO Pago VALUES (10, 5, 500.00, '2024-06-30', 'Efectivo', 'Pagado');

-- Reservas
INSERT INTO Reserva VALUES (1, 1, 1, '2024-06-09', 'Confirmada');
INSERT INTO Reserva VALUES (2, 2, 2, '2024-06-10', 'Pendiente');

-- Asistencias
INSERT INTO Asistencia VALUES (1, 1, 1, '2024-06-10 09:05:00');
INSERT INTO Asistencia VALUES (2, 2, 2, '2024-06-11 18:02:00');