module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :uuid

    def connect
      self.uuid = find_uuid
    end

    protected
    def find_uuid
      if uuid = Time.now.to_i
        uuid
      else
        reject_unauthorized_connection
      end
    end
  end
end