class CollaboratorsController < ApplicationController
  def new
    @users = User.all
    @users.delete(current_user)
    @collaborator = Collaborator.new
    @wiki = Wiki.find(params[:wiki_id])
  end

  def create
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = @wiki.collaborators.build(collaborator_params)
    
    if @collaborator.save
      flash[:notice] = "Successfully added collaborator."
    else
      flash[:notice] = "There was an error."
    end

    redirect_to action: :new
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])
    @wiki = Wiki.find(params[:wiki_id])

    if @collaborator.destroy
      flash[:notice] = "Collaborator was successfully removed."
      redirect_to action: :new
    else
      flash[:notice] = "Collaborator could not be removed."
    end
  end

  private 

  def collaborator_params
      params.require(:collaborator).permit(:user_id)
  end

end
