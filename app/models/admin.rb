class Admin < User
  validates :last_name,
            :first_name,
            presence: true
end
