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

      <h3>Rentals:</h3>
      <ul>
        {customer.rentals.map((r) => {
          const d1 = new Date(r.rentalDate)
          const d2 = new Date(r.returnDate) // when `returnDate` is null it defaults to "epoch" time.

          let isReturned = false
          if (typeof r.returnDate === 'string') {
            isReturned = true
          }

          const dayInHours = 86_400_000
          const totalDays = Math.round(Math.abs((d2 - d1) / dayInHours))

          const rentalStart = f.format(d1)
          // Format return date. If return date is the same as epoch time then it is not returned.
          const rentalEnd =
            d2.getTime() === new Date(0).getTime()
              ? f.format(new Date()) + ' (not returned)'
              : f.format(d2)

          return (
            <li key={r.id}>
              <b>Status:</b>{' '}
              <pre style={{ display: 'inline' }}>
                {!isReturned ? (
                  <span style={{ color: 'red' }}>Not returned</span>
                ) : (
                  <span style={{ color: 'green' }}>Returned</span>
                )}
              </pre>
              <br />
              <b>Rental period:</b>{' '}
              <pre style={{ display: 'inline' }}>{totalDays} days</pre>
              <br />
              <b>Amount:</b>{' '}
              <pre style={{ display: 'inline' }}>
                <span style={{ color: isReturned ? '' : 'red' }}>
                  ${(r.film.cost * totalDays).toFixed(2)}
                </span>
              </pre>
              <br />
              <b>Period:</b>{' '}
              <pre style={{ display: 'inline' }}>
                {rentalStart} - {rentalEnd}
              </pre>
              <br />
              {r.film.title}
              <br />
              <br />
            </li>
          )
        })}
      </ul>
    </div>
  )
}
