class Credit < ApplicationRecord
  # validates :number,       presence: true, length: {is: 16}
  # validates :securitycode, presence: true

  belongs_to :user
end
