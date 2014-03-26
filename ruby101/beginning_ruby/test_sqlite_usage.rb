require 'rubygems'
require 'sqlite3'
require 'minitest/autorun'

class TestSQLiteFunction < Minitest::Unit::TestCase
  def setup
    $db = SQLite3::Database.new("files/dbfile")
    $db.results_as_hash = true
    @db_instance = MyDatabaseTestObject.new
  end
  def test_table_crud
    loop do
      puts %q{ 
        Please select and option:

        1. Create a people table
        2. Add a person
        3. Look for a person
        4. List all people in table
        5. Quit

      }

      case gets.chomp
      when '1'
        @db_instance.create_table
      when '2'
        @db_instance.add_person
      when '3'
        @db_instance.find_person
      when '4'
        @db_instance.list_all_people
      when '5'
        @db_instance.disconnect_and_quit
      end
    end
  end
end


class MyDatabaseTestObject

  def create_table
    puts "Creating people table"
    $db.execute %q{
      CREATE TABLE people (
        id integer primary key,
        name varchar(50),
        job varchar(50),
        gender varchar(6),
        age integer)
    }
  end

  def add_person
    puts "Enter name:"
    name = gets.chomp
    puts "Enter job:"
    job = gets.chomp
    puts "Enter gender:"
    gender = gets.chomp
    puts "Enter age:"
    age = gets.chomp
    $db.execute("INSERT INTO people (name, job, gender, age) VALUES (?,?,?,?)", name, job, gender, age)
  end
  def find_person
    puts "Enter name or ID of person to find:"
    id = gets.chomp
    puts "... looking for #{id}"
    person = $db.execute("SELECT * from people where name = ? OR id = ?", id, id.to_i).first
    unless person
      puts "No result found"
      return
    end
    puts %Q{
      Name: #{person['name']}
      Job: #{person['job']}
      Gender: #{person['gender']}
      Age: #{person['age']}}
  end
  def list_all_people
    all_people = $db.execute("SELECT * from people order by name")
    all_people.each do |item|
      puts "Name: #{item['name']}"
    end
  end
  def disconnect_and_quit
    $db.close
    puts 'Bye!'
    exit
  end

end
