class RelationshipsController < ApplicationController
	def index
		@relationships = Relationship.all
	end

	def show
		redirect_to home_index_path
	end
	def new
		@relationship = Relationship.new
	end

	def create
		@relationship = Relationship.new(rel_params)
		if @relationship.save
			redirect_to home_index_path
		end
	end

	def destroy
		@relationship = Relationship.find(params[:id])
		if @relationship.destroy
			redirect_to home_index_path
		end
	end

	def rel_params
		params.require(:relationship).permit(:user_id, :ship_id)
	end
end
