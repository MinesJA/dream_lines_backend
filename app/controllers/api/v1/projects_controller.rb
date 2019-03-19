class Api::V1::ProjectsController < ApplicationController



  def create
    user = User.find(project_params[:user_id])

    if(user)
      @project = user.create_new_project(mp_id: project_params[:mp_id], )
      render json: @project
    else
      render json: {error: "No user found"}
    end

  end



  def add_step

  end

  def fetch_children
    @project = Project.find(project_params[:mp_id])

    if(@project)
      @project.get_children

    else

    end

  end




  private

  def project_params
    params.permit(:id, :mp_id, :status, :user_id, :head, :parent_id)
  end
end
