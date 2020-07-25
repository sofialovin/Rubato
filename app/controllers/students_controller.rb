class StudentsController < ApplicationController
  def index
    @students = policy_scope(Student).order(created_at: :desc)
  end
end
