class SellersController < ApplicationController
	before_action :set_seller, only: ['show','edit','update','destroy']

	def index
		@sellers=Seller.all
		respond_to do |format|
			format.html
 			format.json { render :json => @sellers }
		end
	end

	def new
		@seller=Seller.new
	end

	def create
		@seller=Seller.new(seller_params)
		if @seller.save 
		  redirect_to sellers_path, notice: "Successfully created at #{@seller.created_at}"
		else
			render :new
		end
	end

    def show
		
	end

	def edit
		
	end

	def update
		
		@seller.update(seller_params)
		redirect_to seller_path(@seller), notice: "Successfully updated at #{@seller.updated_at.strftime('%B/ %d/ %y')}"
		# render :text =>'<pre>' + params.to_yaml and return
	end

	def destroy
        @seller.destroy
    	redirect_to sellers_path, notice: "Successfully Destroy"
	end

	def search
		if params[:name].present?
			@sellers = Seller.where("name LIKE ?",  "%#{params[:name]}%")
		else
			@sellers = ''
		end
	end


	private

	def set_seller
     @seller=Seller.find(params[:id])
	end

	def seller_params
		params.require(:seller).permit(:name,:price)
	end


end
