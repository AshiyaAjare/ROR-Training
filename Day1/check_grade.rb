def check_grade(grade)
  case grade
  when 1..5
    return "Elementary"
  when 6..9
    return "Middle School"
  when 9..12
    return "High School"
  else
    return "college"
  end
end

puts "Enter the grade: "
grade = gets.to_i
puts "The school Level according to the given grade will be #{check_grade(grade)}."
