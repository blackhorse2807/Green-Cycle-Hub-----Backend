/*
  Warnings:

  - The primary key for the `Seller` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `seller_id` column on the `Seller` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- AlterTable
ALTER TABLE "Seller" DROP CONSTRAINT "Seller_pkey",
DROP COLUMN "seller_id",
ADD COLUMN     "seller_id" SERIAL NOT NULL,
ADD CONSTRAINT "Seller_pkey" PRIMARY KEY ("seller_id");
