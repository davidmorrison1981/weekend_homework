require ( 'pg' )
require_relative( '../db/sql_runner' )

class Match
   
  attr_reader( :id, :team_id, :match_id, :name )

  def initialize( options )
    @id = options[ 'id' ].to_i
    @team_id = options[ 'team_id' ].to_i
    @match_id = options[ 'match_id' ].to_i
    @name = options[ 'name' ]
  end

  def save()
    sql = "INSERT INTO matches ( name, team_id, match_id ) VALUES ( '#{ @name }', '#{@team_id}', '#{match_id}' ) RETURNING *;"
    match = SqlRunner.run( sql ).first
    @id = match[ 'id' ].to_i
  end

  def team()
    sql = "SELECT * FROM teams WHERE id = #{@team_id};"
    team = SqlRunner.run( sql ).first
    team = Team.new(team)
    return result 
  end

end