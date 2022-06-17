class ArchivesController < ApplicationController
  def show
    @customer = Archive.find(params[:id])
  end

  def destroy
    @customer = Archive.find(params[:id])
    @customer.destroy
    redirect_to company_reports_url, notice: "Archived data deleted."
  end
end