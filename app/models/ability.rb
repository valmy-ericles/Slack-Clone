# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user

    check_team(user)
    check_channel(user)
    check_talk(user)
    check_team_user(user)
  end

  private

  def check_team(user)
    can :read, Team, user_id: user.id || Team.users.where(id: user.id).present?
    can :destroy, Team, user_id: user.id
  end

  def check_channel(user)
    can %i[read create], Channel, Channel.team.user_id == user.id || Channel.team.users.where(id: user.id).present?
    can %i[destroy update], Channel, Channel.team.user_id == user.id || Channel.user_id == user.id
  end

  def check_talk(user)
    can :read, Talk, Talk.user_one_id == user.id || Talk.user_two_id == user.id
  end

  def check_team_user(user)
    can %i[create destroy], TeamUser, TeamUser.team.user_id == user.id
  end
end
