class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all
    can :show, :all
    if user.knkf_member?
      can :destroy, Reading, user_id: user.id
      can :edit, Reading, user_id: user.id
      can :create, Reading, user_id: user.id
      can :destroy, Meeting, user_id: user.id
      can :edit, Meeting, user_id: user.id
      can :create, Meeting, user_id: user.id
    end
  end
end