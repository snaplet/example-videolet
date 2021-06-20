import { db } from 'src/lib/db'

export const customers = () => {
  return db.customer.findMany({
    orderBy: {
      lastName: 'asc',
    },
  })
}

export const customer = ({ id }) => {
  return db.customer.findUnique({ where: { id } })
}

export const Customer = {
  rentals: async (_, { root }) => {
    const rentals = await db.rental.findMany({
      where: {
        customer_id: root.id,
      },
      include: {
        inventory: {
          include: {
            film: true,
          },
        },
      },
      orderBy: {
        rentalDate: 'desc',
      },
    })

    return rentals.map((rental) => {
      rental.film = rental.inventory.film
      return rental
    })
  },
}
