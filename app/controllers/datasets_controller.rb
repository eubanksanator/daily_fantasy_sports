class DatasetsController < ApplicationController
  def index
    @datasets = Dataset.all
  end

  def show
    @dataset = Dataset.find(params[:id])
  end

  def new
    @dataset = Dataset.new
  end

  def create
    @dataset = PlayersLoader.new(Dataset.new(dataset_params))

    @dataset.dataset.salaries_filename = dataset_params[:salaries].original_filename if dataset_params[:salaries].present?
    @dataset.dataset.rankings_filename = dataset_params[:rankings].original_filename if dataset_params[:rankings].present?

    if @dataset.save
      redirect_to @dataset.dataset, notice: "Datasets imported successfully!"
    else
      redirect_to new_dataset_path, notice: "All form fields must be completed!"
    end
  end

  private

  def dataset_params
    params.require(:dataset).permit(:name, :salaries_filename, :rankings_filename, :salaries, :rankings)
  end
end
