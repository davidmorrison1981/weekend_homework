require_relative( 'models/match' )
require_relative( 'models/team' )

require( 'pry-byebug' )

Match.delete_all()
Team.delete_all()

team1 = Team.new({ 'name' => 'Purple Cobras' })
team2 = Team.new({ 'name' => 'Betty Grumbles' })

team1.save()
team2.save() 

match1 = Match.new({
  'hometeam_id' =>team1.id, 
  'awayteam_id'=>team2.id, 
  'hometeam_score' =>2, 
  'awayteam_score'=> 1
  })

match2 = Match.new({  
  'hometeam_id' =>team2.id, 
  'awayteam_id'=>team1.id,
  'hometeam_score' =>1, 
  'awayteam_score'=>2 })

match1.save()
match2.save()

binding.pry
nil