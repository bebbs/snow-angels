class ClientsController < ApplicationController

  def index
    if params[:search]
      @clients = Client.search(params[:search]).order('last_name ASC')
    else
      @clients = Client.all.order('last_name ASC')
    end
  end

  def new
    @client = Client.new
  end

  def create
    Client.create(client_params)
    flash[:notice] = "Client successfully added"
    redirect_to '/pages'
  end

  def show
    @client = Client.find(params[:id])
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    @client.update(client_params)
    redirect_to '/pages'
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    flash[:notice] = 'Client deleted successfully'
    redirect_to '/pages'
  end

  private

  def client_params
    params.require(:client).permit(:name, :last_name, :address, :postcode, :phone)
  end

end
