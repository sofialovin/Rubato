class LessonsController < ApplicationController
  def index
    @lessons = policy_scope(Lesson)

    @student_lessons = policy_scope(Lesson).where("lesson.student.first_name LIKE ? OR lesson.student.last_name LIKE ?", "%#{params[:query].capitalize}%","%#{params[:query].capitalize}%") if params[:query].present?

    @past_lessons = policy_scope(Lesson).where('start_time < ?', DateTime.now)
    @upcoming_lessons = policy_scope(Lesson).where('start_time > ?', DateTime.now)

    @lesson = Lesson.new
    if params[:student_id].nil?
      @student = Student.new
    else
      @student = Student.find(params[:student_id])
    end
    @lesson.student = @student
    authorize @lesson


  end

  def new
    @lesson = Lesson.new
    if params[:student_id].nil?
      @student = Student.new
    else
      @student = Student.find(params[:student_id])
    end
    @lesson.student = @student
    authorize @lesson
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.date = lesson_params[:date]
    @lesson.start_time = lesson_params[:start_time]
    @lesson.duration = lesson_params[:duration]
    puts "STUDENT ID: #{lesson_params[:student_id]}"
    if lesson_params[:student_id] == ""
      puts "student id is nil"
    else
      @lesson.student = Student.find(lesson_params[:student_id])
    end

    authorize @lesson

    if @lesson.save
    redirect_to lessons_path, alert: "Lesson added!"

    else
    render :new
      puts "Lesson was not saved."
    end
  end

  private

  def lesson_params
    params.require(:lesson).permit(:date, :start_time, :duration, :student_id)
  end
end
