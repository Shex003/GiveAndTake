class Trade < ApplicationRecord
  belongs_to :initiator, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  belongs_to :offered_item, class_name: 'Item'
  belongs_to :requested_item, class_name: 'Item'
end
