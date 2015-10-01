# encoding: utf-8
require 'bmatch/similarities'
RSpec.describe Similarities do

  context "#dice_similarity" do
    it "has a similarity of 1 for the same string" do
      expect(Similarities.dice_similarity("aa", "aa")).to be 1.0
    end

    it "has a similarity of 1/4 for 'night' and 'nacht'" do
      expect(Similarities.dice_similarity("night", "nacht")).to be 0.25
    end

    it "also works for utf-8" do
      expect(Similarities.dice_similarity("münchen", "munich")).to be 0.1818181872367859
    end
  end

  context "#levenshtein_distance" do
    it "has a distance of 0 for the same string" do
      expect(Similarities.levenshtein_distance("aa", "aa")).to be 0
    end

    it "has a distance of 1 for a one-off string" do
      expect(Similarities.levenshtein_distance("aa", "ab")).to be 1
    end

    it "also works for utf-8" do
      expect(Similarities.levenshtein_distance("aa", "aü")).to be 1
    end

  end
end

