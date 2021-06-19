import type { Film } from 'types/graphql'

export const QUERY = gql`
  query Films {
    films {
      id
      title
      description
    }
  }
`

export const Loading = () => {
  return 'Loading...'
}

export const Success = ({ films }: { films: Film[] }) => {
  return (
    <div>
      <h2>VideoLet Films</h2>
      <p>All the films below are available at VideoLet's outlets nationwide</p>
      <ol>
        {films.map((f) => {
          return (
            <li key={f.id}>
              <b>{f.title}</b>
              <br />
              {f.description}
              <br />
              <br />
            </li>
          )
        })}
      </ol>
    </div>
  )
}
