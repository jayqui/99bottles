class Verse
  attr_reader :current_number_of_bottles, :highest_count_possible

  def initialize(current_number_of_bottles, highest_count_possible = 99)
    @current_number_of_bottles = current_number_of_bottles
    @highest_count_possible = highest_count_possible
  end

  def call
<<-VERSE
#{current_number_of_bottles_word.capitalize} #{bottle_word_for(current_number_of_bottles)} of beer on the wall, \
#{current_number_of_bottles_word} #{bottle_word_for(current_number_of_bottles)} of beer.
#{action_phrase}, \
#{new_num_bottles_word} #{bottle_word_for(current_number_of_bottles - 1)} of beer on the wall.
VERSE
  end

  private

  def new_num_bottles_word
    if current_number_of_bottles == 0
      highest_count_possible.to_s
    elsif current_number_of_bottles == 1
      "no more"
    else
      (current_number_of_bottles - 1).to_s
    end
  end

  def current_number_of_bottles_word
    current_number_of_bottles == 0 ? "no more" : current_number_of_bottles.to_s
  end

  def bottle_word_for(number)
    number == 1 ? "bottle" : "bottles"
  end

  def action_phrase
    if current_number_of_bottles == 0
      "Go to the store and buy some more"
    else
      "Take #{one_or_it} down and pass it around"
    end
  end

  def one_or_it
    current_number_of_bottles == 1 ? "it" : "one"
  end
end
