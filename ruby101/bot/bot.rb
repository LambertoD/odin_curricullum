require 'yaml'
load 'wordplay.rb'

class Bot
  attr_reader :name

  def initialize(options)
    @name = options[:name] || "Unnamed Bot"
    begin
      @data = YAML.load(File.read(options[:data_file]))
    rescue 
      raise "Can't load bot data"
    end
  end

  def greeting
    @data[:responses][:greeting][rand(@data[:responses][:greeting].length)]
  end
  def farewell
    @data[:responses][:farewell][rand(@data[:responses][:farewell].length)]
  end


end