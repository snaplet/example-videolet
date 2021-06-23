/* eslint-disable no-console */
const { PrismaClient } = require('@prisma/client')
const dotenv = require('dotenv')

dotenv.config()
const db = new PrismaClient()

/*
 * Seed data is database data that needs to exist for your app to run.
 *
 * @see https://www.prisma.io/docs/reference/api-reference/command-reference#migrate-reset
 * @see https://www.prisma.io/docs/guides/prisma-guides/seed-database
 * @see https://www.prisma.io/docs/reference/api-reference/prisma-client-reference#upsert
 * @see https://www.prisma.io/docs/reference/api-reference/prisma-client-reference#createmany
 */
async function main() {
  // Customers
  const films = [
    { title: 'prisma', description: 'epic drama of prisma', release_year: '2007', language_id: 1, rental_duration: 3, rental_rate: 0.99, length: 90, rating: 'PG' },
  ]

  const customers = [
    { first_name: 'tony', last_name: 'stark', email: 'tony@example.com' },
    { first_name: 'mark', last_name: 'stark', email: 'mark@example.com' },
    { first_name: 'jackie', last_name: 'stark', email: 'jackie@example.com' },
    { first_name: 'bob', last_name: 'stark', email: 'bob@example.com' },
  ]

  console.log("Starting")

  console.log(db);
  console.log(db.customer);

  await customers.map(user => {
    const record = db.customer.create({
      data: user
    })
    console.log(record)
  })
}

main()
  .catch((e) => console.error(e))
  .finally(async () => {
    await db.$disconnect()
  })
