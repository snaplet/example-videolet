export const schema = gql`
  type Customer {
    id: Int!
    firstName: String!
    lastName: String!
    email: String!
    active: Boolean!
    lastUpdate: DateTime
  }

  type Query {
    customers: [Customer]
  }
`
