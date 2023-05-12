class GossipsController < ApplicationController
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
  end

  def create
    @gossip = Gossip.new(gossip_params)
    if @gossip.save
      redirect_to gossips_path
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
  private

  def gossip_params
    params.require(:gossip).permit(:title, :content)
  end
end
