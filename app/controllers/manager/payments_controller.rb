module Manager
	class PaymentsController < BaseController

		def new
			@payment = Payment.new
			@clients = Client.order(:created_at)
		end

		def create
			@payment = Payment.new(payments_params)

	    if @payment.save
	    	# flash[:notice] = "sdafgasdg"
	      redirect_to root_path
	    else
	      render :new
	    end
		end

		private

		def payments_params 
			params.require(:payment).permit(:payment, :client_id, :project_id)
		end
	end
end
