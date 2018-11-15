
require 'json'

# ruby hash but convert to JSON for easy access to battle system
base_creature = {
    :class => "creature",
    :stats => {
        :might => 5,
        :cunning => 5,
        :mental => 5,
        :influence => 5,
        :vitality => 5,
        :resolve => 5,
        :enmity => 5,
        :luck => 0
    },
    :health => 25,
    :mana => 15,
    :initiative => 50
}.to_json

def process_health(vitality)
    return vitality * 5
end

def process_mana(mental)
    return mental * 5
end

def process_initiative(agility)
    agility * 10
end

# Ruby doesn't allow for hashes to be "deep" copied without 
# serialization, as such, I've opted to serialize to JSON 
# at each step since the goal is to eventually serialize to 
# JSON

# scoundrel generates with bonus to cunning, mental, enmity, luck
# assumes class gets 5 points to distribute
def create_scoundrel_char(base_stats_json)
    scoundrel_creature = JSON.parse(base_stats_json)
    stats_hash = scoundrel_creature["stats"]
    scoundrel_creature["class"] = "scoundrel"
    stats_hash["cunning"] += 2
    stats_hash["mental"] += 1
    stats_hash["enmity"] += 1
    stats_hash["luck"] += 1
    scoundrel_creature["health"] = process_health(stats_hash["vitality"])
    scoundrel_creature["mana"] = process_mana(stats_hash["mental"])
    scoundrel_creature["initiative"] = process_initiative(stats_hash["cunning"])
    # return values of stats nested hash
    # scoundrel_creature["stats"].values
    scoundrel_creature.to_json
end

puts
puts create_scoundrel_char(base_creature)
puts

# brawler generates with bonus to might, mental, vitality, resolve
# assumes class gets 5 points to distribute
def create_brawler_char(base_stats_json)
    brawler_creature = JSON.parse(base_stats_json)
    brawler_creature["class"] = "brawler"
    stats_hash = brawler_creature["stats"]
    stats_hash["might"] += 2
    stats_hash["mental"] += 1
    stats_hash["vitality"] += 1
    stats_hash["resolve"] += 1
    brawler_creature["health"] = process_health(stats_hash["vitality"])
    brawler_creature["mana"] = process_mana(stats_hash["mental"])
    brawler_creature["initiative"] = process_initiative(stats_hash["cunning"])
    brawler_creature.to_json
end

puts create_brawler_char(base_creature)
puts

# apprentice generates with bonus to mental, influence, resolve
# assumes class gets 7 points to distribute
def create_apprentice_char(base_stats_json)
    apprentice_creature = JSON.parse(base_stats_json)
    apprentice_creature["class"] = "apprentice"
    stats_hash = apprentice_creature["stats"]
    stats_hash["mental"] += 3
    stats_hash["enmity"] += 2
    apprentice_creature["health"] = process_health(stats_hash["vitality"])
    apprentice_creature["mana"] = process_mana(stats_hash["mental"])
    apprentice_creature["initiative"] = process_initiative(stats_hash["cunning"])
    apprentice_creature.to_json
end

puts create_apprentice_char(base_creature)
puts

# initiate generates with bonus to agility, cunning, charisma, luck
# assumes class gets 7 points to distribute
def create_initiate_char(base_stats_json)
    initiate_creature = JSON.parse(base_stats_json)
    initiate_creature["class"] = "initiate"
    stats_hash = initiate_creature["stats"]
    stats_hash["mental"] += 2
    stats_hash["influence"] += 2
    stats_hash["resolve"] += 1
    initiate_creature["health"] = process_health(stats_hash["vitality"])
    initiate_creature["mana"] = process_mana(stats_hash["mental"])
    initiate_creature["initiative"] = process_initiative(stats_hash["cunning"])
    initiate_creature.to_json
end

puts create_initiate_char(base_creature)
puts






