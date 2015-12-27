class AddressesController < ApplicationController
	def index
		@seller=Seller.find(params[:seller_id])
		@addresses=@seller.addresses
	end

	def new
		@seller=Seller.find(params[:seller_id])
		@address=@seller.addresses.new
	end

	def create
		@seller=Seller.find(params[:seller_id])
		@address=@seller.addresses.new(address_params)
		if @address.save
			redirect_to seller_addresses_path(@seller)
		else
			render :new
		end

	end

	def show
		@seller=Seller.find(params[:seller_id])
		@address=@seller.addresses.find(params[:id])
	end

	def edit
		@seller=Seller.find(params[:seller_id])
		@address=@seller.addresses.find(params[:id])


	end

	def update
		@seller=Seller.find(params[:seller_id])
		@address=@seller.addresses.find(params[:id])
		@address.update(address_params)
		if @address.valid?
			redirect_to seller_address_path(@seller)

		else
			render :edit
		end
	end

	def destroy
		@seller=Seller.find(params[:seller_id])
		@address=@seller.addresses.find(params[:id])
		@address.destroy
		redirect_to seller_addresses_path(@seller)
	end	


	private
	def address_params

		params.require(:address).permit(:address1)
	end


end