require_relative "verse"

class Bottles
  def song
    verses(99,0)
  end

  def verses(starting_count, ending_count)
    starting_count.downto(ending_count).map do |n|
      verse(n)
    end.join("\n")
  end

  def verse(current_number_of_bottles)
    Verse.new(current_number_of_bottles).call
  end
end
