class TeachPolicy < ApplicationPolicy
  def create?
    owner?
  end

  private

  def owner?
    record.user == user
  end
end
