require 'rails_helper'

feature 'Playing hangman' do
  before :each do
    @user = create :user
    login @user
  end

  it 'can create a new hangman game' do
    visit hangmen_path
    click_on 'New Game'
    expect( page ).to have_content ('a'..'z').to_a.join
  end

  it 'can play an existing game' do
    game = create :hangman, user: @user
    visit hangmen_path
    click_on 'Play'

    fill_in 'guess', with: game.answer.first
    click_on 'Guess'
    expect( page ).to have_content game.reload.board
    expect( page ).to have_content "0/#{game.max_misses}"

    bad = ('a'..'z').to_a - game.answer.split('')
    fill_in 'guess', with: bad.first
    click_on 'Guess'
    expect( page ).to have_content game.reload.board
    expect( page ).to have_content "1/#{game.max_misses}"
  end
end
