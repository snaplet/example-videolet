export const schema = gql`
  type Film {
    id: Int!
    title: String!
    description: String
  }

  type Query {
    films: [Film]
  }
`
