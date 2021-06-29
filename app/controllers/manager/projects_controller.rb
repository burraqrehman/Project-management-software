module Manager
  class ProjectsController < BaseController
    before_action :set_client
    before_action :set_project, only: %i[show edit update destroy]
    
    def index
      @projects = Project.order("created_at ASC")
    end
   
    def show; end  

    def new 
      @project = Project.new
    end

    def create
      @project = @client.projects.new(project_params)

      if @project.save
        redirect_to [:manager, @client, @project], notice: "Project was successfully created."
      else
        render :new
      end
    end

    def edit; end

    def update
      if @project.update(project_params)
        redirect_to [:manager, @client, @project], notice: "Project was successfully created."
      else
        render :edit
      end
    end

    def destroy
      if @project.destroy

        flash[:notice] = "This project destroyed successfully"
        redirect_to [:manager, @client, @project]
      else
        flash[:notice] = "This Project could not be destroyed"
    end

    private 

    def set_client
      @client = Client.find(params[:client_id])
    end

    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :documentation, :project_cost, :time_tracking, :image)
    end
  end
end
