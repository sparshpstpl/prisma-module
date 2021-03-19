/*
  Warnings:

  - Added the required column `unitApplicationId` to the `UnitApplication` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "UnitApplication" ADD COLUMN     "unitApplicationId" TEXT NOT NULL;
