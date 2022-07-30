--
-- criar o banco de dados
--
CREATE DATABASE "driven_bank";
--
-- TABELA customers
--
CREATE TABLE customers(
  id SERIAL PRIMARY KEY,
  "fullName" VARCHAR(75) NOT NULL,
  cpf VARCHAR(11) NOT NULL UNIQUE,
  email VARCHAR(30) NOT NULL,
  password VARCHAR(20) NOT NULL
);
--
-- TABELA states
--
CREATE TABLE states(
  id SERIAL PRIMARY KEY,
  name VARCHAR(30) NOT NULL
);
--
-- TABELA cities
--
CREATE TABLE cities(
  id SERIAL PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  "stateId" INTEGER NOT NULL REFERENCES states(id)
);
--
-- TABELA customerAddresses
--
CREATE TABLE "customersAddresses"(
  id SERIAL PRIMARY KEY,
  "customerId" INTEGER NOT NULL REFERENCES customers(id) UNIQUE,
  street VARCHAR(75) NOT NULL,
  number INTEGER NOT NULL,
  complement VARCHAR(50) NOT NULL,
  "postalCode" VARCHAR(8) NOT NULL,
  "cityId" INTEGER NOT NULL REFERENCES cities(id)
);
--
-- TABELA  customerPhones
--
CREATE TABLE "customerPhones"(
  id SERIAL PRIMARY KEY,
  "customerId" INTEGER NOT NULL REFERENCES customers(id),
  number VARCHAR(11) NOT NULL,
  type VARCHAR(20) NOT NULL
);
--
-- TABELA bankAccount
--
CREATE TABLE "bankAccount"(
  id SERIAL PRIMARY KEY,
  "customerId" INTEGER NOT NULL REFERENCES customers(id),
  "accountNumber" INTEGER NOT NULL,
  agency TEXT NOT NULL,
  "openDate" TIMESTAMP NOT NULL DEFAULT NOW(),
  "closeDate" TIMESTAMP DEFAULT NULL
);
--
-- TABELA transactions
--
CREATE TABLE transactions(
  id SERIAL PRIMARY KEY,
  "bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"(id),
  amount REAL NOT NULL DEFAULT 0,
  "type" TEXT NOT NULL,
  "time" TIMESTAMP NOT NULL DEFAULT NOW(),
  description TEXT NOT NULL,
  cancelled BOOLEAN NOT NULL DEFAULT false
);
--
-- TABELA creditCards
--
CREATE TABLE "creditCards"(
  id SERIAL PRIMARY KEY,
  "bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"(id),
  "name" VARCHAR(40) NOT NULL,
  "number" VARCHAR(20) NOT NULL,
  "securityCode" VARCHAR(3) NOT NULL,
  "expirationMonth" VARCHAR(2) NOT NULL,
  "expirationYear" VARCHAR(2) NOT NULL,
  "password" VARCHAR(8) NOT NULL,
  "limit" REAL NOT NULL DEFAULT 0
)