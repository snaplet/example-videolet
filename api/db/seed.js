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
  let address = await db.address.findFirst({ where: { address_id: 1 } })
  if (!address) {
    // Create an address...
    address = await db.address.create({
      data: {
        address: 'Steak and chips 55',
        district: 'X',
        phone: '555-1234',
        city: {
          connectOrCreate: {
            where: {
              city_id: 1,
            },
            create: {
              city: 'Loncastershire',
              country: {
                connectOrCreate: {
                  where: {
                    country_id: 1,
                  },
                  create: {
                    country: 'England',
                  },
                },
              },
            },
          },
        },
      },
    })
  }

  let staff = await db.staff.findUnique({ where: { staff_id: 1 } })
  if (!staff) {
    staff = await db.staff.create({
      data: {
        first_name: 'Steve',
        last_name: 'Stevenson',
        username: 'steve.stevenson',
        password: 'hunter2',
        address: {
          connect: {
            address_id: address.address_id,
          },
        },
        store_id: 1,
      },
    })
  }

  let store = await db.store.findUnique({ where: { store_id: 1 } })
  if (!store) {
    store = await db.store.create({
      data: {
        address: {
          connect: {
            address_id: address.address_id,
          },
        },
        manager_staff_id: 1,
      },
    })
  }

  let x = "INSERT INTO \"language\" (\"name\") VALUES ('English');";
  await db.$executeRaw(x)
  x = "INSERT INTO film (\"film_id\", \"title\", \"description\", \"release_year\", \"language_id\", \"fulltext\") VALUES (1, 'A Prisma Story', 'the greatest story of Prisma ever told', '2021', 1, '') ON CONFLICT (film_id) DO NOTHING;";
  await db.$executeRaw(x)

  console.log('Starting...')

  const customers = [
    { firstName: 'mark', lastName: 'stark', email: 'mark@example.com' },
    { firstName: 'jackie', lastName: 'stark', email: 'jackie@example.com' },
    { firstName: 'bob', lastName: 'stark', email: 'bob@example.com' },
  ]
  const inserts = customers.map((user) => {
    return db.customer.create({
      data: {
        ...user,
        address: {
          connect: {
            address_id: address.address_id,
          },
        },
        store: {
          connect: {
            store_id: store.store_id,
          },
        },
        rental: {
          create: {
            rentalDate: new Date('2020-01-01'),
            returnDate: new Date('2021-01-01'),
            staff: {
              connect: {
                staff_id: staff.staff_id,
              },
            },
            inventory: {
              create: {
                film: {
                  connect: {
                    id: 1
                  },
                },
                store: {
                  connect: {
                    store_id: store.store_id,
                  },
                },
              }
            }
          }
        }
      },
    })
  })
  const y = await db.$transaction(inserts)

  console.log('... Done')
}

main()
  .catch((e) => console.error(e))
  .finally(async () => {
    await db.$disconnect()
  })
