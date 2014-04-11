class WikiPolicy < Struct.new(:user, :wiki)
  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.role?(:admin)
        scope.all
      elsif user.role?(:premium)
        wiki.user == user || wiki.collaborators.map {|collab| collab.user}.include?(user)
      else
        scope.where(:private => false)
      end
    end
  end

  def update?
   # Rails.logger.info ">>> #{user.inspect}"
    Rails.logger.info ">>>>> #{wiki.inspect}"
    user.admin? or not wiki.private?
  end

  def edit?
    update?
  end

  def create?
    user.present?
  end

  def show?
  end

  def destroy?
    update?
  end

end