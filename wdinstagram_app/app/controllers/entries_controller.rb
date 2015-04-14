class EntriesController < ApplicationController

before_action :find_entry, only: [:show, :edit, :update, :destroy]

	def index
		@entries = Entry.all
	end

	def show
	end

	def new
		@entry = Entry.new
	end

	def create
		@entry = Entry.new(entry_params)
		#we used .new to not immediately save and allow validations to work
		if @entry.save
			redirect_to @entry #rails magic to redirect to the artist show page
		else
			render :new
		end
	end

	def edit
	end

	def update
		@entry.update(entry_params)
		redirect_to @entry
	end

	def destroy
		@entry.destroy
		redirect_to entries_path
	end

	private

		def entry_params
			params.require(:entry).permit(:author, :photo_url)
		end

		def find_entry
			@entry = Entry.find(params[:id])
		end

end
