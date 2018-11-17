
require 'json'

# ruby hash but convert to JSON for easy access for battle system
# Ruby doesn't allow for hashes to be "deep" copied without 
# serialization, as such, I've opted to serialize to JSON 
# at each step since the goal is to eventually serialize to 
# JSON

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

def process_initiative(cunning)
    cunning * 10
end

apprentice_hash = {
    "class" => "apprentice",
    "stats" => {
        "mental" => 8,
        "enmity" => 7
    }
}

brawler_hash = {
    "class" => "brawler",
    "stats" => {
        "might" => 7,
        "mental" => 6,
        "vitality" => 6,
        "resolve" => 6
    }
}

initiate_hash = {
    "class" => "initiate",
    "stats" => {
        "mental" => 7,
        "influence" => 7,
        "resolve" => 6
    }
}

scoundrel_hash = {
    "class" => "scoundrel",
    "stats" => {
        "cunning" => 7,
        "mental" => 6,
        "enmity" => 6,
        "luck" => 1
    }
}

def process_dependent_stats(new_creature, stats)
    new_creature["health"] = process_health(stats["vitality"])
    new_creature["mana"] = process_mana(stats["mental"])
    new_creature["initiative"] = process_initiative(stats["cunning"])
end

def generate_creature(base_stats, creature)
    new_creature = JSON.parse(base_stats)
    
    new_creature["class"] = creature["class"]

    stats = new_creature["stats"]

    #creature["stats"]

    creature["stats"].each do |stat_name, value|
        stats["#{stat_name}"] = value
    end

    process_dependent_stats(new_creature, stats)

    new_creature.to_json
end

puts
puts generate_creature(base_creature, apprentice_hash)
puts
puts generate_creature(base_creature, brawler_hash)
puts
puts generate_creature(base_creature, initiate_hash)
puts
puts generate_creature(base_creature, scoundrel_hash)
puts






