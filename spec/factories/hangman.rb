FactoryGirl.define do
  factory :hangman do
    user
    answer { Hangman::WORD_LIST.sample }
  end
end
