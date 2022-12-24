module AttemptsHelper
  def exercise_completed_by_user?(exercise)
    return false unless current_user

    attempts = current_user.attempts.select {|attempt| attempt.exercise_id == exercise.id }

    attempts.select {|a| a.completed?}.any?
  end

  def exercise_attempted_by_user?(exercise)
    return false unless current_user

    attempts = current_user.attempts.select {|attempt| attempt.exercise_id == exercise.id }
    complete_attempts = attempts.select {|a| a.completed?}

    # exercise has been attempted but not completed
    attempts.any? && !complete_attempts
  end
end
