def print_reverse
  alphabets = ('a'..'z').to_a
  rev_alphabets = alphabets.reverse
  rev_alphabets.each do |char|
    print char
  end
end

print_reverse
