require 'minitest/autorun'
require 'yaml'
class SerializeTest < Minitest::Unit::TestCase
  def setup
    @ogre = Ogre.new(62,12)
  end
  def test_serialize_an_instance
    puts @ogre
    cereal_yaml = @ogre.serialize
    p cereal_yaml
    puts "... change back to object #{Ogre.deserialize(cereal_yaml)}"
  end
  def test_serial_ogre_array
    fiona = Ogre.new(10,10)
    shrek = Ogre.new(5,5)
    ogres = [fiona, shrek]
    puts ogres
    p ogres.serialize
  end

  
end

class Ogre
  def initialize(strength, speed)
    @strength = strength
    @speed = speed
    
  end
  def self.deserialize(yaml_string)
    YAML::load(yaml_string)
    
  end
  def serialize
    YAML::dump(self)
    
  end
  def to_s
    "Ogre: [strength = #{@strength}, speed = #{@speed}]"
  end
end