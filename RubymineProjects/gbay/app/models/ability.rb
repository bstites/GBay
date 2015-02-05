class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all
    can :manage, :Item do |item|
      item.user_id == user.id
      end

  end
end