class Notification < ApplicationRecord
  validates :user_id, presence: true
  validates :notification_type, presence: true

  belongs_to :user

  def response
    {
      id: self.id,
      user_id: self.user_id,
      notification_type: self.notification_type,
      target_id: self.target_id,
      content: self.content,
      opened: self.opened
    }
  end

  def self.new_comment(comment)
    topic = comment.topic
    # 自分の投稿に対するコメントは通知しない
    if topic.user_id != comment.user_id
      notification = self.new
      notification.notification_type = "comment"
      notification.user_id   = topic.user_id
      notification.target_id = comment.topic_id
      notification.content   = "#{comment.user.name}さんがあなたの投稿にコメントしました。"
      notification.save
    end
  end
end
