class ProfilePolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user.present?
  end

  def update?
    true if user.present? && (is_owner? || is_admin?)
  end

  def destroy?
    true if user.present? && (is_owner? || is_admin?)
  end

  private

  # just a nice little namespace method
  def event
    record
  end

  def is_owner?
    user == event.owner
  end

  def is_admin?
    # user.admin
    false # not yet implemented
  end
end