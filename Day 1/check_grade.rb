def check_grade(grade)
  if grade >=1 && grade<=5
    return "Elementary"
  elsif grade>=6 && grade<=8
    return "Middle School"
  elsif grade>=9 && grade<=12
    return "High School"
  else
    return "College"
  end
end

puts "Enter the grade: "
grade = gets.to_i
puts "The school Level according to the given grade will be #{check_grade(grade)}."
