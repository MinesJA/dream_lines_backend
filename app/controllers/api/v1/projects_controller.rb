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

  def create_project
    user = User.find(users_params[:id])

    if(user)
      @project = user.create_new_project(mp_id: user_parms[:mp_id])
      render json: @project
    else
      render json: {error: "No user found"}
    end
  end


  def add_children
    user = User.find(users_params[:id])

    if(user)
      @step = user.add_project_children(mp_id: user_params[:mp_id], parent_id: user_params[:parent_id])
      render json: @step
    else
      render json: {error: "No user found"}
    end
  end


  def add_child

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
