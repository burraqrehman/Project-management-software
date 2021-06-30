module Manager
	class PaymentsController < BaseController

		def new
			@payment = Payment.new
		end

		def create
			@payment = Payment.new

	    if @payment.save
	    	flash[:notice] = "sdafgasdg"
	       redirect_to manager_client_project_path
	    else
	      render :new
	    end
		end

		private

		def payments_params 
			params.require(:payment).permit(:payment)
		end
	end
end
