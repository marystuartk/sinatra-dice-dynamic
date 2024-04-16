require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:homepage)
end


get("/dynamic/:number_of_dice/:how_many_sides") do
  @num_dice = params.fetch("number_of_dice").to_i

  @sides = params.fetch("how_many_sides").to_i

  @rolls = []

  @num_dice.times do
    die = rand(1..@sides)

    @rolls.push(die)
  end

  erb(:flexible)
end

get("/dice/2/6") do
  @rolls = [rand(1..6), rand(1..6)]
	
  erb(:two_six)
end

get("/dice/2/10") do
  @rolls = [rand(1..10), rand(1..10)]
	
  erb(:two_ten)
end

get("/dice/1/20") do
  @rolls = [rand(1..20), rand(1..20)]

	erb(:one_twenty)
end

get("/dice/5/4") do
  first_die = rand(1..4)
	second_die = rand(1..4)
  third_die = rand(1..4)
  fourth_die = rand(1..4)
  fifth_die = rand(1..4)
  sum = first_die + second_die + third_die + fourth_die + fifth_die
	
	@outcome = "You rolled a #{first_die}, #{second_die}, #{third_die}, #{fourth_die}, and #{fifth_die} for a total of #{sum}."
	
  erb(:five_four)
end

get("/dice/:number_of_dice/:number_of_sides") do
  @num_dice = params.fetch("number_of_dice").to_i
  @num_sides = params.fetch("number_of_sides").to_i

  @rolls = Array.new(@num_dice) { rand(1..@num_sides) }

  erb(:dynamic_dice_roll)
end
