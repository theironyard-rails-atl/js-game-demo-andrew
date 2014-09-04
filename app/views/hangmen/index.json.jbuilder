json.array! @hangmen.includes(:user) do |hangman|
  json.partial! "hangmen/item", hangman: hangman
end
