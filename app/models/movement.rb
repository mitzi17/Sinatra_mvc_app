class Movement < ActiveRecord::Base
    belongs_to :user
    validates :destination, presence: true
    validates :date, presence: true
    validates :season, presence: true
    validates :category, presence: true
    validates :box_number, presence: true, uniqueness: true
    validates :units_quantity, presence: true

end
