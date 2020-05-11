class Api::V1::UsersController < ApplicationController
  respond_to :json

  def index
    @result = User.all
    
    if @result.exists?
      render json: { status: 'Success', isData: true , data: @result}, status: 201   
    else
      render json: { status: 'NoRecord',isData: false, data: []},status: 201   
    end

    
  end

  def show
    userID = params[:id]
    if User.exists?(userID)
      result = User.find(userID)
      render json: { status: 'Success', isData: true , data: [result]}
    else
      render json: { status: 'NoRecord',isData: false, data: []},status: 201   
    end
  end

  def edit
  end

  def create
  end

  def update
  end

  def delete
  end
end
