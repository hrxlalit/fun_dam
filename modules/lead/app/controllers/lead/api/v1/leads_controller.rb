require_dependency "lead/application_controller"

module Lead
  class Api::V1::LeadsController < ApplicationController

      def index
          @leads = Lead.all
          render :json  => {
              :response_message => "Leads fetch successfully.",
              :response_code => 200,
              :leads => @leads,
              :leads_count => @leads.count
          }
      end

      def create
          # binding.pry
          return render :json  => { :response_message => "Campaign must exist.",:response_code => 404 } unless params[:id].present?   
          @campaign = Campaign.find_by(id: params[:id])
          
          return render :json  => {:response_message => "Campaign must exist.",:response_code => 404} unless @campaign
          
              @lead = @campaign.leads.new(lead_params)
              if @lead.save!
                  render :json  => {
                  :response_message => "Data saved successfully.",
                  :response_code => 201,
                  :leads => @lead
              }
              else
                  render :json  => {
                  :response_message => "Something went wrong, please try again later.",
                  :response_code => 501
              }
              end
      end

      def get_campaigns
          @campaigns = Campaign.all
          render :json  => {
              :response_message => "Campaigns fetch successfully.",
              :response_code => 200,
              :campaigns => @campaigns,
              :campaigns_count => @campaigns.count
          }
      end

      def get_countries
          @countries = CS.countries
          @countries.delete(:COUNTRY_ISO_CODE)
          render :json  => {
              :response_message => "Countries fetch successfully.",
              :response_code => 200,
              :countries => @countries,
              :countries_count => @countries.count
          }
      end

      def get_states
          return render :json  => { :response_message => "Country code not provided.",:response_code => 404 } unless params[:country_code].present? 
          @states = CS.states(params[:country_code])
          render :json  => {
              :response_message => "States fetch successfully.",
              :response_code => 200,
              :states => @states,
              :states_count => @states.count
          }
      end
      

      private
      def lead_params
          # binding.pry
          # params[:lead][:campaign_id] = params[:id]
          params.require(:lead).permit(:campaign_id,:first_name,:middle_name,:last_name,:date_of_birth,:occupation,:comment,:telephone_res,:telephone_office,:mobile,:email,:skype_id,:twitter_id,:address_line1,:address_line2,:state,:country,:pin_code)
      end


  end
end
