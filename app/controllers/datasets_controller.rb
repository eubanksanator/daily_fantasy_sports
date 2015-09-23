class DatasetsController < ApplicationController
  def index
    @datasets = Dataset.all
  end

  def new
    @dataset = Dataset.new
  end

  def create
    @dataset = Dataset.new(dataset_params)

    @dataset.salaries_filename = dataset_params[:salaries].original_filename if dataset_params[:salaries].present?
    @dataset.rankings_filename = dataset_params[:rankings].original_filename if dataset_params[:rankings].present?

    if @dataset.save
      redirect_to datasets_path, notice: "Datasets imported successfully!"
    else
      redirect_to root_path, notice: "Must upload both a Salary and Rankings dataset!"
    end
  end

  private

  def dataset_params
    params.require(:dataset).permit(:salaries_filename, :rankings_filename, :salaries, :rankings)
  end
end
