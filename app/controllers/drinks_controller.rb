class DrinksController < ApplicationController






	def index
		#will have a view template
		@drinks = Drink.all.order("created_at DESC")
	end






	def show #display individual records - sort of a detailed view
		#will have a view template
		@drink = Drink.find(params[:id])
	end






	def new #display form for the new record
		#will have a view template
		@drink = Drink.new
	end






	def create #save new record
		#will not have a view template. It will save and redirect somewhere else
		@drink = Drink.new(allowed_params)
		if @drink.save
			redirect_to drinks_path
		else
			render "new"
		end
	end






	def edit #display form with existing records
		#will have a view template
		@drink = Drink.find(params[:id])
	end





	def update #save changes
		#will not have a view template. It will save and redirect somewhere else
		@drink = Drink.find(params[:id])
		if @drink.update_attributes(allowed_params)
			redirect_to drinks_path
		else
			render "new"
		end
	end






	def destroy
		#will not have a view template. It will delete and redirect somewhere else
		@drink = Drink.find(params[:id])
		@drink.destroy
		redirect_to drinks_path
	end






	private
	def allowed_params
		params.require(:drink).permit(:name, :size)
	end





end
