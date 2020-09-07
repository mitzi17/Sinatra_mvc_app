class Movement < ActiveRecord::Base
    belongs_to :user

    validates :destination, presence: true
    validates :type, presence: true
end
