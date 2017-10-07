class Topic < ApplicationRecord
  enum policy: POLICY_PARAMS

  validates :user_id, presence: true
  validates :title,   presence: true
  validates :content, presence: true

  has_many :comments, dependent: :destroy
  has_many :ogps,     dependent: :destroy

  after_save :set_articles

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
      created_at: self.created_at.strftime("%Y年%-m月%-d日 %H:%M"),
      good: self.good,
      bad: self.bad,
      comments: [],
      articles: self.articles
    }
  end

  def articles
    (@articles || []).map(&:response)
  end

  private
  def set_articles
    @articles = Ogp.get_info(self, :topic)
  end
end
