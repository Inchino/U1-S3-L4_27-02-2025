CREATE DATABASE Esercizio4;
GO

USE Esercizio4;
GO

CREATE TABLE Impiegato(
ImpiegatoID INT IDENTITY(1,1) PRIMARY KEY,
Cognome VARCHAR(50) NOT NULL,
Nome VARCHAR(50) NOT NULL,
CF VARCHAR(50) NOT NULL,
Eta INT NOT NULL,
RedditoMensile DECIMAL(10,2) NOT NULL,
DetrazioneFiscale BIT NOT NULL
);

CREATE TABLE Impiego(
ImpiegoID INT IDENTITY(1,1) PRIMARY KEY,
TipoImpiego VARCHAR(100) NOT NULL,
Assunzione DATETIME NOT NULL,
ImpiegatoID INT NOT NULL,
FOREIGN KEY (ImpiegatoID) REFERENCES Impiegato(ImpiegatoID) ON DELETE CASCADE
);

INSERT INTO Impiegato (Cognome, Nome, CF, Eta, RedditoMensile, DetrazioneFiscale) 
VALUES
('Rossi', 'Mario', 'RSSMRA80A01H501Z', 35, 1200, 1),
('Bianchi', 'Luca', 'BNCLCU85B02L219N', 40, 900, 0),
('Verdi', 'Anna', 'VRDANN90C03F205L', 28, 1100, 1),
('Galli', 'Franco', 'GLLFNC75D04H501Z', 50, 2500, 1),
('Neri', 'Giulia', 'NERGLA95E05L219N', 32, 700, 0),
('Russo', 'Marco', 'RSSMRC88F06F205L', 45, 1500, 1),
('Ferrari', 'Elena', 'FRRLNA77G07H501Z', 38, 2000, 1),
('Esposito', 'Andrea', 'ESPADR82H08L219N', 29, 750, 0),
('Colombo', 'Paola', 'CLBPLA93I09F205L', 27, 850, 1),
('Romano', 'Stefano', 'RMNSFN86J10H501Z', 31, 1300, 1),
('Gatti', 'Federica', 'GTTFDC79K11L219N', 33, 1700, 1),
('Moretti', 'Simone', 'MRTSMN84L12F205L', 41, 1900, 0),
('Fontana', 'Chiara', 'FNTCHR97M13H501Z', 25, 950, 1),
('Conti', 'Lorenzo', 'CNTLRZ92N14L219N', 39, 1250, 1),
('De Luca', 'Valentina', 'DLCVLN81O15F205L', 34, 1800, 1),
('Fabbri', 'Giovanni', 'FBBGVN78P16H501Z', 48, 1600, 0),
('Ricci', 'Martina', 'RCCMRT85Q17L219N', 30, 1400, 1),
('Marini', 'Antonio', 'MRNANT89R18F205L', 37, 2200, 1),
('Marchi', 'Sara', 'MRCSRA96S19H501Z', 26, 1000, 0),
('Villa', 'Alessandro', 'VLLALS83T20L219N', 42, 1550, 1);

INSERT INTO IMPIEGO (TipoImpiego, Assunzione, ImpiegatoID) 
VALUES
('Ingegnere', '20071215', 1),
('Analista', '20120621', 2),
('Tecnico', '20150830', 3),
('Manager', '20071114', 4),
('Segretaria', '20160405', 5),
('Operaio', '20130925', 6),
('Contabile', '20110112', 7),
('Marketing', '20170709', 8),
('Supporto IT', '20190517', 9),
('Venditore', '20140228', 10);

-- punto a
SELECT * FROM Impiegato WHERE ETA>29;

-- punto b
SELECT * FROM Impiegato WHERE RedditoMensile >= 800;

-- punto c 
SELECT * FROM Impiegato WHERE DetrazioneFiscale = 1;

-- punto d
SELECT * FROM Impiegato WHERE DetrazioneFiscale = 0;

-- punto e
SELECT * FROM Impiegato WHERE Cognome LIKE 'G%' ORDER BY Cognome;

-- punto f
SELECT COUNT(*) AS TotaleImpiegati FROM Impiegato; 

-- punto g
SELECT SUM(RedditoMensile) AS RedditoMassimo FROM Impiegato;

-- punto h
SELECT AVG(RedditoMensile) AS MediaReddito FROM Impiegato;

-- punto i
SELECT MAX(RedditoMensile) AS RedditoMassimo FROM Impiegato;

-- punto j
SELECT MIN(RedditoMensile) AS RedditoMinimo FROM Impiegato;

-- punto k
SELECT * FROM Impiego WHERE Assunzione BETWEEN '20070101' AND '20080101';

-- punto l
DECLARE @TipoImpiego NVARCHAR(100) = 'Ingegnere';
SELECT I.* FROM Impiegato I
JOIN Impiego J ON I.ImpiegatoID = J.ImpiegatoID
WHERE J.TipoImpiego = @TipoImpiego;

-- punto m
SELECT AVG(Eta) AS EtaMedia FROM Impiegato;
