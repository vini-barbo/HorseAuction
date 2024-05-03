CREATE TABLE
    "auctionItemList" (
        "auctionId" UUID NOT NULL,
        "itemId" UUID NOT NULL,
        "status" INTEGER NOT NULL,
        "deadline" TIMESTAMP(0)
        WITH
            TIME zone NOT NULL
    );

ALTER TABLE "auctionItemList" ADD PRIMARY KEY ("auctionId");

ALTER TABLE "auctionItemList" ADD CONSTRAINT "auctionitemlist_itemid_unique" UNIQUE ("itemId");

CREATE TABLE
    "user" (
        "userId" UUID NOT NULL,
        "email" TEXT NOT NULL,
        "nome" TEXT NOT NULL,
        "password" TEXT NOT NULL,
        "role" CHAR(255) NOT NULL,
        "company_id" BIGINT NULL,
        "status" INTEGER NOT NULL,
        "createdAt" TIMESTAMP(0)
        WITH
            TIME zone NOT NULL,
            "updateAt" TIMESTAMP(0)
        WITH
            TIME zone NULL,
            "deletedAt" TIMESTAMP(0)
        WITH
            TIME zone NULL
    );

ALTER TABLE "user" ADD PRIMARY KEY ("userId");

ALTER TABLE "user" ADD CONSTRAINT "user_email_unique" UNIQUE ("email");

ALTER TABLE "user" ADD CONSTRAINT "user_company_id_unique" UNIQUE ("company_id");

CREATE TABLE
    "bidList" (
        "value" DECIMAL(8, 2) NOT NULL,
        "time" TIMESTAMP(0)
        WITH
            TIME zone NOT NULL,
            "userId" UUID NOT NULL,
            "itemId" UUID NOT NULL
    );

ALTER TABLE "bidList" ADD PRIMARY KEY ("itemId");

CREATE TABLE
    "auction" (
        "auctionId" UUID NOT NULL,
        "name" TEXT NOT NULL,
        "company_id" BIGINT NOT NULL,
        "status" INTEGER NOT NULL,
        "createdAt" TIMESTAMP(0)
        WITH
            TIME zone NOT NULL,
            "updatedAt" TIMESTAMP(0)
        WITH
            TIME zone NULL,
            "deletedAt" TIMESTAMP(0)
        WITH
            TIME zone NULL
    );

ALTER TABLE "auction" ADD PRIMARY KEY ("auctionId");

CREATE TABLE
    "horse" (
        "horseId" BIGINT NOT NULL,
        "company_id" BIGINT NOT NULL,
        "status" INTEGER NOT NULL,
        "name" TEXT NOT NULL,
        "race" TEXT NOT NULL,
        "age" INTEGER NOT NULL,
        "genre" CHAR(255) NOT NULL,
        "description" TEXT NOT NULL,
        "createdAt" TIMESTAMP(0)
        WITH
            TIME zone NOT NULL,
            "updateAt" TIMESTAMP(0)
        WITH
            TIME zone NULL,
            "deletedAt" TIMESTAMP(0)
        WITH
            TIME zone NULL
    );

ALTER TABLE "horse" ADD PRIMARY KEY ("horseId");

CREATE TABLE
    "subproduct" (
        "subproductId" UUID NOT NULL,
        "companyId" BIGINT NOT NULL,
        "type" TEXT NOT NULL,
        "value" DECIMAL(8, 2) NOT NULL,
        "status" INTEGER NOT NULL,
        "name" TEXT NOT NULL,
        "description" TEXT NOT NULL,
        "createdAt" TIMESTAMP(0)
        WITH
            TIME zone NOT NULL,
            "updateAt" TIMESTAMP(0)
        WITH
            TIME zone NULL,
            "deletedAt" TIMESTAMP(0) WITHOUT TIME ZONE NULL
    );

ALTER TABLE "subproduct" ADD PRIMARY KEY ("subproductId");

CREATE TABLE
    "userAuctionEnroll" ("userId" UUID NOT NULL, "auctionId" UUID NOT NULL);

CREATE TABLE
    "company" (
        "companyId" UUID NOT NULL,
        "CNPJ" TEXT NOT NULL,
        "name" TEXT NOT NULL,
        "status" INTEGER NOT NULL,
        "createdAt" TIMESTAMP(0)
        WITH
            TIME zone NOT NULL,
            "updatedAt" TIMESTAMP(0)
        WITH
            TIME zone NULL,
            "deletedAt" TIMESTAMP(0)
        WITH
            TIME zone NULL
    );

ALTER TABLE "company" ADD PRIMARY KEY ("companyId");

ALTER TABLE "company" ADD CONSTRAINT "company_cnpj_unique" UNIQUE ("CNPJ");

ALTER TABLE "user" ADD CONSTRAINT "user_company_id_foreign" FOREIGN KEY ("company_id") REFERENCES "company" ("companyId");

ALTER TABLE "horse" ADD CONSTRAINT "horse_company_id_foreign" FOREIGN KEY ("company_id") REFERENCES "company" ("companyId");

ALTER TABLE "bidList" ADD CONSTRAINT "bidlist_userid_foreign" FOREIGN KEY ("userId") REFERENCES "user" ("userId");

ALTER TABLE "auctionItemList" ADD CONSTRAINT "auctionitemlist_itemid_foreign" FOREIGN KEY ("itemId") REFERENCES "bidList" ("itemId");

ALTER TABLE "auctionItemList" ADD CONSTRAINT "auctionitemlist_itemid_foreign" FOREIGN KEY ("itemId") REFERENCES "horse" ("horseId");

ALTER TABLE "auctionItemList" ADD CONSTRAINT "auctionitemlist_auctionid_foreign" FOREIGN KEY ("auctionId") REFERENCES "auction" ("auctionId");

ALTER TABLE "userAuctionEnroll" ADD CONSTRAINT "userauctionenroll_auctionid_foreign" FOREIGN KEY ("auctionId") REFERENCES "auction" ("auctionId");

ALTER TABLE "userAuctionEnroll" ADD CONSTRAINT "userauctionenroll_userid_foreign" FOREIGN KEY ("userId") REFERENCES "user" ("userId");

ALTER TABLE "auction" ADD CONSTRAINT "auction_company_id_foreign" FOREIGN KEY ("company_id") REFERENCES "company" ("companyId");

ALTER TABLE "auctionItemList" ADD CONSTRAINT "auctionitemlist_itemid_foreign" FOREIGN KEY ("itemId") REFERENCES "subproduct" ("subproductId");

ALTER TABLE "subproduct" ADD CONSTRAINT "subproduct_companyid_foreign" FOREIGN KEY ("companyId") REFERENCES "company" ("companyId");