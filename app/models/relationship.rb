class Relationship < ApplicationRecord

  # class_name: "Customer"でCustomerモデルを参照
  belongs_to :following, class_name: "Customer"
  belongs_to :follower, class_name: "Customer"

end
