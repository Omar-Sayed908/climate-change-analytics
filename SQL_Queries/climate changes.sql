create database Climate 
GO
USE Climate
GO

create table source (
    source_id int primary key IDENTITY(1, 1),
    source_name varchar(50),
    source_url varchar(200),
    created_at date default getdate(),
    updated_at date default getdate()
);

CREATE TABLE Indicator (
    Indicator_ID INT PRIMARY KEY IDENTITY(1, 1),
    Category VARCHAR(100),
    Indicator_Name VARCHAR(100),
    Description TEXT,
    Created_At DATE default getdate(),
    Updated_At DATE default getdate(),
    Unit VARCHAR(50),
    S_ID INT,
    FOREIGN KEY (S_ID) REFERENCES Source(Source_ID) ON DELETE SET NULL
);


-- Country Table
CREATE TABLE Country (
    Country_ID INT PRIMARY KEY IDENTITY(1, 1),
    Country_Name VARCHAR(50),
    Region VARCHAR(50) NULL,
    ISO_Code VARCHAR(10),
    Created_At DATE default getdate()
);

-- Observation Table
CREATE TABLE Observation (
    Observation_ID INT PRIMARY KEY IDENTITY(1, 1),
    Value FLOAT,
    Year INT,
    Created_At DATE default getdate(),
    Updated_At DATE default getdate(),
    I_ID INT,
    C_ID INT,
    FOREIGN KEY (I_ID) REFERENCES Indicator(Indicator_ID) ON DELETE SET NULL,
    FOREIGN KEY (C_ID) REFERENCES Country(Country_ID) ON DELETE SET NULL
);


-- DROP DATABASE Climate

