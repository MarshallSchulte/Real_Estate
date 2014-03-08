class ListingsController < ApplicationController
before_action :signed_in_user, only: [:create, :update, :destroy]

def home
	@q = Listing.search(params[:q])
    @listings = @q.result(distinct: true)
	Rails.logger.debug("[debug] : Homey" );
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @listings }
    end
end

def index
	@q = Listing.search(params[:q])
    @listings = @q.result(distinct: true)
Rails.logger.debug("[debug] : L 1" );
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @listings }
    end
  end

  def new
  Rails.logger.debug("[debug] : L 2" );
    @listing = Listing.new
	@gallery = @listing.build_gallery
	@listing.token = @listing.generate_token
	@picture = @listing.gallery.pictures.build
	@pictures = []
	
	respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @listing }
    end
  end
  
  def create
  Rails.logger.debug("[debug] : L 3" );
    @listing = Listing.new(listing_params)
	@gallery = @listing.build_gallery
	@pictures = Picture.where(:listing_token => @listing.token)
    @gallery.pictures << @pictures
	
	unless @listing.gallery.pictures.empty?
	Rails.logger.debug("[debug] : Lempty" );
	  @listing.cover = @gallery.pictures.first.id
	end
	
    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render json: @listing, status: :created, location: @listing }
      else
	    Rails.logger.debug("[debug] : This sucks" );
		flash[:error] = 'Something went wrong'
        format.html { render action: "new" }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def show
  Rails.logger.debug("[debug] : L 4" );
    @listing = Listing.find(params[:id])
	@gallery = @listing.gallery
	@picture = @gallery.pictures.build
	@pictures = Picture.where(:listing_id => @listing.id)
	
    respond_to do |format|
	
      format.html # show.html.erb
      format.json { render json: @listing }
	  
	end
	Rails.logger.debug("[debug] : Listing" );
  end
  
  def edit
  Rails.logger.debug("[debug] : L 5" );
	@listing = Listing.find(params[:id])
	@gallery = @listing.gallery
	@picture = @listing.gallery.pictures.build
  end
  
  def update
	@listing = Listing.find(params[:id])
Rails.logger.debug("[debug] : L 6" );
	respond_to do |format|
      if @listing.update_attributes(listing_params)
        format.html { redirect_to @listing, notice: 'Gallery was successfully updated.' }
        format.json { head :no_content }
      else
	    flash[:now] = "For some reason, that didn't work."
        format.html { render action: "edit" }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
  Rails.logger.debug("[debug] : L 7" );
	Listing.find(params[:id]).destroy
	flash[:success]
	redirect_to listings_path
  end
  
  private
  
    def listing_params
	  params.require(:listing).permit!
	end

end
