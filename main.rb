# frozen_string_literal: true

# class dungeon
class Dungeon
  attr_accessor :player

  def initialize(player)
    @player = player
    @rooms = {}
  end

  def add_room(reference, name, description, connections)
    @rooms[reference] = Room.new(reference, name, description, connections)
  end

  def start(location)
    @player.location = location
    show_current_description
  end

  def find_room_in_dungeon(reference)
    @rooms[reference]
  end

  def show_current_description
    puts find_room_in_dungeon(@player.location).full_descritpion
  end

  def find_room_in_direction(direction)
    find_room_in_dungeon(@player.location).connections[direction]
  end

  def go(direction)
    puts "You go #{direction}"
    @player.location = find_room_in_direction(direction)
    show_current_description
  end
end

#  class player
class Player
  attr_accessor :name, :location

  def initialize(player_name)
    @name = player_name
  end
end

# class room
class Room
  attr_accessor :reference, :name, :description, :connections

  def initialize(reference, name, description, connections)
    @reference = reference
    @name = name
    @description = description
    @connections = connections
  end

  def full_descritpion
    "#{@name} \n You are in #{@description}"
  end
end

player_one = Player.new('Hans-Derly Rameau')
my_dungeon = Dungeon.new(player_one)

my_dungeon.add_room(:largecave, 'Large cave', 'A large cavernous cave', { west: :smallcave })
my_dungeon.add_room(:smallcave, 'Small cave', 'A small, claustrophobic cave', { east: :largecave })

my_dungeon.start(:largecave)
my_dungeon.go(:west)
