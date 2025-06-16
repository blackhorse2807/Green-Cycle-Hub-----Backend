/*
  Warnings:

  - You are about to drop the column `verificationDocUrl` on the `Seller` table. All the data in the column will be lost.
  - Added the required column `verification_doc_url` to the `Seller` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Seller" DROP COLUMN "verificationDocUrl",
ADD COLUMN     "verification_doc_url" TEXT NOT NULL;
