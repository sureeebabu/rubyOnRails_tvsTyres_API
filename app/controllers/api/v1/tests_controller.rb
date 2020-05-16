class Api::V1::TestsController < ApplicationController
  def mymethod
    render json: User.all
  end

  def getdatabyid
    userID = params[:id]
    if User.exists?(userID)
      result = User.find(userID)
      jsonformat = result.as_json(:except => [:created_at, :updated_at], :include => { :userdetails => { :except => [:created_at, :updated_at]} }) # remove Dates from both user and userdetails
      render json: { status: 'Success', isData: true , data: jsonformat }, status: 201 
      #render json: { status: 'Success', isData: true , data: [result]}
    else
      render json: { status: 'NoRecord',isData: false, data: []},status: 201   
    end
  end
end
