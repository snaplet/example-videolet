export const schema = gql`
  type Film {
    film_id: Int!
    title: String!
    description: String
  }

  type Query {
    films: [Film]
  }
`
