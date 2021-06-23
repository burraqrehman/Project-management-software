class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project

  def create
    @comment = @project.comments.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to project_path(@project) }
        format.js 
      else
        format.html { render 'new' }
        format.js 
      end
    end
  end 

  def destroy
    @comment = Comment.find(params[:id])
      @project = Project.find(params[:project_id])
        @comment.destroy
    redirect_to @project
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def comment_params
    permitted_params = params.require(:comment).permit(:content)

    permitted_params[:user_id] = current_user.id

    permitted_params
  end
end



