class ProjectsController < ApplicationController

	before_action :set_project, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@projects = Project.all.order("created_at ASC")
	end

	def show
		@comments = Comment.where(project_id: @project)
	end

	def new 
		@project = current_user.projects.build
	end

	def create
		@project = current_user.projects.build(project_params)

		if @project.save
			redirect_to @project
		else
			render 'new'
		end
	end

	def edit
		
	end

	def update
		if @project.update(project_params)
			redirect_to @project
		else
			render 'edit'
		end
	end

	def destroy
		@project.destroy
		redirect_to root_path
	end

	private 

	def set_project
		@project = Project.find(params[:id])
	end

	def project_params
		params.require(:project).permit(:name, :documentation, :project_cost, :time_tracking, :image)
	end
end
