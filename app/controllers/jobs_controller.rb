class JobsController < ApplicationController
  def index
    @company = Company.find(params[:company_id])
    if params[:sort] == "interest"
      @jobs = @company.jobs.order(level_of_interest: :desc)
    else
      @jobs = @company.jobs
    end
    @contacts = @company.contacts
    @contact = Contact.new
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new()
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
    @comment = Comment.new
    @comments = @job.comments
  end

  def edit
    @job = Job.find(params[:id])
    @company = Company.find(params[:company_id])
  end

  def update
    @job = Job.find(params[:id])
    @company = Company.find(@job.company_id)
    if @job.update(job_params)
      flash[:success] = "You edited #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to company_jobs_path(@job.company_id, @job.id)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :category_id)
  end
end
