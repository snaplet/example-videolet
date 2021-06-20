export const schema = gql`
  type Customer {
    customer_id: Int!
    first_name: String!
    last_name: String!
    email: String!
    active: Boolean!
    last_update: DateTime
  }

  type Query {
    customers: [Customer]
  }
`
