class Ability
  include CanCan::Ability

  def initialize(user)
 	can :read, :all
 	can :show, :all
 	can :destroy, Reading, user_id: user.id
 	can :destroy, Meeting, user_id: user.id
 	can :edit, Meeting, user_id: user.id
 	can :create, Meeting, user_id: user.id

 	
  end
end