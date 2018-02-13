class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(id: params[:session][:user_id])
    if user == nil
      flash.now[:danger] = "Id inexistant"
      render 'new'
      # Log the user in and redirect to the user's show page.
    else
      log_in user
      flash[:success] = "Bienvenue #{user.id}, Vous êtes bien connectés" #Permet d'afficher une pop-up de confirmation de l'inscription.
      redirect_to user
    end
  end

  def destroy
    log_out
    flash[:success] = "Vous êtes bien déconnectés" #Permet d'afficher une pop-up de confirmation de l'inscription.
    redirect_to root_url
  end

end
