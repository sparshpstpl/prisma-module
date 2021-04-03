/*
  Warnings:

  - The migration will add a unique constraint covering the columns `[unitApplicationId]` on the table `UnitApplication`. If there are existing duplicate values, the migration will fail.
  - The migration will add a unique constraint covering the columns `[unitApplicationId]` on the table `UnitCustomer`. If there are existing duplicate values, the migration will fail.

*/
-- CreateTable
CREATE TABLE "UnitRelationship" (
    "id" TEXT NOT NULL,
    "unitApplicationId" TEXT NOT NULL,
    "unitCustomerId" TEXT NOT NULL,
    "unitAccountId" TEXT NOT NULL,
    "unitCounterpartyId" TEXT,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "UnitApplication.unitApplicationId_unique" ON "UnitApplication"("unitApplicationId");

-- CreateIndex
CREATE UNIQUE INDEX "UnitCustomer.unitApplicationId_unique" ON "UnitCustomer"("unitApplicationId");

-- AddForeignKey
ALTER TABLE "UnitRelationship" ADD FOREIGN KEY ("unitApplicationId") REFERENCES "UnitApplication"("unitApplicationId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UnitRelationship" ADD FOREIGN KEY ("unitCustomerId") REFERENCES "UnitCustomer"("unitCustomerId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UnitRelationship" ADD FOREIGN KEY ("unitAccountId") REFERENCES "UnitCustomerAccount"("accountId") ON DELETE CASCADE ON UPDATE CASCADE;
