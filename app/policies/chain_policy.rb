class ChainPolicy < ApplicationPolicy
  def show?
    owner?
  end

  def train?
    owner?
  end
  
  def index?
    true
  end

  def edit?
    owner?
  end

  def new?
    true
  end

  def create?
    true
  end

  def update?
    owner?
  end

  def destroy?
    owner?
  end

  private

  def owner?
    record.user == user
  end
end