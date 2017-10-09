class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :twitter]

  acts_as_paranoid

  has_many :notifications
  has_many :topics
  has_many :comments

  def response
    {
      id: self.id,
      name: self.name,
      gender: self.gender,
      birth_year: self.birth_year,
      area: self.area,
      district: self.district,
      industry: self.industry,
      job: self.job,
      university: self.university,
      major: self.major,
      photo: self.photo,
      policy_field: self.policy_field,
      team_id: self.team_id,
      profile: self.profile
    }
  end

  def me
    self.response.merge(
      email: self.email,
      uid: self.uid,
      twitter_id: self.twitter_id
    )
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
