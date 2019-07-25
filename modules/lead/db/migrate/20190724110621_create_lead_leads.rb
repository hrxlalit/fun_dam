class CreateLeadLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :lead_leads, id: :uuid do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.datetime :date_of_birth
      t.integer :occupation
      t.string :comment
      t.string :telephone_res
      t.string :telephone_office
      t.string :mobile
      t.string :email
      t.string :skype_id
      t.string :twitter_id
      t.string :address_line1
      t.string :address_line2
      t.string :state
      t.string :country
      t.string :pin_code
      t.uuid :campaign_id

      t.timestamps
    end
  end
end
