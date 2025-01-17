module CountryInfo
  COUNTRIES = {
    'India' => {
      population: 120,
      gdp: 3000,
      states: 28,
      army_power: 1500,
      state_of_country: 'Developing'
    },
    'Bangladesh' => {
      population: 200,
      gdp: 700,
      states: 32,
      army_power: 600,
      state_of_country: 'Developing'
    },
    'China' => {
      population: 800,
      gdp: 3500,
      states: 38,
      army_power: 2500,
      state_of_country: 'Developed'
    },
    'Italy' => {
      population: 600,
      gdp: 2000,
      states: 36,
      army_power: 1500,
      state_of_country: 'Developed'
    },
    'France' => {
      population: 520,
      gdp: 2500,
      states: 28,
      army_power: 500,
      state_of_country: 'Developing'
    },
    'Russia' => {
      population: 600,
      gdp: 4000,
      states: 32,
      army_power: 2500,
      state_of_country: 'Developed'
    },
    'Japan' => {
      population: 800,
      gdp: 4500,
      states: 24,
      army_power: 2200,
      state_of_country: 'Developed'
    }

  }

  def self.country_info(country_name)
    COUNTRIES[country_name]
  end

  def self.add_country(name, population, gdp, states, army_power, state_of_country)
    COUNTRIES[name] = {
      population: population,
      gdp: gdp,
      states: states,
      army_power: army_power,
      state_of_country: state_of_country
    }
  end
end

module WarWinning
  def security_test?(enemy_strength)
    army_power > enemy_strength
  end
end

module LoanEligibility
  def eligible_for_loan_from_WB?
    gdp <= 100
  end
end

module UN_member
  def eligible_for_un?
    population > 100 && gdp >= 100
  end
end

class Country
  include WarWinning
  include CountryInfo
  include LoanEligibility
  include UN_member

  attr_accessor :name, :population, :gdp, :states, :army_power, :state_of_country

  def initialize(name, population, gdp, states, army_power, state_of_country)
    @name = name
    @population = population
    @gdp = gdp
    @states = states
    @army_power = army_power
    @state_of_country = state_of_country
  end

  def display_info
    puts "Country: #{name}"
    puts "Population: #{population} million"
    puts "GDP: $#{gdp} billion"
    puts "States: #{states}"
    puts "Army Power: #{army_power} thousand troops"
    puts "Country State: #{state_of_country}"
  end
end

def main_menu
  loop do
    puts "\n------ COUNTRIES DATA ------\n"
    puts '1. Add a country'
    puts "2. View country's data"
    puts '3. Will the country win wars?'
    puts '4. Check for Loans'
    puts '5. Check for UN Memeber'
    puts "0. EXIT\n"

    print 'Enter the option: '
    choice = gets.chomp.to_i

    break if choice.zero?

    case choice
    when 1
      print 'Enter Country Name: '
      name = gets.chomp

      print 'Enter Population (in millions): '
      population = gets.chomp.to_i

      print 'Enter GDP (in billion dollars): '
      gdp = gets.chomp.to_i

      print 'Enter Number of States: '
      states = gets.chomp.to_i

      print 'Enter Army Strength (in thousand troops): '
      army_power = gets.chomp.to_i

      print 'Enter State of Country (developing/developed): '
      state_of_country = gets.chomp

      CountryInfo.add_country(name, population, gdp, states, army_power, state_of_country)

      puts 'Country added to the database successfully!'

    when 2
      print 'Enter the Country Name to view: '
      country_name = gets.chomp

      data = CountryInfo.country_info(country_name)
      if data
        country = Country.new(country_name, data[:population], data[:gdp], data[:states], data[:army_power],
                              data[:state_of_country])
        country.display_info
      else
        puts 'Country not found in the database.'
      end

    when 3
      print 'Enter Country Name: '
      country_name = gets.chomp

      data = CountryInfo.country_info(country_name)
      if data
        country = Country.new(country_name, data[:population], data[:gdp], data[:states],
                              data[:army_power], data[:state_of_country])

        print "Enter Enemy's Army Strength (in thousand troops): "
        enemy_strength = gets.chomp.to_i

        if country.security_test?(enemy_strength)
          puts "#{country_name} is likely to win the war!"
        else
          puts "#{country_name} might lose the war. Consider strengthening your army."
        end
      else
        puts 'Your country is not in the database.'
      end

    when 4
      print 'Enter the Country Name: '
      country_name = gets.chomp

      data = CountryInfo.country_info(country_name)
      if data
        country = Country.new(country_name, data[:population], data[:gdp], data[:states], data[:army_power],
                              data[:state_of_country])

        if country.eligible_for_loan_from_WB?
          puts "#{country_name} is eligible for a loan from the World Bank."
        else
          puts "#{country_name} is NOT eligible for a loan from the World Bank."
        end
      else
        puts 'Country not found in the database.'
      end

    when 5
      print 'Enter the Country Name to check UN membership eligibility: '
      country_name = gets.chomp

      data = CountryInfo.country_info(country_name)
      if data
        country = Country.new(country_name, data[:population], data[:gdp], data[:states], data[:army_power],
                              data[:state_of_country])

        if country.eligible_for_un?
          puts "#{country_name} is eligible for UN"
        else
          puts "#{country_name} is not eligible for UN"
        end
      else
        puts 'Country not found in the database.'
      end

    else
      puts 'Invalid option. Please try again.'
    end
  end
  puts 'EXIT'
end

main_menu
