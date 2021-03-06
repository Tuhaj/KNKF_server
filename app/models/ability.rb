class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all
    can :show, :all
    can :remove_me, Meeting, user_id: user.id
    can :add_me, Meeting, user_id: user.id

    if user.knkf_member?
      can :destroy, Reading, user_id: user.id
      can :edit, Reading, user_id: user.id
      can :create, Reading
      can :destroy, Meeting, user_id: user.id
      can :edit, Meeting, user_id: user.id
      can :create, Meeting
      can :update, Meeting, user_id: user.id
      can :new, Note
      can :create, Note
    end
  end
end