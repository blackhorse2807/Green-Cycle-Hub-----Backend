-- CreateTable
CREATE TABLE "ChatLead" (
    "id" SERIAL NOT NULL,
    "phoneNumber" VARCHAR(10) NOT NULL,
    "companyName" TEXT,
    "userName" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ChatLead_pkey" PRIMARY KEY ("id")
);
