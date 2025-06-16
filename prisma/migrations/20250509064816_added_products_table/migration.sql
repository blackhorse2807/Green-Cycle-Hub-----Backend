-- CreateTable
CREATE TABLE "Products" (
    "product_id" SERIAL NOT NULL,
    "seller_id" INTEGER NOT NULL,
    "seller_fullname" TEXT NOT NULL,
    "product_name" TEXT NOT NULL,
    "product_price" INTEGER NOT NULL,
    "product_currency" TEXT NOT NULL,
    "product_qty" INTEGER NOT NULL,
    "product_category" TEXT NOT NULL,
    "product_desc" TEXT NOT NULL,
    "product_additional_notes" TEXT NOT NULL,
    "product_images" TEXT NOT NULL,

    CONSTRAINT "Products_pkey" PRIMARY KEY ("product_id")
);
