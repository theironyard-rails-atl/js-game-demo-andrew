namespace :play do
  def random_word
    Hangman::WORD_LIST.sample
  end

  def random_letter
    ('a'..'z').to_a.sample
  end

  desc 'Creates some sample hangman games'
  task :hangman do
    User.find_each do |u|
      # Win a game
      word = random_word
      g = u.hangmen.create! answer: word
      word.each_char { |c| g.guess c }

      # Lose a game (probably)
      g = u.hangmen.create! answer: random_word
      g.guess random_letter until g.finished?

      # Try some games
      3.times do
        g = u.hangmen.create! answer: random_word
        6.times { g.guess random_letter }
      end
    end
  end
end
