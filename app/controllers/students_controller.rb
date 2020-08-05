class StudentsController < ApplicationController
  def index
    if params[:query].present?
      @students = policy_scope(Student).where("first_name LIKE ? OR last_name LIKE ?", "%#{params[:query].capitalize}%","%#{params[:query].capitalize}%")
    else
      @students = policy_scope(Student).order(created_at: :desc)
    end

    authorize @students
  end

  def new
    @student = Student.new
    authorize @student
  end

  def create
    @student = Student.new(student_params)
    @student.user = current_user

    authorize @student

    if @student.save
      redirect_to student_path(@student), notice: "You succesfully added a student."
    else
      render :new
    end
  end

  def show
    @student = Student.find(params[:id])
    authorize @student

    @student_songs = @student.songs
    @lessons = @student.lessons.order(date: :desc)

    # @student_song = StudentSong.find(params[:query])
    # puts @student_song
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :skill_level, :user_id, :avatar)
  end
end
