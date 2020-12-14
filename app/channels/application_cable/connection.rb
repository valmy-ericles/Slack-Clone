module ApplicationCable
  class Connection < ActionCable::Connection::Base
    indentified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    def ability
      @ability ||= Ability.new(current_user)
    end

    protected

    def find_verified_user
      verified_user = User.find(cookies.signed['user.id'])
      return verified_user if verified_user.present?

      reject_unauthorized_connection
    end
  end
end
