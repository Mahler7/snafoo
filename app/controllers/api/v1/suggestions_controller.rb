class Api::V1::SuggestionsController < ApplicationController
  
  def index
    api_key = ENV["API_KEY"]
    @snacks = Unirest.get("https://api-snacks.nerderylabs.com/v1/snacks?ApiKey=" + api_key).body 
  end

  def new
    api_key = ENV["API_KEY"]
    @snacks = Unirest.get("https://api-snacks.nerderylabs.com/v1/snacks?ApiKey=" + api_key).body 
    @suggestion = Suggestion.new
  end

  def create
    api_key = ENV["API_KEY"]
    @suggestion = Unirest.post("https://api-snacks.nerderylabs.com/v1/snacks?ApiKey=" + api_key,
      headers:{ "Accept" => "application/json" }, 
      parameters: { 
        name: params[:name], 
        optional: params[:optional], 
        purchase_location: params[:purchase_location],
        purchase_count: params[:purchase_count],
        last_purchase_date: params[:last_purchase_date]
      }
    ).body

    render :show
  end

  def show

  end

end
