module AttemptsHelper
  def dot_colour(exercise)
    if exercise_completed_by_user?(exercise)
      "green"
    elsif exercise_attempted_by_user?(exercise)
      "orange"
    else
      "not-attempted"
    end
  end

  def exercise_completed_by_user?(exercise)
    return false unless current_user

    attempts = current_user.attempts.select {|attempt| attempt.exercise_id == exercise.id }

    attempts.select {|a| a.completed?}.any?
  end

  def exercise_attempted_by_user?(exercise)
    return false unless current_user

    attempts = current_user.attempts.select {|attempt| attempt.exercise_id == exercise.id }

    attempts.any?
  end
end
