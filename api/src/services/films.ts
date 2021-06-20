import { db } from 'src/lib/db'

export const films = () => {
  return db.film.findMany({
    orderBy: {
      year: 'asc',
    },
  })
}
