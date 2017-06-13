# == Schema Information
#
# Table name: actors
#
#  id          :integer      not null, primary key
#  name        :string
#
# Table name: movies
#
#  id          :integer      not null, primary key
#  title       :string
#  yr          :integer
#  score       :float
#  votes       :integer
#  director_id :integer
#
# Table name: castings
#
#  movie_id    :integer      not null, primary key
#  actor_id    :integer      not null, primary key
#  ord         :integer

require_relative './sqlzoo.rb'

def example_join
  execute(<<-SQL)
    SELECT
      *
    FROM
      movies
    JOIN
      castings ON movies.id = castings.movie_id
    JOIN
      actors ON castings.actor_id = actors.id
    WHERE
      actors.name = 'Sean Connery'
  SQL
end

def films_and_stars_from_sixty_two
  # List the title and leading star of every 1962 film.
  execute(<<-SQL)
  SQL
end

def travoltas_busiest_years
  # Which were the busiest years for 'John Travolta'? Show the year and the
  # number of movies he made for any year in which he made at least 2 movies.
  execute(<<-SQL)
    SELECT m.yr, count(1)
    FROM movies m
    JOIN castings c ON m.id = c.movie_id
    JOIN actors a ON c.actor_id = a.id
    WHERE a.name = 'John Travolta'
    GROUP BY m.yr
    HAVING count(1) >= 2;
  SQL
end

def andrews_films_and_leads
  # List the film title and the leading actor for all of the films 'Julie
  # Andrews' played in.
  execute(<<-SQL)
    SELECT DISTINCT m.title, a.name
    FROM movies m
    JOIN castings c ON m.id = c.movie_id
    JOIN actors a ON c.actor_id = a.id
    WHERE m.id IN (
      SELECT m.id FROM movies m
      JOIN castings c ON m.id = c.movie_id
      JOIN actors a ON c.actor_id = a.id
      WHERE a.name = 'Julie Andrews'
    )
    AND c.ord = 1
    ORDER BY m.title;
  SQL
end

def films_by_cast_size
  # List the films released in the year 1978 ordered by the number of actors
  # in the cast (descending), then by title (ascending).
  execute(<<-SQL)
    SELECT m.title, count(DISTINCT c.actor_id)
    FROM movies m
    JOIN castings c
    ON m.id = c.movie_id
    WHERE m.yr = 1978
    GROUP BY m.title
    ORDER BY count(c.actor_id) DESC, m.title ASC;
  SQL
end

def colleagues_of_garfunkel
  # List all the people who have played alongside 'Art Garfunkel'.
  execute(<<-SQL)
    SELECT a.name
    FROM actors a
    JOIN castings c
    ON a.id = c.actor_id
    WHERE c.movie_id IN (
      SELECT c.movie_id
      FROM castings c
      JOIN actors a
      ON c.actor_id = a.id
      WHERE a.name = 'Art Garfunkel'
    )
    AND a.name != 'Art Garfunkel';
  SQL
end
