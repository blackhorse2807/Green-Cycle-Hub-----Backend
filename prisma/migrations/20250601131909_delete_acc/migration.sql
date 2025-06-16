-- DropForeignKey
ALTER TABLE "Product" DROP CONSTRAINT "Product_sellerUserId_fkey";

-- AddForeignKey
ALTER TABLE "Product" ADD CONSTRAINT "Product_sellerUserId_fkey" FOREIGN KEY ("sellerUserId") REFERENCES "Seller"("userId") ON DELETE CASCADE ON UPDATE CASCADE;
