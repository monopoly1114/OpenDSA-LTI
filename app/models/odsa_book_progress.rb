class OdsaBookProgress < ActiveRecord::Base
  #~ Relationships ............................................................
  belongs_to :users
  belongs_to :inst_books
  #~ Validation ...............................................................
  #~ Constants ................................................................
  #~ Hooks ....................................................................
  #~ Class methods ............................................................
  #~ Instance methods .........................................................
  def update_started(inst_exercise)
    unless self.started?(inst_exercise)
      if self.started_exercises.to_s.strip.length == 0
        self.started_exercises = inst_exercise.id
      else
        self.started_exercises += ',' + inst_exercise.id
      end
    end
    self.save
  end

  def update_proficiency(exercise_progress)
    inst_book_section_exercise = InstBookSectionExercise.find_by(id: exercise_progress.inst_book_section_exercise_id)
    inst_exercise = InstExercise.find_by(id: inst_book_section_exercise.inst_exercise_id)

    threshold = inst_book_section_exercise.threshold
    highest_score = exercise_progress.highest_score
    if highest_score >= threshold
      unless self.proficient?(inst_exercise)
        if self.proficient_exercises.to_s.strip.length == 0
          self.proficient_exercises = inst_exercise.id
        else
          self.proficient_exercises += ',' + inst_exercise.id
        end
      end
    end
    self.save
  end

  def started?(inst_exercise)
    started_exercises = self.started_exercises.split(',')
    started_exercises.include? inst_exercise.id
  end

  def proficient?(inst_exercise)
    proficient_exercises = self.proficient_exercises.split(',')
    proficient_exercises.include? inst_exercise.id
  end
  #~ Private instance methods .................................................
end
