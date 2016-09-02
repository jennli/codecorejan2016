class TeamRandomizer
 attr_writer :number_of_teams
 attr_writer :players_per_team

 def initialize(number_of_teams)
   @names = ["John", "Tom","Julie","Moron","Idiot","Thai"]
   @number_of_teams = number_of_teams
   @players_per_team = (@names.count/number_of_teams.to_f).ceil
   @teams= []
 end

 def randomize
   (1..@number_of_teams).each do |num|
     p @teams[num - 1] = @names.sample(@players_per_team)
     p @names = @names - @teams[num - 1]
     #  @teams
   end
     p @teams
 end

end

team = TeamRandomizer.new(3)
p a = team.randomize()
