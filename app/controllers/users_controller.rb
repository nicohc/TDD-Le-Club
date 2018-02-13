class UsersController < ApplicationController

  def home
  end

  def index
    @Users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if  @user.save
      log_in @user
      flash[:success] = "Bienvenue, Vous êtes bien inscrits." #Permet d'afficher une pop-up de confirmation de l'inscription.
      redirect_to @user  #Si la création du nouveau profil est bien réalisée, alors on fait afficher le profil crée via la fonction SHOW
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end



  private
    def user_params
      params.require(:user).permit(:firstname, :lastname, :email, :user_id )
    end



end
