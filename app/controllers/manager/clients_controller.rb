module Manager  
  class ClientsController < BaseController
    before_action :set_client, only: %i[show edit update destroy]

    def index
      @clients = Client.all
    end

    def show; end

    def new
      @client = Client.new
    end

    def edit; end

    def create
      @client = Client.new(client_params)

      if @client.save
        
        redirect_to [:manager, @client], notice: "Client was successfully created."
      else
        render :new
      end
    end

    def update
      if @client.update(client_params)
        redirect_to [:manager, @client], notice: "Client was successfully update"
      else
        render :edit
      end
    end

    def destroy
      if @client.destroy
        flash[:notice] = "This Client destroyed successfully"
        redirect_to [:manager, @client]
      else
        flash[:notice] = "This client could not be destroyed"
      end
    end

    private

      def set_client
        @client = Client.find(params[:id])
      end

      def client_params
        params.require(:client).permit(:name, :contact, :email, :address, :profession)
      end
  end
end
