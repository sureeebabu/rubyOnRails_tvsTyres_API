class Api::V1::UsersController < ApplicationController
  respond_to :json

  # def index
  #   result = User.all    
  #   # result = User.all               # Return All Record
  #   # result = User.first             # Return Top 1 Record
  #   # result = User.first(2)          # Return First 2 Record
  #   # result = User.last              # Return last one Record
  #   # result = User.last(2)           # Return last Two  Record
  #   # result = User.find([7,8])       # similar to SQL IN 
  #   # result = User.limit(3)          # Top record or Limit
  #   # result = User.offset(2)         # Avoid 2 record
  #   # result = User.order('id')       # Order By Desc
  #   # result = User.order('id DESC')  # Order By Desc
  #   # result = User.select('id, email')
  #   if result.exists?
      
  #     result.map{|e| e[:created_at] = e[:created_at].to_date.strftime("%d %B %Y"); e}

  #     render json: { status: 'Success', isData: true , data: result}, status: 201   
  #   else
  #     render json: { status: 'NoRecord',isData: false, data: []},status: 201   
  #   end    
  # end
  def index
    # result = User.all.to_a
    # result = result.map{|e| e[:created_at] = e[:created_at].to_date.strftime("%d %B %Y"); e}
    # render json: { status: 'Success', isData: true , data: result }, status: 201 
    result = User.order('id') 
    if result.exists?
      # result = result.map{|e| e[:created_at] = e[:created_at].to_date.strftime("%d %B %Y"); e}
      result = result.map{|e| e[:isactive] = ApplicationController.chkIsActive((e[:isactive])); e}
      render json: { status: 'Success', isData: true , data: result }, status: 201 
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
