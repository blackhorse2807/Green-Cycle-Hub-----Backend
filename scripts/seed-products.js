"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
const prisma_1 = require("../generated/prisma");
const prisma = new prisma_1.PrismaClient();
function main() {
    return __awaiter(this, void 0, void 0, function* () {
        // First get a seller user ID
        const seller = yield prisma.user.findFirst({
            where: { role: 'SELLER' },
            include: { seller: true }
        });
        if (!seller || !seller.seller) {
            console.error('No seller found in the database. Please create a seller first.');
            return;
        }
        const products = [
            {
                name: 'High-Grade HDPE Pellets',
                price: 1200,
                currency: prisma_1.Currency.USD,
                quantity: 25,
                unit: prisma_1.Unit.MT,
                category: prisma_1.Category.HDPE,
                description: 'Virgin HDPE pellets suitable for injection molding',
                additionalNotes: 'Melt Flow Index: 0.35g/10min',
                isApproved: true,
                sellerUserId: seller.seller.userId
            },
            {
                name: 'Recycled PET Flakes',
                price: 800,
                currency: prisma_1.Currency.EUR,
                quantity: 15,
                unit: prisma_1.Unit.MT,
                category: prisma_1.Category.PET,
                description: 'Clean, clear PET flakes from post-consumer bottles',
                additionalNotes: 'Intrinsic Viscosity: 0.80 dl/g',
                isApproved: false,
                sellerUserId: seller.seller.userId
            },
            {
                name: 'PP Copolymer',
                price: 1500,
                currency: prisma_1.Currency.USD,
                quantity: 20,
                unit: prisma_1.Unit.MT,
                category: prisma_1.Category.PP,
                description: 'High impact resistant PP copolymer',
                additionalNotes: 'MFI (230°C/2.16kg): 12g/10min',
                isApproved: true,
                sellerUserId: seller.seller.userId
            },
            {
                name: 'ABS Resin',
                price: 2200,
                currency: prisma_1.Currency.EUR,
                quantity: 10,
                unit: prisma_1.Unit.MT,
                category: prisma_1.Category.ABS,
                description: 'Natural ABS resin for automotive applications',
                additionalNotes: 'Heat Resistance (Vicat): 105°C',
                isApproved: false,
                sellerUserId: seller.seller.userId
            },
            {
                name: 'LDPE Film Grade',
                price: 1100,
                currency: prisma_1.Currency.USD,
                quantity: 18,
                unit: prisma_1.Unit.MT,
                category: prisma_1.Category.LDPE,
                description: 'Blown film grade LDPE for packaging',
                additionalNotes: 'Density: 0.923 g/cm³',
                isApproved: true,
                sellerUserId: seller.seller.userId
            }
        ];
        for (const product of products) {
            try {
                yield prisma.product.create({
                    data: Object.assign(Object.assign({}, product), { images: {
                            create: [
                                {
                                    url: `https://placehold.co/600x400?text=${encodeURIComponent(product.name)}`
                                }
                            ]
                        } })
                });
                console.log(`Created product: ${product.name}`);
            }
            catch (error) {
                console.error(`Error creating product ${product.name}:`, error);
            }
        }
        console.log('Seeding completed!');
    });
}
main()
    .catch((e) => {
    console.error(e);
    process.exit(1);
})
    .finally(() => __awaiter(void 0, void 0, void 0, function* () {
    yield prisma.$disconnect();
}));
