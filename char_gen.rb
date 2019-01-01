require 'json'
require_relative 'base_creature'
require_relative 'names_collection'
require_relative 'class_stats'

class CharacterGenerator

    def process_health(vitality)
        vitality * 5
    end

    def process_mana(mental)
        mental * 5
    end

    def process_dependent_stats(new_creature, stats)
        new_creature[:health] = process_health(stats[:vitality])
        new_creature[:mana] = process_mana(stats[:mental])
    end

    def select_name
        names_collection = NamesCollection::MALE_NAMES
        names_collection.sample
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

    def make_apprentice
        generate_creature(ClassStats::APPRENTICE)
    end

    def make_brawler
        generate_creature(ClassStats::BRAWLER)
    end

    def make_initiate
        generate_creature(ClassStats::INITIATE)
    end

    def make_scoundrel
        generate_creature(ClassStats::SCOUNDREL)
    end
end