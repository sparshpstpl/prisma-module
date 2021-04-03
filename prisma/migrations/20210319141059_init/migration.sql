/*
  Warnings:

  - You are about to drop the `UnitCounterparties` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `UnitTransactions` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "UnitCounterparties";

-- DropTable
DROP TABLE "UnitTransactions";

-- CreateTable
CREATE TABLE "UnitCounterpartie" (
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
CREATE TABLE "UnitTransaction" (
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

-- CreateTable
CREATE TABLE "AchAuthorizationLog" (
    "id" TEXT NOT NULL,
    "amount" INTEGER NOT NULL,
    "transactionDate" TIMESTAMP(3) NOT NULL,
    "accountMask" TEXT NOT NULL,
    "tribeId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "memberId" TEXT NOT NULL,
    "fundingRoundId" TEXT NOT NULL,
    "fundingRoundSubscriptionId" TEXT NOT NULL,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "streetAddress1" TEXT NOT NULL,
    "streetAddress2" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "photoId" TEXT NOT NULL,
    "personaResponseId" TEXT NOT NULL,
    "picture" TEXT NOT NULL,
    "gender" TEXT NOT NULL,
    "state" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "zipcode" TEXT NOT NULL,
    "paymentsCustomerId" TEXT NOT NULL,
    "dateOfBirth" TIMESTAMP(3) NOT NULL,
    "firstLogin" TIMESTAMP(3) NOT NULL,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Member" (
    "id" TEXT NOT NULL,
    "tribeId" TEXT NOT NULL,
    "inviteId" TEXT NOT NULL,
    "roles" TEXT[],
    "userId" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "totals" JSONB NOT NULL,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Tribe" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "votingThreshold" JSONB NOT NULL,
    "icon" TEXT NOT NULL,
    "mode" TEXT NOT NULL,
    "tribecaseResponseId" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "noOfMembers" INTEGER NOT NULL,
    "launched" TIMESTAMP(3) NOT NULL,
    "uniqueCode" TEXT NOT NULL,
    "memberId" TEXT NOT NULL,
    "updatedBy" TEXT NOT NULL,
    "paymentsCustomerId" TEXT NOT NULL,
    "businesses" TEXT[],
    "equityDistribution" JSONB NOT NULL,
    "totals" JSONB NOT NULL,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FundingRound" (
    "id" TEXT NOT NULL,
    "pauseMonths" INTEGER NOT NULL DEFAULT 0,
    "status" TEXT NOT NULL,
    "contributionAmount" INTEGER NOT NULL,
    "createdBy" TEXT NOT NULL,
    "deadline" TIMESTAMP(3) NOT NULL,
    "startDate" TIMESTAMP(3) NOT NULL,
    "contributionGoalAmount" INTEGER NOT NULL,
    "title" TEXT NOT NULL,
    "totalToDate" INTEGER NOT NULL DEFAULT 0,
    "type" TEXT NOT NULL,
    "tribeId" TEXT NOT NULL,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FundingRoundSubscription" (
    "id" TEXT NOT NULL,
    "requiredContributions" INTEGER NOT NULL DEFAULT 1,
    "recurrenceStructure" TEXT NOT NULL DEFAULT E'date',
    "status" TEXT NOT NULL,
    "contributionAmount" INTEGER NOT NULL,
    "lastContributionDate" TIMESTAMP(3) NOT NULL,
    "startDate" TIMESTAMP(3) NOT NULL,
    "totalSubscriptionValue" INTEGER NOT NULL DEFAULT 0,
    "nextContributionDate" TIMESTAMP(3) NOT NULL,
    "fundingRoundId" TEXT NOT NULL,
    "tribeId" TEXT NOT NULL,
    "memberId" TEXT NOT NULL,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MemberTransaction" (
    "id" TEXT NOT NULL,
    "purpose" TEXT NOT NULL,
    "creditOrDebit" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "fromAccount" INTEGER NOT NULL,
    "toAccount" TEXT NOT NULL,
    "reference" TEXT NOT NULL,
    "batchId" TEXT NOT NULL,
    "processedDate" TIMESTAMP(3) NOT NULL,
    "recipientName" TEXT NOT NULL,
    "amount" INTEGER NOT NULL,
    "description" TEXT NOT NULL,
    "memberId" TEXT NOT NULL,
    "tribeId" TEXT NOT NULL,
    "fundingRoundId" TEXT NOT NULL,
    "fundingRoundSubscriptionId" TEXT NOT NULL,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "UnitCounterpartie.unitCounterpartyId_unique" ON "UnitCounterpartie"("unitCounterpartyId");

-- AddForeignKey
ALTER TABLE "AchAuthorizationLog" ADD FOREIGN KEY ("tribeId") REFERENCES "Tribe"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AchAuthorizationLog" ADD FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AchAuthorizationLog" ADD FOREIGN KEY ("memberId") REFERENCES "Member"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AchAuthorizationLog" ADD FOREIGN KEY ("fundingRoundId") REFERENCES "FundingRound"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AchAuthorizationLog" ADD FOREIGN KEY ("fundingRoundSubscriptionId") REFERENCES "FundingRoundSubscription"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Member" ADD FOREIGN KEY ("tribeId") REFERENCES "Tribe"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Member" ADD FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tribe" ADD FOREIGN KEY ("memberId") REFERENCES "Member"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FundingRound" ADD FOREIGN KEY ("tribeId") REFERENCES "Tribe"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FundingRoundSubscription" ADD FOREIGN KEY ("fundingRoundId") REFERENCES "FundingRound"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FundingRoundSubscription" ADD FOREIGN KEY ("tribeId") REFERENCES "Tribe"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FundingRoundSubscription" ADD FOREIGN KEY ("memberId") REFERENCES "Member"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MemberTransaction" ADD FOREIGN KEY ("memberId") REFERENCES "Member"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MemberTransaction" ADD FOREIGN KEY ("tribeId") REFERENCES "Tribe"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MemberTransaction" ADD FOREIGN KEY ("fundingRoundId") REFERENCES "FundingRound"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MemberTransaction" ADD FOREIGN KEY ("fundingRoundSubscriptionId") REFERENCES "FundingRoundSubscription"("id") ON DELETE CASCADE ON UPDATE CASCADE;
