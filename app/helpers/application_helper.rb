module ApplicationHelper
  def flash_class name
    # Translate rails conventions to bootstrap conventions
    case name.to_sym
    when :notice
      :success
    when :alert
      :error
    else
      name
    end
  end

  def row_status_class game
    if game.won?
      :won
    elsif game.lost?
      :lost
    else
      :playing
    end
  end
end
