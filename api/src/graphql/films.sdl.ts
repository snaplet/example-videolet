export const schema = gql`
  type Film {
    id: Int!
    title: String!
    description: String
    year: Int!
    cost: String!
  }

  type Query {
    films: [Film]
  }
`
