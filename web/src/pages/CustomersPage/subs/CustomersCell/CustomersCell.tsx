import type { Customers } from 'types/graphql'

export const QUERY = gql`
  query Films {
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
              {c.lastName}, {c.firstName}
            </b>
            <br />
            {c.email}
            <br />
            <br />
          </li>
        )
      })}
    </ol>
  )
}
