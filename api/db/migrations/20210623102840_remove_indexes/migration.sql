-- DropForeignKey
ALTER TABLE "staff" DROP CONSTRAINT "staff_store_id_fkey";

-- DropForeignKey
ALTER TABLE "store" DROP CONSTRAINT "store_manager_staff_id_fkey";

-- DropIndex
DROP INDEX "idx_fk_address_id";

-- DropIndex
DROP INDEX "idx_fk_store_id";

-- DropIndex
DROP INDEX "idx_last_name";

-- DropIndex
DROP INDEX "film_fulltext_idx";

-- DropIndex
DROP INDEX "idx_fk_language_id";

-- DropIndex
DROP INDEX "idx_fk_original_language_id";

-- DropIndex
DROP INDEX "idx_title";

-- DropIndex
DROP INDEX "idx_fk_customer_id";

-- DropIndex
DROP INDEX "idx_fk_staff_id";

-- AlterTable
ALTER TABLE "staff" ADD COLUMN     "storeStore_id" INTEGER,
ADD COLUMN     "store_staffTostore_manager_staff_id" INTEGER,
ADD COLUMN     "store_staff_store_idTostore" INTEGER;

-- AlterTable
ALTER TABLE "store" ADD COLUMN     "staff_staffTostore_manager_staff_id" INTEGER,
ADD COLUMN     "staff_staff_store_idTostore" INTEGER[];

-- AddForeignKey
ALTER TABLE "staff" ADD FOREIGN KEY ("storeStore_id") REFERENCES "store"("store_id") ON DELETE SET NULL ON UPDATE CASCADE;
