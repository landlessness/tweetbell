class RingsController < ApplicationController
  def index
    @rings = Ring.all
  end

  def show
    @ring = Ring.find(params[:id])
  end

  def new
    @ring = Ring.new
  end

  def create
    @ring = Ring.new(params[:ring])
    if @ring.save
      redirect_to @ring, :notice => "Successfully created ring."
    else
      render :action => 'new'
    end
  end

  def edit
    @ring = Ring.find(params[:id])
  end

  def update
    @ring = Ring.find(params[:id])
    if @ring.update_attributes(params[:ring])
      redirect_to @ring, :notice  => "Successfully updated ring."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @ring = Ring.find(params[:id])
    @ring.destroy
    redirect_to rings_url, :notice => "Successfully destroyed ring."
  end
end
