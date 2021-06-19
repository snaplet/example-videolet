export const schema = gql`
  type Film {
    film_id: Int!
    title: String!
    description: String
    release_year: Int!
    rental_rate: String!
  }

  type Query {
    films: [Film]
  }
`
