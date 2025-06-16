-- AlterTable
ALTER TABLE "Product" ADD COLUMN     "application" TEXT NOT NULL DEFAULT 'Unknown',
ADD COLUMN     "batchSize" DECIMAL(65,30) NOT NULL DEFAULT 0.0,
ADD COLUMN     "color" TEXT NOT NULL DEFAULT 'Unknown',
ADD COLUMN     "country" TEXT NOT NULL DEFAULT 'Unknown',
ADD COLUMN     "deleted_at" TIMESTAMP(3),
ADD COLUMN     "minimumOrderQuantity" DECIMAL(65,30) NOT NULL DEFAULT 0.0,
ADD COLUMN     "sourceMaterial" TEXT NOT NULL DEFAULT 'Unknown',
ALTER COLUMN "quantity" SET DEFAULT 0.0,
ALTER COLUMN "quantity" SET DATA TYPE DECIMAL(65,30),
ALTER COLUMN "description" SET DEFAULT 'Unknown';
