/*
  Warnings:

  - You are about to drop the column `seller_id` on the `Products` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Products" DROP CONSTRAINT "Products_seller_id_fkey";

-- AlterTable
ALTER TABLE "Products" DROP COLUMN "seller_id";
