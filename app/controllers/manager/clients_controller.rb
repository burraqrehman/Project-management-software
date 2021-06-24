module Manager  
  class ClientsController < BaseController
    before_action :authenticate_user!
    before_action :set_client, only: %i[ show edit update destroy ]

    def index
      @clients = Client.all
    end

    def show; end

    def new
      @client = current_user.clients.build
    end

    def edit; end

    def create
      @client = current_user.clients.build(client_params)

      if @client.save
        redirect_to @client, notice: "Client was successfully created."
      else
        render :new
      end
    end

    def update
      if @client.update(client_params)
        redirect_to @client, notice: "Client was successfully update"
      else
        render :edit
      end
    end

    def destroy
      @client.destroy
      redirect_to @clients
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
