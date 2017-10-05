class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :twitter]

  acts_as_paranoid

  def me
    {
      name: self.name,
      email: self.email,
      uid: self.uid,
      gender: self.gender,
      district: self.district,
      area: self.area,
      job: self.job,
      industry: self.industry,
      birth_year: self.birth_year,
      support_for: self.support_for,
      support_type: self.support_type,
      twitter_id: self.twitter_id,
      profile: self.profile
    }
  end

  def self.from_omniauth(auth)
    User.where(uid: auth.uid).first_or_create do |user|
      user.uid = auth.uid
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
      user.email = auth.info.email || "#{user.uid}#{DUMMY_EMAIL_DOMAIN}"
    end
  end
end
