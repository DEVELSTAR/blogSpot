class Like < ApplicationRecord
  belongs_to :user
  belongs_to :article, optional: true
  belongs_to :comment, optional: true
end