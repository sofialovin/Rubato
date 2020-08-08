class DashboardsController < ApplicationController

  def my_dashboard
    date = Date.today
    @lessons = policy_scope(Lesson)


    if params[:query].present?
      @this_weeks_lessons = policy_scope(Lesson).joins(:student).where('date < ? AND date > ?', date.end_of_week, date.beginning_of_week).where("students.first_name LIKE ? OR students.last_name LIKE ?", "%#{params[:query].capitalize}%","%#{params[:query].capitalize}%").order(date: :asc, start_time: :desc)

      @last_weeks_lessons = policy_scope(Lesson).joins(:student).where('date < ? AND date > ?', date.prev_week(:sunday), date.prev_week(:monday)).where("students.first_name LIKE ? OR students.last_name LIKE ?", "%#{params[:query].capitalize}%","%#{params[:query].capitalize}%").order(date: :desc, start_time: :desc)
    else
      @this_weeks_lessons = policy_scope(Lesson).where('date < ? AND date > ?', date.end_of_week, date.beginning_of_week).order(date: :asc, start_time: :desc)

      @last_weeks_lessons = policy_scope(Lesson).where('date < ? AND date > ?', date.prev_week(:sunday), date.prev_week(:monday)).order(date: :desc, start_time: :desc)
    end

    @missing_notes = missing_notes(@last_weeks_lessons)

    authorize @this_weeks_lessons
    authorize @last_weeks_lessons

    @note = Note.new
    authorize @note
  end

  private

  def missing_notes(lessons)
    counter = 0
    lessons.each do |lesson|
      counter += 1 unless lesson.note.present?
    end
    counter
  end
end
