class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, :all
    can :create, Item
    can :update, Item do |item|
      item.try(:user) == user
    end
    can :destroy, Item do |item|
      item.try(:user) == user
    end
    if user.user_role? "admin"
      can :manage, :all
    end
  end
end