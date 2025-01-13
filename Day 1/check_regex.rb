
def check_regex(input_var, type)
  case type
  when :mobile
    regex = /^\d{10}$|^\d{3}-\d{3}-\d{4}$/
  when :email
    regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/
  when :name
    regex = /^[A-Za-z\s]+$/
  when :gender
    regex = /^[MF]$/
  when :amount
    regex = /^\d+(\.\d{1,2})?$/
  else
    return false
  end
  input_var.match?(regex)
end

# Get user input
puts "Enter mobile number:"
mobile = gets.chomp
puts "Enter email address:"
email = gets.chomp
puts "Enter your name:"
name = gets.chomp
puts "Enter gender:"
gender = gets.chomp
puts "Enter amount:"
amount = gets.chomp

# Validate inputs
puts "Mobile: #{check_regex(mobile, :mobile)}"
puts "Email: #{check_regex(email, :email)}"
puts "Name: #{check_regex(name, :name)}"
puts "Gender: #{check_regex(gender, :gender)}"
puts "Amount: #{check_regex(amount, :amount)}"
