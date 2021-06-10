module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_account

    def connect
      reject_unauthorized_connection unless find_verified_user
    end

    private

    def find_verified_user
      self.current_account = env['warden'].user
    end
  end
end