module Lead
  class Campaign < ApplicationRecord
    has_many :leads#, dependent: :destroy
  end
end
