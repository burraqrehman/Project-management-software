module Manager
  class ProjectsController < BaseController

    before_action :authenticate_user!, except: %i[index show]
    before_action :set_project, only: %i[show edit update destroy]
    
    def index
      @projects = Project.all.order("created_at ASC")
    end
   
    def show; end  

    def new 
      @project = current_user.projects.build
    end

    def create
      @project = current_user.projects.build(project_params)

      if @project.save
        redirect_to [:manager, @project], notice: "Project was successfully created."
      else
        render 'new'
      end
    end

    def edit; end

    def update
      if @project.update(project_params)
        redirect_to [:manager, @project], notice: "Project was successfully created."
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
end
