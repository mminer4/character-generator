class BaseCreature

    def initialize
        @base_creature_stats = {
            might: 5,
            cunning: 5,
            mental: 5,
            influence: 5,
            vitality: 5,
            resolve: 5,
            enmity: 5,
            luck: 0
        }

        isolated_stats = @base_creature_stats

        @base_creature = {
            name: "N/A",
            class: "creature",
            stats: isolated_stats,
            health: 25,
            mana: 15,
            initiative: 50
        }

    end

    def info
        @base_creature
    end

end

