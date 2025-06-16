/*
  Warnings:

  - You are about to drop the column `seller_fullname` on the `Products` table. All the data in the column will be lost.
  - The `product_category` column on the `Products` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- CreateEnum
CREATE TYPE "Category" AS ENUM ('Unknown', 'Plastic_Bottles', 'Plastic_Bags', 'Recycled_Pellets', 'Plastic_Sheets', 'Furniture_Decor', 'Others');

-- AlterTable
ALTER TABLE "Products" DROP COLUMN "seller_fullname",
DROP COLUMN "product_category",
ADD COLUMN     "product_category" "Category" NOT NULL DEFAULT 'Unknown',
ALTER COLUMN "product_additional_notes" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "Products" ADD CONSTRAINT "Products_seller_id_fkey" FOREIGN KEY ("seller_id") REFERENCES "Seller"("seller_id") ON DELETE RESTRICT ON UPDATE CASCADE;
