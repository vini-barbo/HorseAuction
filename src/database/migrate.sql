CREATE TABLE "auction_item_list"(
    "auction_id" BIGINT NOT NULL,
    "item_id" BIGINT NOT NULL,
    "status" INTEGER NOT NULL,
    "deadline" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "auction_item_list" ADD PRIMARY KEY("auction_id");
ALTER TABLE
    "auction_item_list" ADD CONSTRAINT "auction_item_list_item_id_unique" UNIQUE("item_id");
CREATE TABLE "user"(
    "user_id" BIGINT NOT NULL,
    "nome" TEXT NOT NULL,
    "email" TEXT NOT NULL UNIQUE,
    "password" UUID NOT NULL,
    "type" INTEGER NOT NULL,
    "company_id" BIGINT NULL,
    "status" INTEGER NOT NULL,
    "update_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "create_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "deleted_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "user" ADD PRIMARY KEY("user_id");
CREATE TABLE "user_type"(
    "user_type_id" BIGINT NOT NULL,
    "role" TEXT NOT NULL,
    "description" TEXT NOT NULL
);
ALTER TABLE
    "user_type" ADD PRIMARY KEY("user_type_id");
CREATE TABLE "bid_list"(
    "value" BIGINT NOT NULL,
    "time" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "user_id" BIGINT NOT NULL,
    "item_id" BIGINT NOT NULL
);
ALTER TABLE
    "bid_list" ADD PRIMARY KEY("item_id");
CREATE TABLE "auction"(
    "auction_id" BIGINT NOT NULL,
    "name" TEXT NOT NULL,
    "company_id" BIGINT NOT NULL,
    "status" INTEGER NOT NULL
);
ALTER TABLE
    "auction" ADD PRIMARY KEY("auction_id");
CREATE TABLE "horse"(
    "horse_id" BIGINT NOT NULL,
    "company_id" BIGINT NOT NULL,
    "status" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "race" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    "genre" CHAR(255) NOT NULL,
    "description" TEXT NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "update_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "deleted_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "horse" ADD PRIMARY KEY("horse_id");
CREATE TABLE "subproduct"(
    "subproduct_id" BIGINT NOT NULL,
    "company_id" BIGINT NOT NULL,
    "type" TEXT NOT NULL,
    "value" BIGINT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "update_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "deleted_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "status" INTEGER NOT NULL
);
ALTER TABLE
    "subproduct" ADD PRIMARY KEY("subproduct_id");
CREATE TABLE "user_auction_enroll"(
    "user_id" BIGINT NOT NULL,
    "auction_id" BIGINT NOT NULL
);
CREATE TABLE "company"(
    "company_id" BIGINT NOT NULL,
    "CNPJ" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "status" INTEGER NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "deleted_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "company" ADD PRIMARY KEY("company_id");
ALTER TABLE
    "user" ADD CONSTRAINT "user_company_id_foreign" FOREIGN KEY("company_id") REFERENCES "company"("company_id");
ALTER TABLE
    "horse" ADD CONSTRAINT "horse_company_id_foreign" FOREIGN KEY("company_id") REFERENCES "company"("company_id");
ALTER TABLE
    "bid_list" ADD CONSTRAINT "bid_list_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "user"("user_id");
ALTER TABLE
    "auction_item_list" ADD CONSTRAINT "auction_item_list_item_id_foreign1" FOREIGN KEY("item_id") REFERENCES "bid_list"("item_id");
ALTER TABLE
    "auction_item_list" ADD CONSTRAINT "auction_item_list_item_id_foreign2" FOREIGN KEY("item_id") REFERENCES "horse"("horse_id");
ALTER TABLE
    "auction_item_list" ADD CONSTRAINT "auction_item_list_auction_id_foreign3" FOREIGN KEY("auction_id") REFERENCES "auction"("auction_id");
ALTER TABLE
    "user_auction_enroll" ADD CONSTRAINT "user_auction_enroll_auction_id_foreign" FOREIGN KEY("auction_id") REFERENCES "auction"("auction_id");
ALTER TABLE
    "user_auction_enroll" ADD CONSTRAINT "user_auction_enroll_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "user"("user_id");
ALTER TABLE
    "auction" ADD CONSTRAINT "auction_company_id_foreign" FOREIGN KEY("company_id") REFERENCES "company"("company_id");
ALTER TABLE
    "user" ADD CONSTRAINT "user_type_foreign" FOREIGN KEY("type") REFERENCES "user_type"("user_type_id");
ALTER TABLE
    "auction_item_list" ADD CONSTRAINT "auction_item_list_item_id_foreign" FOREIGN KEY("item_id") REFERENCES "subproduct"("subproduct_id");
ALTER TABLE
    "subproduct" ADD CONSTRAINT "subproduct_company_id_foreign" FOREIGN KEY("company_id") REFERENCES "company"("company_id");