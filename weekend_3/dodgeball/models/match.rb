require ( 'pg' )
require_relative( '../db/sql_runner' )

class Match
   
  attr_reader(:id, :hometeam_id, :awayteam_id, :hometeam_score, :awayteam_score, :matches)

  def initialize( options )
    @id = options[ 'id' ].to_i
    @hometeam_id = options[ 'hometeam_id' ].to_i
    @awayteam_id = options[ 'awayteam_id' ].to_i
    @hometeam_score = options[ 'hometeam_score' ]
    @awayteam_score = options[ 'awayteam_score' ]
    @matches =options ['matches']
  end

  def save()
    sql = "INSERT INTO matches (hometeam_id, awayteam_id, hometeam_score, awayteam_score) VALUES ('#{@hometeam_id}', '#{@awayteam_id}', '#{@hometeam_score}', '#{@awayteam_score}') RETURNING *;"
    matches = SqlRunner.run( sql )
    match = matches.first
    @id = match[ 'id' ].to_i
  end

  def update()
    db = PG.connect( { dbname: 'dodgeball', host: 'localhost'} ) 

    sql = "UPDATE matches SET (
      hometeam_id = '#{@hometeam_id}',
      awayteam_id = '#{@awayteam_id}',
      hometeam_score = '#{@hometeam_score}', 
      awayteam_score = '#{@awayteam_score}'
      WHERE id = #{id};
      "
    db.exec( sql )
    db.close()
  end

  def delete()
    db = PG.connect( { dbname: 'dodgeball', host: 'localhost'} ) #PG.connect activates the gem to connect with pqsl

    sql = "DELETE FROM matches WHERE id = #{id};
      "
    db.exec( sql )
    db.close()
  end

  def team()
    sql = "SELECT * FROM teams WHERE id = #{@id};"
    team = SqlRunner.run( sql ).first
    team = Team.new(team)
    return team
  end

  def self.delete_all()
    sql = "DELETE FROM matches"
    SqlRunner.run(sql)
  end

end