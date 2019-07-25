# This migration comes from lead (originally 20190724110544)
class CreateLeadCampaigns < ActiveRecord::Migration[5.2]
  def change
    create_table :lead_campaigns , id: :uuid do |t|
      t.string :name
      t.string :location

      t.timestamps
    end
  end
end
