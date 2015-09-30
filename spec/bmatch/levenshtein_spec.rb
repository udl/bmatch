require 'bmatch/levenshtein'
RSpec.describe Levenshtein do

  it "has a distance of 0 for the same string" do
    expect(Levenshtein.distance("aa", "aa")).to be 0
  end

  it "has a distance of 1 for a one-off string" do
    expect(Levenshtein.distance("aa", "ab")).to be 1
  end
end
