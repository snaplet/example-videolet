import { Link, routes } from '@redwoodjs/router'
import type { Customer } from 'types/graphql'

export const QUERY = gql`
  query Customer($id: Int) {
    customer(id: $id) {
      id
      firstName
      lastName
      email
      rentals {
        id
        rentalDate
        returnDate
        film {
          id
          title
          cost
        }
      }
    }
  }
`

export const Loading = () => {
  return 'Loading...'
}

export const Success = ({ customer }: Customer) => {
  const f = new Intl.DateTimeFormat('en-GB', {
    dateStyle: 'medium',
    timeStyle: 'short',
  })

  return (
    <div>
      <h2>
        <Link to={routes.customers()}>Customers</Link> &gt; {customer.lastName},{' '}
        {customer.firstName}
      </h2>

      {customer.email}

      <h3>Rentals</h3>
      <ul>
        {customer.rentals.map((r) => {
          return (
            <li key={r.id}>
              {r.film.title}
              <br />
              <pre>
                {f.format(new Date(r.rentalDate))} -{' '}
                {f.format(new Date(r.returnDate))}
              </pre>

              <br />
            </li>
          )
        })}
      </ul>
    </div>
  )
}
