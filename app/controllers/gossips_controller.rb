class GossipsController < ApplicationController
  before_action :require_login

  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find_by_id(params[:id])
    if @gossip
      @comment = Comment.new
      @comments = @gossip.comments
    else
      redirect_to gossips_path, alert: "Le potin que vous essayez d'afficher n'existe pas."
    end
  end
  
  def new
    @gossip = Gossip.new
    if current_user
      @user_id = current_user.id
    else
      redirect_to new_session_path, notice: "Vous devez vous connecter pour publier un potin."
    end
  end

  def create
    @gossip = current_user.gossips.build(gossip_params)
    if @gossip.save
      flash[:success] = "Gossip created"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(gossip_params)
      redirect_to gossips_path
    else
      render 'edit'
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossips_path
  end

  def user_gossips
    @user = User.find(params[:user_id])
    @gossips = @user.gossips
  end
   
  private

  def gossip_params
    params.require(:gossip).permit(:title, :content)
  end

  def require_login
    unless logged_in?
      flash[:danger] = "Please log in"
      redirect_to new_user_path
    end
  end
  
  def logged_in?
    !current_user.nil?
  end

end
