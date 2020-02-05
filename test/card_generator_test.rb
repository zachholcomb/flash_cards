require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator.rb'
require './lib/card'
require './lib/deck'

class CardGeneratorTest < Minitest::Test
  def setup
    filename = './lib/cards.txt'
    @cards = CardGenerator.new(filename)
  end

  def test_it_exists
    assert_instance_of CardGenerator, @cards
  end

  def test_it_generates_cards
    deck = Deck.new(@cards.cards)
    assert_equal deck.cards, @cards.cards
  end

  def test_it_can_separate_cards_into_categories
    assert_equal ["Geography", "Pop Culture"], @cards.collect_card_categories
  end
end
