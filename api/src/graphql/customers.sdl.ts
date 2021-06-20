export const schema = gql`
  type Rental {
    id: Int!
    film: Film!
    rentalDate: DateTime!
    returnDate: DateTime
  }

  type Customer {
    id: Int!
    firstName: String!
    lastName: String!
    email: String!
    active: Boolean!
    lastUpdate: DateTime
    rentals: [Rental]
  }

  type Query {
    customer(id: Int): Customer
    customers: [Customer]
  }
`
