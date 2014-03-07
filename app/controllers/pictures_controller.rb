class PicturesController < ApplicationController
before_action :signed_in_user, only: [:create, :update, :destroy]
  # GET /pictures
  # GET /pictures.json
  def index

    @gallery = Gallery.find(params[:gallery_id])

    @pictures = @gallery.pictures

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pictures }
    end
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
    @picture = Picture.find(params[:id])
	@gallery = Gallery.find(params[:gallery_id])
	@listing = Picture.find(params[:listing_id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @picture }
    end
  end

  # GET /pictures/new
  # GET /pictures/new.json
  def new
    @gallery = Gallery.find(params[:gallery_id])
    @picture = @gallery.pictures.build
	@picture.gallery_id = @gallery.id
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @picture }
    end
  end

  # GET /pictures/1/edit
  def edit
  
	@listing = Listing.find(params[:listing_id])
  
    @gallery = Gallery.find(params[:gallery_id])

    @picture = @gallery.pictures.find(params[:id])
	
    # @picture = Picture.find(params[:id])
  end

  # POST /pictures
  # POST /pictures.json
  def create
    p_attr = picture_params
    p_attr[:image] = p_attr[:image].first if p_attr[:image].class == Array
    if params[:gallery_id]
	  Rails.logger.debug("[debug] : hey" );
      @gallery = Gallery.find(params[:gallery_id])
	  Rails.logger.debug("[debug] : hey2" );
      @picture = @gallery.pictures.build(p_attr)
	  Rails.logger.debug("[debug] : hey3" );
    else
      @picture = Picture.new(p_attr)
    end

    if @picture.save
      respond_to do |format|
        format.html {
          render :json => [@picture.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json {
          render :json => [@picture.to_jq_upload].to_json
        }
      end
    else
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end

  # PUT /pictures/1
  # PUT /pictures/1.json
  def update

	@listing = Listing.find(params[:listing_id])
  
    @gallery = Gallery.find(params[:gallery_id])

    @picture = @gallery.pictures.find(params[:id])

    respond_to do |format|
      if @picture.update_attributes(picture_params)
        format.html { redirect_to @listing, notice: 'Picture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @gallery = Gallery.find(params[:gallery_id])
    @picture = @gallery.pictures.find(params[:id])
    @picture.destroy

    respond_to do |format|
      format.html { redirect_to gallery_pictures_url }
      format.js
    end
  end

  def make_default
    @picture = Picture.find(params[:id])
    @gallery = Gallery.find(params[:gallery_id])
	@listing = Listing.find(params[:listing_id])
	

    @listing.cover = @picture.id
    @listing.save

    respond_to do |format|
      format.js
    end
  end
  
    private
  
	def picture_params
		params.require(:picture).permit!
	end
  
end
