class Connection < ApplicationRecord
    belongs_to :user, :foreign_key => 'user_id', :class_name => 'User'
    belongs_to :connectee, :foreign_key => 'connectee_id', :class_name => 'User'
end
