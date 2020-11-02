class Post < ApplicationRecord
  validates :title, length: { in: 5..50 }
  validates :body, length: { in: 20..200 }

  default_scope { order(title: :asc) }

  def live?
    live
  end

  def invalid?
    !valid?
  end
end
