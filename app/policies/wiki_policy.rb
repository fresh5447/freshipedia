class WikiPolicy < ApplicationPolicy
  
  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user: user)
      end
    end
  end
 
  def index?
    if user.role?(:admin)
      true
    elsif user.role?(:premium)
      !record.private? && (record.user == user || record.collaborators.map{|collab| collab.user}.include?(user)) 
    else
      false
    end
  end
  
 
  def update?
    index?
  end
 
  def edit?
    index?
  end
 
  def create?
    user.present?
  end
 
  def show?
    record.private? ? update? : true
  end
 
  def destroy?
    update?
  end
 
end
