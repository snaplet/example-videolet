import { db } from 'src/lib/db'

export const customers = () => {
  return db.customer.findMany({
    orderBy: {
      lastName: 'asc',
    },
  })
}
