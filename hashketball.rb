def game_hash
  {
    home: {team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
           players: {
             "Alan Anderson" => {number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
             "Reggie Evans" => {number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
             "Brook Lopez" => {number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
             "Mason Plumlee" => {number: 1, shoe: 19, points: 26, rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
             "Jason Terry" => {number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
             }
           },
    away: {team_name: "Charlotte Hornets",
      colors: ["Turquoise","Purple"],
           players: {
             "Jeff Adrien" => {number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
             "Bismak Biyombo" => {number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10},
             "DeSagna Diop" => {number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
             "Ben Gordon" => {number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
             "Brendan Haywood" => {number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12}
             }
           }
    }
end

def num_points_scored(name)
  game_hash.each do |team, properties|
    properties.each do |key, values|
      if key == :players
        values.each do |pName, data|
          if pName == name
            data.each do |key, value|
              if key == :points
                return value
            break
              end
            end
          end
        end
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |team, properties|
    properties.each do |key, values|
     if key == :players
        values.each do |pName, data|
          if pName == name
            data.each do |key, value|
              if key == :shoe
                return value
            break
              end
            end
          end
        end
      end
    end
  end
end

def team_colors(team_name)

  found_team = false
  teamColors = []

  game_hash.each do |awayHome, properties|
    properties.each do |key, value|
      if found_team and key == :colors
          teamColors.concat(value)
          found_team = false
       end
       if value == team_name
          found_team = true
       end
    end
  end
  teamColors
end

def team_names
  teams = []
  game_hash.each do |a,b|
    b.each do |key,value|
      if key == :team_name
        teams << value
      end
    end
  end
    teams
end

def player_numbers(team_name)

  found_team = false
  nums = []

  game_hash.each do |awayHome, properties|
    properties.each do |key, value|
      if found_team and key == :players
        value.each do |player, stats|
          stats.each do |stat, n|
            if stat == :number
              nums << n
            end
          end
        end
        found_team = false
       end
       if value == team_name
          found_team = true
       end
      end
    end
   nums
end

def player_stats(player)
  game_hash.each do |team, properties|
    properties.each do |key, values|
      if key == :players
        values.each do |pName, data|
          if pName == player

            return data

            break
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  max = 0
  rebs = 0
  game_hash.each do |team, properties|
    properties.each do |key, values|
     if key == :players
        values.each do |pName, data|
          data.each do |stat, v|
            if stat == :shoe and v > max
              max = v
              rebs = data[:rebounds]
            end
          end
        end
      end
    end
  end
  rebs
end

=begin
def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        binding.pry

        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
        data.each do |data_item|
            binding.pry
      end
    end
  end
end



good_practices
=end

puts team_colors("Charlotte Hornets")
puts shoe_size("Jeff Adrien")
puts team_names
puts player_numbers("Brooklyn Nets")
puts player_stats("Bismak Biyombo")
puts big_shoe_rebounds



