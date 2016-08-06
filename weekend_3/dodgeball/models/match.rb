require ( 'pg' )
require_relative( '../db/sql_runner' )

class Match
   
  attr_reader(:id, :hometeam_id, :awayteam_id, :hometeam_score, :awayteam_score)

  def initialize( options )
    @id = options[ 'id' ].to_i
    @hometeam_id = options[ 'team1.id' ].to_i
    @awayteam_id = options[ 'team2.id' ].to_i
    @hometeam_score = options[ 'hometeam_score' ]
    @awayteam_score = options[ 'awayteam_score' ]
  end

  def save()
    sql = "INSERT INTO matches (hometeam_id, awayteam_id, hometeam_score, awayteam_score) VALUES ('#{@hometeam_id}', '#{@awayteam_id}', '#{@hometeam_score}', '#{@awayteam_score}') RETURNING *;"
    match = SqlRunner.run( sql ).first
    @id = match[ 'id' ].to_i
  end

  def team()
    sql = "SELECT * FROM teams WHERE id = #{@team.id};"
    team = SqlRunner.run( sql ).first
    team = Team.new(team)
    return result 
  end

  def self.delete_all()
    sql = "DELETE FROM matches"
    SqlRunner.run(sql)
  end

end