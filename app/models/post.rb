class Post < ApplicationRecord
  validates :title, length: { in: 5..50 }
  validates :body, length: { in: 20..200 }, if: :body_present?

  def invalid?
    !valid?
  end

  def body_present?
    body.present?
  end

  def live?
    live
  end
end
