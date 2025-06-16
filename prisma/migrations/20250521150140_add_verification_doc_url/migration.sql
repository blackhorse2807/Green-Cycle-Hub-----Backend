/*
  Warnings:

  - You are about to drop the column `verification_doc_url` on the `Seller` table. All the data in the column will be lost.
  - Added the required column `verificationDocUrl` to the `Seller` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Seller" DROP COLUMN "verification_doc_url",
ADD COLUMN     "verificationDocUrl" TEXT NOT NULL;
