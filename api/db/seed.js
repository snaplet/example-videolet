/* eslint-disable no-console */
const { PrismaClient } = require('@prisma/client')
const dotenv = require('dotenv')

dotenv.config()
const db = new PrismaClient()

async function main() {
  await db.country.create({
    data: {
      country: 'South Africa',
    },
  })
  await db.country.create({
    data: {
      country: 'Germany',
    },
  })
}

main()
  .catch((e) => console.error(e))
  .finally(async () => {
    await db.$disconnect()
  })
