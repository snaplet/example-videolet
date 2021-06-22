import { Link, routes } from '@redwoodjs/router'
import type { Customers } from 'types/graphql'

export const QUERY = gql`
  query Customers {
    customers {
      id
      firstName
      lastName
      email
    }
  }
`

export const Loading = () => {
  return 'Loading...'
}

export const Success = ({ customers }: Customers) => {
  return (
    <ol>
      {customers.map((c) => {
        return (
          <li key={c.id}>
            <b>
              <Link to={routes.customer({ id: c.id })}>
                {c.lastName}, {c.firstName}
              </Link>
            </b>
            <br />
            <>{c.email}</>
            <br />
            <br />
          </li>
        )
      })}
    </ol>
  )
}
