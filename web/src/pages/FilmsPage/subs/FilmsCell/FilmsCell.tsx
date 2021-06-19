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
      <h2>Videolet Film Catalog</h2>
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
