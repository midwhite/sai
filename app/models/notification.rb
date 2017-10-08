class Notification < ApplicationRecord
  validates :user_id, presence: true
  validates :notification_type, presence: true

  belongs_to :user

  def response
    {
      id: self.id,
      user_id: self.user_id,
      type: self.notification_type,
      target_id: self.target_id,
      content: self.content,
      opened: self.opened,
      created_at: self.created_at.strftime("%Y年%-m月%-d日 %H:%M")
    }
  end

  def self.new_comment(comment)
    topic = Topic.find(comment.topic_id).includes(:comments)
    user = topic.user
    # 自分の投稿に対するコメントは通知しない
    if topic.user_id != comment.user_id
      # トピック投稿者への通知
      notification = self.new
      notification.notification_type = "comment"
      notification.user_id   = topic.user_id
      notification.target_id = comment.topic_id
      notification.content   = "#{user.name}さんがあなたの投稿にコメントしました。"
      notification.save
    end
    # 他にコメントした人への通知
    topic.comments.each do |other_comment|
      if other_comment.user_id != comment.user_id && other_comment.id != comment.id
        other_noticitation = self.new
        other_noticitation.notification_type = "comment"
        other_noticitation.user_id   = other_comment.user_id
        other_noticitation.target_id = comment.topic_id
        other_noticitation.content   = "あなたがコメントした投稿に#{user.name}さんもコメントしました。"
        other_noticitation.save
      end
    end
  end
end
