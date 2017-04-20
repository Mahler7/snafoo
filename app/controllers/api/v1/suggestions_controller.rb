class Api::V1::SuggestionsController < ApplicationController
  
  def index
    api_key = ENV["API_KEY"]
    @snacks = Unirest.get("https://api-snacks.nerderylabs.com/v1/snacks?ApiKey=" + api_key).body 
    @snacks << { "name" => "Other" }
    @suggestions = Suggestion.all
    @suggestion = Suggestion.new
  end

  def create
    api_key = ENV["API_KEY"]
    Unirest.post("https://api-snacks.nerderylabs.com/v1/snacks?ApiKey=" + api_key,
      headers:{ "Accept" => "application/json" }, 
      parameters: { 
        name: params[:name], 
        optional: params[:optional], 
        purchase_location: params[:purchase_location],
        purchase_count: params[:purchase_count],
        last_purchase_date: params[:last_purchase_date]
      }
    ).body

    @suggestions = Suggestion.all
    @suggestion = Suggestion.new(suggestion_params)
    
    if @suggestion.save
      respond_to do |format|
        format.html
        format.js { render "create.js.erb" }
      end
    else
      respond_to do |format|
        format.html
        format.js { render "suggestionErrors.js.erb" }
      end
    end
  end

  private

    def suggestion_params
      params.require(:suggestion).permit(
        :name,
        :optional,
        :purchase_location,
        :purchase_count,
        :last_purchase_date
      )
    end

end