/*
  Warnings:

  - Made the column `unitCounterpartyId` on table `UnitRelationship` required. The migration will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "UnitRelationship" ALTER COLUMN "unitCounterpartyId" SET NOT NULL;

-- AddForeignKey
ALTER TABLE "UnitRelationship" ADD FOREIGN KEY ("unitCounterpartyId") REFERENCES "UnitCounterpartie"("unitCounterpartyId") ON DELETE CASCADE ON UPDATE CASCADE;
