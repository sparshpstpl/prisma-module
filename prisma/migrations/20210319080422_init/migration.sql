-- CreateTable
CREATE TABLE "UnitApplication" (
    "id" TEXT NOT NULL,
    "ownerId" TEXT NOT NULL,
    "ownerType" TEXT NOT NULL,
    "applicationType" TEXT NOT NULL,
    "applicationStatus" TEXT NOT NULL,
    "tribeId" TEXT NOT NULL,
    "applicationData" JSONB,
    "businessId" TEXT,
    "unitApplicationId" TEXT NOT NULL,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UnitCustomer" (
    "id" TEXT NOT NULL,
    "ownerId" TEXT NOT NULL,
    "ownerType" TEXT NOT NULL,
    "unitCustomerId" TEXT NOT NULL,
    "unitApplicationId" TEXT NOT NULL,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UnitApplicationDocument" (
    "id" TEXT NOT NULL,
    "applicationId" TEXT NOT NULL,
    "ownerId" TEXT NOT NULL,
    "ownerType" TEXT NOT NULL,
    "unitDocumentId" TEXT NOT NULL,
    "documentId" TEXT,
    "status" TEXT NOT NULL,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UnitCustomerAccount" (
    "id" TEXT NOT NULL,
    "ownerId" TEXT NOT NULL,
    "ownerType" TEXT NOT NULL,
    "accountId" TEXT NOT NULL,
    "accountType" TEXT NOT NULL,
    "accountStatus" TEXT NOT NULL,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UnitCounterparties" (
    "id" TEXT NOT NULL,
    "ownerId" TEXT NOT NULL,
    "ownerType" TEXT NOT NULL,
    "customerId" TEXT NOT NULL,
    "unitCounterpartyId" TEXT NOT NULL,
    "bank" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "accountType" TEXT NOT NULL,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UnitTransactions" (
    "transactionId" TEXT NOT NULL,
    "accountId" TEXT NOT NULL,
    "counterpartyId" TEXT NOT NULL,
    "amount" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "accountType" TEXT NOT NULL,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY ("transactionId")
);

-- CreateIndex
CREATE UNIQUE INDEX "UnitCustomer.unitCustomerId_unique" ON "UnitCustomer"("unitCustomerId");

-- CreateIndex
CREATE UNIQUE INDEX "UnitApplicationDocument.unitDocumentId_unique" ON "UnitApplicationDocument"("unitDocumentId");

-- CreateIndex
CREATE UNIQUE INDEX "UnitCustomerAccount.accountId_unique" ON "UnitCustomerAccount"("accountId");

-- CreateIndex
CREATE UNIQUE INDEX "UnitCounterparties.unitCounterpartyId_unique" ON "UnitCounterparties"("unitCounterpartyId");

-- AddForeignKey
ALTER TABLE "UnitApplicationDocument" ADD FOREIGN KEY ("applicationId") REFERENCES "UnitApplication"("id") ON DELETE CASCADE ON UPDATE CASCADE;
