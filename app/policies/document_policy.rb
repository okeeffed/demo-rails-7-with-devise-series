class DocumentPolicy < ApplicationPolicy
  attr_reader :current_user, :document

  def initialize(current_user, document)
    @current_user = current_user
    @document = document
  end

  def create?
    current_user.admin?
  end

  def index?
    current_user.admin?
  end

  def show?
    current_user.admin? || current_user.documents.exists?(id: document.id)
  end

  def update?
    current_user.admin?
  end

  def destroy?
    current_user.admin?
  end
end
