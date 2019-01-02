require 'spec_helper'
require_relative '../lib/char_gen'
require_relative '../lib/base_stats/base_creature'

describe CharacterGenerator do
    before(:each) do
        @test_class = CharacterGenerator.new
    end

    describe "#process_health" do
        it "multiplies vitality times 5" do
            expect(@test_class.process_health(5)).to eq(25)
        end
    end

    describe "#process_mana" do
        it "multiplies mental times 5" do
            expect(@test_class.process_mana(5)).to eq(25)
        end
    end

    describe "#select_name" do
        it "returns a string" do
            expect(@test_class.select_name).to be_a(String)
        end
    end
end