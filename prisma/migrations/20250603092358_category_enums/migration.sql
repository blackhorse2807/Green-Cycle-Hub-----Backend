/*
  Warnings:

  - The values [Plastic_Bottles,Plastic_Bags,Recycled_Pellets,Plastic_Sheets,Furniture_Decor] on the enum `Category` will be removed. If these variants are still used in the database, this will fail.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "Category_new" AS ENUM ('Unknown', 'HDPE', 'LDPE', 'PP', 'PET', 'PS', 'PVC', 'ABS', 'PA', 'Others');
ALTER TABLE "Product" ALTER COLUMN "category" DROP DEFAULT;
ALTER TABLE "Product" ALTER COLUMN "category" TYPE "Category_new" USING ("category"::text::"Category_new");
ALTER TYPE "Category" RENAME TO "Category_old";
ALTER TYPE "Category_new" RENAME TO "Category";
DROP TYPE "Category_old";
ALTER TABLE "Product" ALTER COLUMN "category" SET DEFAULT 'Unknown';
COMMIT;
