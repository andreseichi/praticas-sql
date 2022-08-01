CREATE TABLE "users" (
  "id" serial NOT NULL,
  "name" varchar(50) NOT NULL,
  "email" varchar(50) NOT NULL UNIQUE,
  "password" varchar(50) NOT NULL UNIQUE,
  CONSTRAINT "users_pk" PRIMARY KEY ("id")
);
CREATE TABLE "products" (
  "id" serial NOT NULL,
  "name" text NOT NULL,
  "price" numeric NOT NULL DEFAULT 0,
  "image" text NOT NULL,
  "mainImage" text NOT NULL,
  "categoryId" serial NOT NULL,
  CONSTRAINT "products_pk" PRIMARY KEY ("id")
);
CREATE TABLE "categories" (
  "id" serial NOT NULL,
  "name" TEXT NOT NULL UNIQUE,
  CONSTRAINT "categories_pk" PRIMARY KEY ("id")
);
CREATE TABLE "productsPurchased" (
  "id" serial NOT NULL,
  "userId" integer NOT NULL,
  "productId" integer NOT NULL,
  "productAmount" integer NOT NULL DEFAULT 1,
  "datePurchased" DATE NOT NULL DEFAULT now(),
  "customerAddress" TEXT NOT NULL,
  "orderState" varchar(9) NOT NULL,
  CONSTRAINT "productsPurchased_pk" PRIMARY KEY ("id")
);
ALTER TABLE "products"
ADD CONSTRAINT "products_fk0" FOREIGN KEY ("categoryId") REFERENCES "categories"("id");
ALTER TABLE "productsPurchased"
ADD CONSTRAINT "productsPurchased_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");
ALTER TABLE "productsPurchased"
ADD CONSTRAINT "productsPurchased_fk1" FOREIGN KEY ("productId") REFERENCES "products"("id");