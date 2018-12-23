require 'json'
require_relative 'base_creature'
require_relative 'male_names'

apprentice = {
    class: "apprentice",
    stats: {
        mental: 8,
        enmity: 7
    }
}

brawler = {
    class: "brawler",
    stats: {
        might: 7,
        mental: 6,
        vitality: 6,
        resolve: 6
    }
}

initiate = {
    class: "initiate",
    stats: {
        mental: 7,
        influence: 7,
        resolve: 6
    }
}

scoundrel = {
    class: "scoundrel",
    stats: {
        cunning: 7,
        mental: 6,
        enmity: 6,
        luck: 1
    }
}

def process_health(vitality)
    vitality * 5
end

def process_mana(mental)
    mental * 5
end

def process_initiative(cunning)
    cunning * 10
end

def process_dependent_stats(new_creature, stats)
    new_creature[:health] = process_health(stats[:vitality])
    new_creature[:mana] = process_mana(stats[:mental])
    new_creature[:initiative] = process_initiative(stats[:cunning])
end

def select_name
    names_collection = NamesCollection::MALE_NAMES
    names_collection.sample
end

def assign_name_and_class

end

def create_base_creature
    base_creature = BaseCreature.new
end

def generate_creature(creature)

    new_creature = create_base_creature.info

    new_creature[:class] = creature[:class]
    new_creature[:name] = select_name

    stats = new_creature[:stats]

    creature[:stats].each do |stat_name, value|
        stats[stat_name] = value
    end

    process_dependent_stats(new_creature, stats)

    new_creature.to_json
end

puts generate_creature(apprentice)
puts
puts generate_creature(brawler)
puts
puts generate_creature(initiate)
puts
puts generate_creature(scoundrel)





