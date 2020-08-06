class DashboardsController < ApplicationController

  def my_dashboard
    date = Date.today
    @this_weeks_lessons = Lesson.where('date < ? AND date > ?', date.end_of_week, date.beginning_of_week).order(date: :asc, start_time: :desc)
    @last_weeks_lessons = Lesson.where('date < ? AND date > ?', date.prev_week(:sunday), date.prev_week(:monday)).order(date: :desc, start_time: :desc)


    authorize @this_weeks_lessons
    authorize @last_weeks_lessons
  end
end
