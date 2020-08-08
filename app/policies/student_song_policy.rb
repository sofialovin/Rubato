class StudentSongPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def destroy?
    true
  end

  def create_student_song?
    true
  end
end
