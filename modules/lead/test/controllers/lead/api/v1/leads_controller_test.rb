require '../../../../test_helper'

module Lead
  class Api::V1::LeadsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    # test "the truth" do
    #   assert true
    # end

    setup do
      @lead =lead_leads(:one)
    end
    
    setup do
      @campaign =lead_campaigns(:one)
    end

    test "should get index" do
      get api_v1_leads_url
      assert_response :success
    end
  
    test "should create user" do
      assert_difference('Lead.count') do
        post api_v1_leads_url, params: { id: @campaign.id ,lead: { first_name: @lead.first_name,middle_name: @lead.middle_name,last_name: @lead.last_name,date_of_birth: @lead.date_of_birth,occupation: @lead.occupation,comment: @lead.comment,telephone_res: @lead.telephone_res,telephone_office: @lead.telephone_office,mobile: @lead.mobile,email: @lead.email,skype_id: @lead.skype_id,twitter_id: @lead.twitter_id,address_line1: @lead.address_line1,address_line2: @lead.address_line2,state: @lead.state,country: @lead.country,pin_code: @lead.pin_code } }
      end
  
      # assert_redirected_to user_url(User.last)
    end
  
    test "should get campaigns" do
      get get_campaigns_api_v1_leads_url
      assert_response :success
    end
  
    test "should get countries" do
      get get_countries_api_v1_leads_url
      assert_response :success
    end
  
    test "should get states" do
      post get_states_api_v1_leads_url
      assert_response :success
    end


  end
end
