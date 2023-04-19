def acronymize(sentence)
  #split up the string
  words = sentence.split(" ")
  # 1. Option
  # first_letter = []
  letters = ""
  #loop over the words
  words.each do |word|
    # first_letter.push(word[0].upcase) # 1. option
    letters += word[0].upcase
  end
  #access the first letter of every word
  #empty array
  #join into string
  # first_letter.join # 1.option
  letters
end









puts acronymize("laughing out loud") ==  "LOL"
puts acronymize("REad the Fucking MAnual") ==  "RTFM"
puts acronymize("JUST FUckING DO IT") ==  "JFDI"
