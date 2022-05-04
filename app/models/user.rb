class User < ApplicationRecord
  acts_as_voter
  # Should be enrolled in foundation by default

  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: %i[github google]

end
