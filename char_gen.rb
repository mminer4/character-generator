
require 'json'

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
}

# Ruby doesn't allow for hashes to be "deep" copied without 
# serialization, as such, I've opted to serialize to JSON 
# at each step since the goal is to eventually serialize to 
# JSON

base_creature_json = base_creature.to_json

# scoundrel generates with bonus to cunning, mental, enmity, luck
# assumes class gets 5 points to distribute
def create_scoundrel_char(base_stats_json)
    scoundrel_creature = JSON.parse(base_stats_json)
    scoundrel_creature["class"] = "scoundrel"
    scoundrel_creature["stats"]["cunning"] += 2
    scoundrel_creature["stats"]["mental"] += 1
    scoundrel_creature["stats"]["enmity"] += 1
    scoundrel_creature["stats"]["luck"] += 1
    scoundrel_creature["health"] = scoundrel_creature["stats"]["vitality"] * 5
    scoundrel_creature["mana"] = scoundrel_creature["stats"]["mental"] * 5
    scoundrel_creature["initiative"] = scoundrel_creature["stats"]["cunning"] * 10
    # return values of stats nested hash
    # scoundrel_creature["stats"].values
    scoundrel_creature.to_json
end

puts create_scoundrel_char(base_creature_json)

# brawler generates with bonus to might, mental, vitality, resolve
# assumes class gets 5 points to distribute
def create_brawler_char(base_stats_json)
    brawler_creature = JSON.parse(base_stats_json)
    brawler_creature["class"] = "brawler"
    brawler_creature["stats"]["might"] += 2
    brawler_creature["stats"]["mental"] += 1
    brawler_creature["stats"]["vitality"] += 1
    brawler_creature["stats"]["resolve"] += 1
    brawler_creature["health"] = brawler_creature["stats"]["vitality"] * 5
    brawler_creature["mana"] = brawler_creature["stats"]["mental"] * 5
    brawler_creature["initiative"] = brawler_creature["stats"]["cunning"] * 10
    brawler_creature.to_json
end

puts create_brawler_char(base_creature_json)

# apprentice generates with bonus to mental, influence, resolve
# assumes class gets 7 points to distribute
def create_apprentice_char(base_stats_json)
    apprentice_creature = JSON.parse(base_stats_json)
    apprentice_creature["class"] = "apprentice"
    apprentice_creature["stats"]["mental"] += 3
    apprentice_creature["stats"]["enmity"] += 2
    apprentice_creature["health"] = apprentice_creature["stats"]["vitality"] * 5
    apprentice_creature["mana"] = apprentice_creature["stats"]["mental"] * 5
    apprentice_creature["initiative"] = apprentice_creature["stats"]["cunning"] * 10
    apprentice_creature.to_json
end

puts create_apprentice_char(base_creature_json)

# initiate generates with bonus to agility, cunning, charisma, luck
# assumes class gets 7 points to distribute
def create_initiate_char(base_stats_json)
    initiate_creature = JSON.parse(base_stats_json)
    initiate_creature["class"] = "initiate"
    initiate_creature["stats"]["mental"] += 2
    initiate_creature["stats"]["influence"] += 2
    initiate_creature["stats"]["resolve"] += 1
    initiate_creature["health"] = initiate_creature["stats"]["vitality"] * 5
    initiate_creature["mana"] = initiate_creature["stats"]["mental"] * 5
    initiate_creature["initiative"] = initiate_creature["stats"]["cunning"] * 10
    initiate_creature.to_json
end

puts create_initiate_char(base_creature_json)






