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
    {
      title: 'prisma',
      description: 'epic drama of prisma',
      release_year: '2007',
      language_id: 1,
      rental_duration: 3,
      rental_rate: 0.99,
      length: 90,
      rating: 'PG',
    },
  ]

  const customers = [
    { firstName: 'tony', lastName: 'stark', email: 'tony@example.com' },
    { firstName: 'mark', lastName: 'stark', email: 'mark@example.com' },
    { firstName: 'jackie', lastName: 'stark', email: 'jackie@example.com' },
    { firstName: 'bob', lastName: 'stark', email: 'bob@example.com' },
  ]

  console.log('Starting')

  //console.log(db)
  //console.log(db.customer)

  //)

  // const x = await db.film.create({
  //   data: films[0],
  // })
  // console.log(x)

  const inserts = customers.map((user) => {
    return db.customer.create({
      data: user,
    })
  })
  const y = await db.$transaction(inserts)

  console.log(y)
}

main()
  .catch((e) => console.error(e))
  .finally(async () => {
    await db.$disconnect()
  })
