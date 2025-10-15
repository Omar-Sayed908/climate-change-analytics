create database climate_changes 
create table source
(source_id int primary key,
source_name varchar(50),
source_url varchar(200),
created_at date default getdate() ,
updated_at date default getdate()

)
CREATE TABLE Indicator (
    Indicator_ID INT PRIMARY KEY,
    Category VARCHAR(100),
    Indicator_Name VARCHAR(100),
    Description TEXT,
    Created_At DATE default getdate(),
    Updated_At DATE default getdate(),
    Unit VARCHAR(20),
    S_ID INT,
    FOREIGN KEY (S_ID) REFERENCES Source(Source_ID)
);

-- Country Table
CREATE TABLE Country (
    Country_ID INT PRIMARY KEY,
    Country_Name VARCHAR(50),
    Region VARCHAR(50),
    ISO_Code VARCHAR(10),
    Created_At DATE default getdate()
);

-- Observation Table
CREATE TABLE Observation (
    Observation_ID INT PRIMARY KEY,
    Value FLOAT,
    Year INT,
    Created_At DATE default getdate(),
    Updated_At DATE default getdate(),
    I_ID INT,
    C_ID INT,
    FOREIGN KEY (I_ID) REFERENCES Indicator(Indicator_ID),
    FOREIGN KEY (C_ID) REFERENCES Country(Country_ID)
);
