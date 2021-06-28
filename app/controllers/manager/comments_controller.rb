module Manager
  class CommentsController < BaseController
    before_action :set_client
    before_action :set_project

    def new; end

    def create
      @comment = @project.comments.new(comment_params)

      respond_to do |format|
        if @comment.save
          format.html { [:manager, @client, @project] }
          format.js 
        else
          format.html { render 'new' }
          format.js 
        end
      end
    end 

    def destroy
      @comment = Comment.find(params[:id])

      if @comment.destroy
        redirect_to [:manager, @client, @project]
      end
    end

    private

    def set_client
      @client = Client.find(params[:client_id])
    end

    def set_project
      @project = @client.projects.find(params[:project_id])
    end

    def comment_params
      permitted_params = params.require(:comment).permit(:content) 
      permitted_params[:client_id] = @client.id

      permitted_params
    end
  end 
end

