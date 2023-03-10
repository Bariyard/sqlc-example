-- schema.sql
CREATE TYPE "role_type" AS ENUM (
  'SUPER_ADMIN',
  'ADMIN',
  'OWNER',
  'CASHIER',
  'SALE_DESK',
  'SALES',
  'HR',
  'STOCK',
  'EMPLOYEE'
);

CREATE TABLE "user" (
  "username" varchar PRIMARY KEY,
  "hashed_password" varchar NOT NULL,
  "full_name" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "role_id" role_type NOT NULL DEFAULT ('EMPLOYEE'),
  "password_changed_at" timestamptz NOT NULL DEFAULT ('0001-01-01 00:00:00z'),
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "modified_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "company" (
  "id" bigint PRIMARY KEY,
  "owner" varchar NOT NULL,
  "name" varchar NOT NULL,
  "taxid" varchar NOT NULL,
  "address" varchar
);

CREATE TABLE "branch" (
  "id" bigint PRIMARY KEY,
  "company_id" bigint NOT NULL,
  "name" varchar NOT NULL,
  "taxid" varchar NOT NULL,
  "address" varchar
);

ALTER TABLE "company" ADD FOREIGN KEY ("owner") REFERENCES "user" ("username");

ALTER TABLE "branch" ADD FOREIGN KEY ("company_id") REFERENCES "company" ("id");
