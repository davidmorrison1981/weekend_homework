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

  def self.delete_all()
    sql = "DELETE FROM teams"
    SqlRunner.run(sql)
  end

  def matches()
    sql = "SELECT * FROM matches WHERE team.id = #{@id};"
    match = SqlRunner.run( sql )
    result = match.map{ |match| Match.new(match)}
    return result 
  end

  def self.all()
    sql = "SELECT * FROM teams;"
    teams = SqlRunner.run( sql )
    result = teams.map{ |team| Team.new(team) }
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM teams WHERE id = #{id};"
    team = SqlRunner.run( sql ).first
    return Team.new(team)
  end
  
end