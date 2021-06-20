import type { Films } from 'types/graphql'

export const QUERY = gql`
  query Films {
    films {
      id
      title
      description
      year
      cost
    }
  }
`

export const Loading = () => {
  return 'Loading...'
}

export const Success = ({ films }: Films) => {
  return (
    <ol>
      {films.map((f) => {
        return (
          <li key={f.id}>
            <b>{f.title}</b> - ({f.year}) - <b>${f.cost}</b>
            <br />
            {f.description}
            <br />
            <br />
          </li>
        )
      })}
    </ol>
  )
}
