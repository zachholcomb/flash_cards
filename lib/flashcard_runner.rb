require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'


filename = './lib/cards.txt'
card_generator = CardGenerator.new(filename)
new_deck = Deck.new(card_generator.cards)
card_total = new_deck.count
new_round = Round.new(new_deck)
card_categories = card_generator.collect_card_categories

puts "-------------------------------------------------"
puts "Welcome! You're playing with #{card_total} cards."
puts "-------------------------------------------------"

loop do
  if new_round.turns.length == 0
    puts "This card is number 1 out of #{card_total}."
    new_round.start
    puts new_round.current_card.question
    print "> "
    user_guess_input = gets.chomp
    new_turn = Turn.new(user_guess_input, new_round.current_card)
    new_round.take_turn(new_turn.guess)
    puts new_turn.feedback
    new_round.current_card
  else
    puts "This card is number #{new_round.turns.length + 1} out of #{card_total}."
    puts new_round.current_card.question
    print "> "
    user_guess_input = gets.chomp
    new_turn = Turn.new(user_guess_input, new_round.current_card)
    new_round.take_turn(new_turn.guess)
    puts new_turn.feedback
    new_round.current_card

    if new_round.turns.length == 4
      break
    end
  end
end
puts  "****** Game over! *******"
puts "You had #{new_round.number_correct} out of #{card_total} for a total score of #{new_round.percent_correct} %."
#{new_round.percent_correct_by_category("Geography")} % correct.
card_categories.each do |category|
  puts "#{category} - #{new_round.percent_correct_by_category(category)} % correct."
end
