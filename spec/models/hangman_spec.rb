require 'rails_helper'

describe Hangman do
  describe "when in progress" do
    before :each do
      @game = create :hangman, answer: "banana"
      @game.guess "a"
    end

    it "can display the board" do
      expect( @game.board ).to eq "_a_a_a"
    end

    it "is not finished" do
      expect( @game.finished? ).to eq false
    end

    it "knows which letters are available" do
      @game.guess "b"
      @game.guess "c"
      expect( @game.available_letters ).to eq ('d'..'z').to_a
    end

    it "can be won" do
      @game.guess "b"
      @game.guess "n"
      expect( @game.won? ).to be true
    end

    it "can be lost" do
      "cdefgh".each_char { |c| @game.guess c }
      expect( @game.lost? ).to be true
    end
  end
end
