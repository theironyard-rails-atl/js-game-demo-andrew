json.(hangman, :board, :misses, :max_misses, :guessed)
json.user do
  json.id    hangman.user.id
  json.email hangman.user.email
end
