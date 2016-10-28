class CommentsController < ApplicationController
  def create
    @job = Job.find(comment_params[:job_id])
    @comment = @job.comments.create(comment_params)
    redirect_to :back
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :job_id)
  end
end
