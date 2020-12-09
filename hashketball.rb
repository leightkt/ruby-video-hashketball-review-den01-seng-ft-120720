# Write your code below game_hash
require 'pry'

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Write code here
def players
  game_hash[:home][:players].concat game_hash[:away][:players]
end

def find_player(name)
  players.find do |player_info|
    player_info[:player_name] == name
  end
end

def num_points_scored(name)
  find_player(name)[:points]
end

def shoe_size(name)
  find_player(name)[:shoe]
end

def find_team(team_name)
  game_hash.values.find do |team|
    team_name == team[:team_name]
  end
end

def team_colors(team)
  find_team(team)[:colors]
end

def team_names
  game_hash.values.reduce([]) do |teams_array, team_info|
    teams_array << team_info[:team_name]
  end
end

def player_numbers(team)
  find_team(team)[:players].reduce([]) do |numbers_arr, player_stats|
    numbers_arr << player_stats[:number]
  end
end

def player_stats(name)
  find_player(name)
end

def big_shoe_rebounds
  returned_player = players.reduce do |biggest_shoe, player_stats|
    player_stats[:shoe] > biggest_shoe[:shoe] ? player_stats : biggest_shoe
  end
  returned_player[:rebounds]
end

def most_points_scored
  # most_points = 0
  # player_name = ""
  # game_hash.each{|key, value|
  #   value[:players].each{|player_stats|
  #     if player_stats[:points] > most_points
  #       most_points = player_stats[:points]
  #       player_name = player_stats[:name]
  #     end
  #   }
  # }
  # player_name
  returned_player = players.reduce do |most_points, player_stats|
    player_stats[:points] > most_points[:points] ? player_stats : most_points
  end
  returned_player[:name]
end
