/*
  Warnings:

  - Added the required column `unitApplicationIds` to the `UnitApplication` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "UnitApplication" ADD COLUMN     "unitApplicationIds" TEXT NOT NULL;
