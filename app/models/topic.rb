class Topic < ApplicationRecord
  enum policy: POLICY_PARAMS

  validates :user_id, presence: true
  validates :title,   presence: true
  validates :content, presence: true

  has_many :comments, dependent: :destroy
  has_many :ogps,     dependent: :destroy

  after_save :get_ogp

  def response
    {
      id: self.id,
      title: self.title,
      content: self.content,
      user_id: self.user_id,
      target_id: self.target_id,
      target_type: self.target_type,
      policy: self.policy,
      position: self.position,
      good: self.good,
      bad: self.bad,
      comments: []
    }
  end

  private
  def get_ogp
    Ogp.get_info(self, :topic)
  end
end
