-- CreateEnum
CREATE TYPE "mpaa_rating" AS ENUM ('G', 'PG', 'PG-13', 'R', 'NC-17');

-- CreateTable
CREATE TABLE "actor" (
    "actor_id" SERIAL NOT NULL,
    "first_name" VARCHAR(45) NOT NULL,
    "last_name" VARCHAR(45) NOT NULL,
    "last_update" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY ("actor_id")
);

-- CreateTable
CREATE TABLE "address" (
    "address_id" SERIAL NOT NULL,
    "address" VARCHAR(50) NOT NULL,
    "address2" VARCHAR(50),
    "district" VARCHAR(20) NOT NULL,
    "city_id" INTEGER NOT NULL,
    "postal_code" VARCHAR(10),
    "phone" VARCHAR(20) NOT NULL,
    "last_update" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY ("address_id")
);

-- CreateTable
CREATE TABLE "category" (
    "category_id" SERIAL NOT NULL,
    "name" VARCHAR(25) NOT NULL,
    "last_update" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY ("category_id")
);

-- CreateTable
CREATE TABLE "city" (
    "city_id" SERIAL NOT NULL,
    "city" VARCHAR(50) NOT NULL,
    "country_id" INTEGER NOT NULL,
    "last_update" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY ("city_id")
);

-- CreateTable
CREATE TABLE "country" (
    "country_id" SERIAL NOT NULL,
    "country" VARCHAR(50) NOT NULL,
    "last_update" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY ("country_id")
);

-- CreateTable
CREATE TABLE "customer" (
    "customer_id" SERIAL NOT NULL,
    "store_id" INTEGER NOT NULL,
    "first_name" VARCHAR(45) NOT NULL,
    "last_name" VARCHAR(45) NOT NULL,
    "email" VARCHAR(50),
    "address_id" INTEGER NOT NULL,
    "activebool" BOOLEAN NOT NULL DEFAULT true,
    "create_date" DATE NOT NULL DEFAULT ('now'::text)::date,
    "last_update" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "active" INTEGER,

    PRIMARY KEY ("customer_id")
);

-- CreateTable
CREATE TABLE "film" (
    "film_id" SERIAL NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "description" TEXT,
    "release_year" INTEGER,
    "language_id" INTEGER NOT NULL,
    "original_language_id" INTEGER,
    "rental_duration" SMALLINT NOT NULL DEFAULT 3,
    "rental_rate" DECIMAL(4,2) NOT NULL DEFAULT 4.99,
    "length" SMALLINT,
    "replacement_cost" DECIMAL(5,2) NOT NULL DEFAULT 19.99,
    "rating" "mpaa_rating" DEFAULT E'G',
    "last_update" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "special_features" TEXT[],
    "fulltext" tsvector NOT NULL,

    PRIMARY KEY ("film_id")
);

-- CreateTable
CREATE TABLE "film_actor" (
    "actor_id" INTEGER NOT NULL,
    "film_id" INTEGER NOT NULL,
    "last_update" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY ("actor_id","film_id")
);

-- CreateTable
CREATE TABLE "film_category" (
    "film_id" INTEGER NOT NULL,
    "category_id" INTEGER NOT NULL,
    "last_update" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY ("film_id","category_id")
);

-- CreateTable
CREATE TABLE "inventory" (
    "inventory_id" SERIAL NOT NULL,
    "film_id" INTEGER NOT NULL,
    "store_id" INTEGER NOT NULL,
    "last_update" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY ("inventory_id")
);

-- CreateTable
CREATE TABLE "language" (
    "language_id" SERIAL NOT NULL,
    "name" CHAR(20) NOT NULL,
    "last_update" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY ("language_id")
);

-- CreateTable
CREATE TABLE "payment" (
    "payment_id" SERIAL NOT NULL,
    "customer_id" INTEGER NOT NULL,
    "staff_id" INTEGER NOT NULL,
    "rental_id" INTEGER NOT NULL,
    "amount" DECIMAL(5,2) NOT NULL,
    "payment_date" TIMESTAMP(6) NOT NULL,

    PRIMARY KEY ("payment_id")
);

-- CreateTable
CREATE TABLE "payment_p2007_01" (
    "payment_id" SERIAL NOT NULL,
    "customer_id" INTEGER NOT NULL,
    "staff_id" INTEGER NOT NULL,
    "rental_id" INTEGER NOT NULL,
    "amount" DECIMAL(5,2) NOT NULL,
    "payment_date" TIMESTAMP(6) NOT NULL
);

-- CreateTable
CREATE TABLE "payment_p2007_02" (
    "payment_id" SERIAL NOT NULL,
    "customer_id" INTEGER NOT NULL,
    "staff_id" INTEGER NOT NULL,
    "rental_id" INTEGER NOT NULL,
    "amount" DECIMAL(5,2) NOT NULL,
    "payment_date" TIMESTAMP(6) NOT NULL
);

-- CreateTable
CREATE TABLE "payment_p2007_03" (
    "payment_id" SERIAL NOT NULL,
    "customer_id" INTEGER NOT NULL,
    "staff_id" INTEGER NOT NULL,
    "rental_id" INTEGER NOT NULL,
    "amount" DECIMAL(5,2) NOT NULL,
    "payment_date" TIMESTAMP(6) NOT NULL
);

-- CreateTable
CREATE TABLE "payment_p2007_04" (
    "payment_id" SERIAL NOT NULL,
    "customer_id" INTEGER NOT NULL,
    "staff_id" INTEGER NOT NULL,
    "rental_id" INTEGER NOT NULL,
    "amount" DECIMAL(5,2) NOT NULL,
    "payment_date" TIMESTAMP(6) NOT NULL
);

-- CreateTable
CREATE TABLE "payment_p2007_05" (
    "payment_id" SERIAL NOT NULL,
    "customer_id" INTEGER NOT NULL,
    "staff_id" INTEGER NOT NULL,
    "rental_id" INTEGER NOT NULL,
    "amount" DECIMAL(5,2) NOT NULL,
    "payment_date" TIMESTAMP(6) NOT NULL
);

-- CreateTable
CREATE TABLE "payment_p2007_06" (
    "payment_id" SERIAL NOT NULL,
    "customer_id" INTEGER NOT NULL,
    "staff_id" INTEGER NOT NULL,
    "rental_id" INTEGER NOT NULL,
    "amount" DECIMAL(5,2) NOT NULL,
    "payment_date" TIMESTAMP(6) NOT NULL
);

-- CreateTable
CREATE TABLE "rental" (
    "rental_id" SERIAL NOT NULL,
    "rental_date" TIMESTAMP(6) NOT NULL,
    "inventory_id" INTEGER NOT NULL,
    "customer_id" INTEGER NOT NULL,
    "return_date" TIMESTAMP(6),
    "staff_id" INTEGER NOT NULL,
    "last_update" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY ("rental_id")
);

-- CreateTable
CREATE TABLE "staff" (
    "staff_id" SERIAL NOT NULL,
    "first_name" VARCHAR(45) NOT NULL,
    "last_name" VARCHAR(45) NOT NULL,
    "address_id" INTEGER NOT NULL,
    "email" VARCHAR(50),
    "store_id" INTEGER NOT NULL,
    "active" BOOLEAN NOT NULL DEFAULT true,
    "username" VARCHAR(16) NOT NULL,
    "password" VARCHAR(40),
    "last_update" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "picture" BYTEA,

    PRIMARY KEY ("staff_id")
);

-- CreateTable
CREATE TABLE "store" (
    "store_id" SERIAL NOT NULL,
    "manager_staff_id" INTEGER NOT NULL,
    "address_id" INTEGER NOT NULL,
    "last_update" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY ("store_id")
);

-- CreateIndex
CREATE INDEX "idx_actor_last_name" ON "actor"("last_name");

-- CreateIndex
CREATE INDEX "idx_fk_city_id" ON "address"("city_id");

-- CreateIndex
CREATE INDEX "idx_fk_country_id" ON "city"("country_id");

-- CreateIndex
CREATE INDEX "idx_fk_address_id" ON "customer"("address_id");

-- CreateIndex
CREATE INDEX "idx_fk_store_id" ON "customer"("store_id");

-- CreateIndex
CREATE INDEX "idx_last_name" ON "customer"("last_name");

-- CreateIndex
CREATE INDEX "film_fulltext_idx" ON "film"("fulltext");

-- CreateIndex
CREATE INDEX "idx_fk_language_id" ON "film"("language_id");

-- CreateIndex
CREATE INDEX "idx_fk_original_language_id" ON "film"("original_language_id");

-- CreateIndex
CREATE INDEX "idx_title" ON "film"("title");

-- CreateIndex
CREATE INDEX "idx_fk_film_id" ON "film_actor"("film_id");

-- CreateIndex
CREATE INDEX "idx_store_id_film_id" ON "inventory"("store_id", "film_id");

-- CreateIndex
CREATE INDEX "idx_fk_customer_id" ON "payment"("customer_id");

-- CreateIndex
CREATE INDEX "idx_fk_staff_id" ON "payment"("staff_id");

-- CreateIndex
CREATE INDEX "idx_fk_payment_p2007_01_customer_id" ON "payment_p2007_01"("customer_id");

-- CreateIndex
CREATE INDEX "idx_fk_payment_p2007_01_staff_id" ON "payment_p2007_01"("staff_id");

-- CreateIndex
CREATE INDEX "idx_fk_payment_p2007_02_customer_id" ON "payment_p2007_02"("customer_id");

-- CreateIndex
CREATE INDEX "idx_fk_payment_p2007_02_staff_id" ON "payment_p2007_02"("staff_id");

-- CreateIndex
CREATE INDEX "idx_fk_payment_p2007_03_customer_id" ON "payment_p2007_03"("customer_id");

-- CreateIndex
CREATE INDEX "idx_fk_payment_p2007_03_staff_id" ON "payment_p2007_03"("staff_id");

-- CreateIndex
CREATE INDEX "idx_fk_payment_p2007_04_customer_id" ON "payment_p2007_04"("customer_id");

-- CreateIndex
CREATE INDEX "idx_fk_payment_p2007_04_staff_id" ON "payment_p2007_04"("staff_id");

-- CreateIndex
CREATE INDEX "idx_fk_payment_p2007_05_customer_id" ON "payment_p2007_05"("customer_id");

-- CreateIndex
CREATE INDEX "idx_fk_payment_p2007_05_staff_id" ON "payment_p2007_05"("staff_id");

-- CreateIndex
CREATE INDEX "idx_fk_payment_p2007_06_customer_id" ON "payment_p2007_06"("customer_id");

-- CreateIndex
CREATE INDEX "idx_fk_payment_p2007_06_staff_id" ON "payment_p2007_06"("staff_id");

-- CreateIndex
CREATE UNIQUE INDEX "idx_unq_rental_rental_date_inventory_id_customer_id" ON "rental"("rental_date", "inventory_id", "customer_id");

-- CreateIndex
CREATE INDEX "idx_fk_inventory_id" ON "rental"("inventory_id");

-- CreateIndex
CREATE UNIQUE INDEX "store.manager_staff_id_unique" ON "store"("manager_staff_id");

-- AddForeignKey
ALTER TABLE "address" ADD FOREIGN KEY ("city_id") REFERENCES "city"("city_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "city" ADD FOREIGN KEY ("country_id") REFERENCES "country"("country_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "customer" ADD FOREIGN KEY ("address_id") REFERENCES "address"("address_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "customer" ADD FOREIGN KEY ("store_id") REFERENCES "store"("store_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "film" ADD FOREIGN KEY ("language_id") REFERENCES "language"("language_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "film" ADD FOREIGN KEY ("original_language_id") REFERENCES "language"("language_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "film_actor" ADD FOREIGN KEY ("actor_id") REFERENCES "actor"("actor_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "film_actor" ADD FOREIGN KEY ("film_id") REFERENCES "film"("film_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "film_category" ADD FOREIGN KEY ("category_id") REFERENCES "category"("category_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "film_category" ADD FOREIGN KEY ("film_id") REFERENCES "film"("film_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "inventory" ADD FOREIGN KEY ("film_id") REFERENCES "film"("film_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "inventory" ADD FOREIGN KEY ("store_id") REFERENCES "store"("store_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "payment" ADD FOREIGN KEY ("customer_id") REFERENCES "customer"("customer_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "payment" ADD FOREIGN KEY ("rental_id") REFERENCES "rental"("rental_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "payment" ADD FOREIGN KEY ("staff_id") REFERENCES "staff"("staff_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "payment_p2007_01" ADD FOREIGN KEY ("customer_id") REFERENCES "customer"("customer_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "payment_p2007_01" ADD FOREIGN KEY ("rental_id") REFERENCES "rental"("rental_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "payment_p2007_01" ADD FOREIGN KEY ("staff_id") REFERENCES "staff"("staff_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "payment_p2007_02" ADD FOREIGN KEY ("customer_id") REFERENCES "customer"("customer_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "payment_p2007_02" ADD FOREIGN KEY ("rental_id") REFERENCES "rental"("rental_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "payment_p2007_02" ADD FOREIGN KEY ("staff_id") REFERENCES "staff"("staff_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "payment_p2007_03" ADD FOREIGN KEY ("customer_id") REFERENCES "customer"("customer_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "payment_p2007_03" ADD FOREIGN KEY ("rental_id") REFERENCES "rental"("rental_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "payment_p2007_03" ADD FOREIGN KEY ("staff_id") REFERENCES "staff"("staff_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "payment_p2007_04" ADD FOREIGN KEY ("customer_id") REFERENCES "customer"("customer_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "payment_p2007_04" ADD FOREIGN KEY ("rental_id") REFERENCES "rental"("rental_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "payment_p2007_04" ADD FOREIGN KEY ("staff_id") REFERENCES "staff"("staff_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "payment_p2007_05" ADD FOREIGN KEY ("customer_id") REFERENCES "customer"("customer_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "payment_p2007_05" ADD FOREIGN KEY ("rental_id") REFERENCES "rental"("rental_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "payment_p2007_05" ADD FOREIGN KEY ("staff_id") REFERENCES "staff"("staff_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "payment_p2007_06" ADD FOREIGN KEY ("customer_id") REFERENCES "customer"("customer_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "payment_p2007_06" ADD FOREIGN KEY ("rental_id") REFERENCES "rental"("rental_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "payment_p2007_06" ADD FOREIGN KEY ("staff_id") REFERENCES "staff"("staff_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "rental" ADD FOREIGN KEY ("customer_id") REFERENCES "customer"("customer_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "rental" ADD FOREIGN KEY ("inventory_id") REFERENCES "inventory"("inventory_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "rental" ADD FOREIGN KEY ("staff_id") REFERENCES "staff"("staff_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "staff" ADD FOREIGN KEY ("address_id") REFERENCES "address"("address_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "staff" ADD FOREIGN KEY ("store_id") REFERENCES "store"("store_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "store" ADD FOREIGN KEY ("address_id") REFERENCES "address"("address_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "store" ADD FOREIGN KEY ("manager_staff_id") REFERENCES "staff"("staff_id") ON DELETE CASCADE ON UPDATE CASCADE;
