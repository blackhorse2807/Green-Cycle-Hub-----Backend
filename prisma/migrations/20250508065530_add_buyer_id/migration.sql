/*
  Warnings:

  - The primary key for the `Buyer` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `Buyer` table. All the data in the column will be lost.
  - The primary key for the `Seller` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `Seller` table. All the data in the column will be lost.
  - Added the required column `seller_id` to the `Seller` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Buyer" DROP CONSTRAINT "Buyer_pkey",
DROP COLUMN "id",
ADD COLUMN     "buyer_id" SERIAL NOT NULL,
ADD CONSTRAINT "Buyer_pkey" PRIMARY KEY ("buyer_id");

-- AlterTable
ALTER TABLE "Seller" DROP CONSTRAINT "Seller_pkey",
DROP COLUMN "id",
ADD COLUMN     "seller_id" TEXT NOT NULL,
ADD CONSTRAINT "Seller_pkey" PRIMARY KEY ("seller_id");
