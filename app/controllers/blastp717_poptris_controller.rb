class Blastp717PoptrisController < ApplicationController
  before_action :signed_in_user
  before_action :file_defined, only: :create
  before_action :table_exists, only: :index

  def new

  end

  def create
    Blastp717Poptri.delete_all()
    Blastp717Poptri.import(params[:file])
    redirect_to blastp717_poptris_path, notice: "upload successful"
  end

  def index
    params[:sort] ||= Blastp717Poptri.column_names.include?(params[:sort]) ? params[:sort] : "percent_identity"
    params[:direction] ||= %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    @rows = Blastp717Poptri.order(params[:sort] + " " + params[:direction]).limit(20)
  end

  private

  def file_defined
    redirect_to new_blastp717_poptri_path, notice: "select a file" unless params[:file]
  end

  def table_exists
    redirect_to new_blastp717_poptri_path, notice: "no data, upload a file" unless Blastp717Poptri.exists?
  end

end