class Api::V1::UsersController < ApplicationController
  respond_to :json
  # skip_before_filter  :verify_authenticity_token
  skip_before_action :verify_authenticity_token
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
    result = User.order('id desc') 
    if result.exists?
      # result = result.map{|e| e[:created_at] = e[:created_at].to_date.strftime("%d %B %Y"); e}
      # result = result.map{|e| e[:isactive] = ApplicationController.chkIsActive((e[:isactive])); e}
      # render json: { status: 'Success', isData: true, data: result.as_json(only: [:id, :name, :email], methods: [:name]) }, status: 201

      jsonformat = result.as_json(include: :userdetails)

      render json: { status: 'Success', isData: true , data: jsonformat }, status: 201 

      #render json: { status: 'Success', isData: true , data: result }, status: 201 
    else
      render json: { status: 'NoRecord',isData: false, data: []},status: 201   
    end    
    # @result = User.joins(:userdetails).select('id', 'name', 'email')    
    # respond_to do |format|
    #   format.json { 
    #     render :json => @result.to_json( 
    #       { 
    #         :methods => [ :userdetails ] 
    #       },
    #     )
    #   }
    # end

  end
 

  def mymethod
    result = User.select('id, email')
    render json: { status: 'Success', data: result}
  end

  def getdatabyid
    id = params[:id]
    result = User.find(id)
    render json: { status: 'Success', isData: true , data: [result]}
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
    user = User.new(createuser_params) 
    if user.save 
      render json: { status: 'Success', msg: 'New User Added Successfully.'}
     # render json: user, status: 201
    else
     render json: { errors: user.errors}, status: 422
    end
   end
 

  def update
    user = User.find(params[:id])
    if user.update_attributes(updateuser_params)
      render json: { status: 'Success', msg: 'Update Successfully.'}
    else
      render json: { status: 'Failure', msg: 'Error .'}
    end
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      render json: { status: 'Success', msg: 'Deleted Successfully.'}
    else
      render json: { status: 'Failure', msg: 'Error .'}
    end
  end
  
  
  private

  def createuser_params
    params.require(:user).permit(:name, :email, :userimage, :isactive, :password, :password_confirmation)
  end

  def updateuser_params
    params.require(:user).permit(:name, :email, :userimage, :isactive)
  end
 

end
