class ChordPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def index?
    return true
  end

  def show?
    return true
  end

  def new?
    return true
  end

  def create?
    return true
  end

  def update?
    return true
    # record.user == user
    # - record: the song passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  def destroy?
    record.user == user
  end
end
