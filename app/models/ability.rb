class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :read, Product, public: true
    can :read, Campany, public: true
    can :read, Category, public: true
    if user.persisted?
      can :create, Order
      can :read, Order, user_id: user.id
    end
    can :manage, :all if user.role == 'admin'
  end
end
