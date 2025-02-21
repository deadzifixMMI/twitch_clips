class ClipsController < ApplicationController
  before_action :authenticate_user! # Empêche les non-connectés d'accéder aux clips
  before_action :set_clip, only: [ :edit, :update, :destroy ]
  before_action :authorize_user!, only: [ :edit, :update, :destroy ]

  def index
    @clips = Clip.all
  end

  def my_clips
    @clips = current_user.clips
  end

  def new
    @clip = Clip.new
  end

  def create
    @clip = current_user.clips.build(clip_params)

    if @clip.save
      redirect_to clips_path, notice: "Clip ajouté avec succès !"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @clip = current_user.clips.find(params[:id])

    if @clip.update(clip_params)
      redirect_to clips_path, notice: "Clip mis à jour !"
    else
      render :edit
    end
  end

  def destroy
    Rails.logger.debug "Suppression du clip ID: #{@clip.id}"
    @clip.destroy
    redirect_to my_clips_path, alert: "Clip supprimé !"
  end


  private

  def set_clip
    @clip = Clip.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to my_clips_path, alert: "Ce clip n'existe pas ou a déjà été supprimé."
  end


  def authorize_user!
    redirect_to my_clips_path, alert: "Action non autorisée !" unless @clip.user == current_user
  end

  def clip_params
    params.require(:clip).permit(:title, :video)
  end
end
