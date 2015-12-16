class Message < ActiveRecord::Base
  scope :lastes, -> { order("created_at desc") }
end
