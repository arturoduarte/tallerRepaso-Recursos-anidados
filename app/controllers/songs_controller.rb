class SongsController < ApplicationController
	before_action :set_playlist, only: [:create,:destroy]
	def create
		@song = Song.new(songs_params)		
		@song.playlist = @playlist

		@song.save
		
		redirect_to @playlist, notice: 'La Canción se ha creado con éxito'
	end

	def destroy
		song = Song.find(params[:id])
		song.destroy
		
		redirect_to @playlist, notice: 'La canción se ha eliminado con éxito'
	end
	
	private
		def songs_params
			params.require(:song).permit(:artist, :name)
		end
		
		def set_playlist
			@playlist = Playlist.find(params[:playlist_id])
		end
end
