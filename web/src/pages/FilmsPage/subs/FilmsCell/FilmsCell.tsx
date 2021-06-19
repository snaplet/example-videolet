import type { Films } from 'types/graphql'

export const QUERY = gql`
  query Films {
    films {
      id: film_id
      title
      description
      year: release_year
      cost: rental_rate
    }
  }
`

export const Loading = () => {
  return 'Loading...'
}

export const Success = ({ films }: Films) => {
  return (
    <div>
      <h2>VideoLet Films</h2>
      <ol>
        {films.map((f) => {
          return (
            <li key={f.id}>
              <b>
                {f.title} - {f.year} - ${f.cost}
              </b>
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
