class Topic < ApplicationRecord
  def response
    {
      id: self.id,
      title: self.title,
      content: self.content,
      user_id: self.user_id,
      target_id: self.target_id,
      target_type: self.target_type,
      policy_id: self.policy_id,
      position: self.position
    }
  end
end
