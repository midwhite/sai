class Comment < ApplicationRecord
  validates :user_id,  presence: true
  validates :topic_id, presence: true
  validates :content,  presence: true

  belongs_to :topic

  def response
    {
      id: self.id,
      content: self.content,
      user_id: self.user_id,
      topic_id: self.topic_id,
      position: self.position,
      reply_to: self.reply_to,
      created_at: self.created_at.strftime("%Y年%m月%d日 %H:%M")
    }
  end
end
