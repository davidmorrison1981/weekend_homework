require ( 'pg' ) 
require_relative( '../db/sql_runner' )

class Team

  attr_reader( :id, :name )

  def initialize(options)
    @id = options[ 'id' ].to_i
    @name = options[ 'name' ]
  end

  def save()
    sql = "INSERT INTO teams ( name ) VALUES ( '#{ @name }' ) RETURNING *;"
    team = SqlRunner.run( sql ).first
    @id = team[ 'id' ].to_i
  end

  # def albums()
  #   sql = "SELECT * FROM albums WHERE artist_id = #{@id};"
  #   album = SqlRunner.run( sql )
  #   result = album.map{ |album| Album.new(album)}
  #   return result 
  # end

  # def self.all()
  #   sql = "SELECT * FROM artists;"
  #   artists = SqlRunner.run( sql )
  #   result = artists.map{ |artist| Artist.new(artist) }
  #   return result
  # end

  # def self.find(id)
  #   sql = "SELECT * FROM artists WHERE id = #{id};"
  #   artist = SqlRunner.run( sql ).first
  #   return Artist.new(artist)
  # end
  

end