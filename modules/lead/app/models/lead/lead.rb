module Lead
  class Lead < ApplicationRecord
    belongs_to :campaign, optional: :true, :class_name => "Campaign"
    enum occupation: ["Service", "Self Employed", "Business","Retired","Housewife","Student","Others"]
  end
end
