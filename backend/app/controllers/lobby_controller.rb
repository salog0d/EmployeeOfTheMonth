class LobbyController < ApplicationController

   # GET /lobbies
   def index
    @lobbies = Lobby.all
    render json: @lobbies
  end

  # GET /lobbies/:id
  def show
    @lobby = Lobby.find(params[:id])
    render json: @lobby
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Lobby not found' }, status: :not_found
  end

  # POST /lobbies
  def create
    @lobby = Lobby.new(lobby_params)

    if @lobby.save
      render json: @lobby, status: :created
    else
      render json: @lobby.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lobbies/:id
  def update
    @lobby = Lobby.find(params[:id])

    if @lobby.update(lobby_params)
      render json: @lobby
    else
      render json: @lobby.errors, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Lobby not found' }, status: :not_found
  end

  # DELETE /lobbies/:id
  def destroy
    @lobby = Lobby.find(params[:id])
    @lobby.destroy
    head :no_content
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Lobby not found' }, status: :not_found
  end

  private

  # Strong parameters to permit only the trusted attributes
  def lobby_params
    params.require(:lobby).permit(:description)
  end
end

