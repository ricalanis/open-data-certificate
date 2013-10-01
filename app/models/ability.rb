class Ability
  include CanCan::Ability

  def initialize(user)
    
    can :manage, ResponseSet do |response_set|
      response_set.nil? ||
        (
        response_set.user.nil? ||
        response_set.user == user
        )
    end
    
    can :manage, Dataset do |dataset|
      dataset.user.nil? ||
        dataset.user == user
    end

    can :accept, Transfer do |transfer|
      (transfer.token == transfer.token_confirmation) &&
      (transfer.target_email == user.email)
    end

    can :destroy, Transfer, user_id: user.id

    can :read, Dataset

  end
end
