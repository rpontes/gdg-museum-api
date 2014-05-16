class Api::V1::BeaconsController < ApiController

  respond_to :json

  def index
    @beacons = Beacon.all
    render json: @beacons, status: :ok
  end

  def show
    @beacon = Beacon.find(params[:id])
    render json: @beacon, status: :ok
  end

  def search
    uuid = params["uuid"]
    major = params["major"]
    minor = params["minor"]

    museum = Museum.where(uuid: uuid).first
    region = museum.regions.where(major: major).first
    art = region.arts.where(minor: minor).first

    render json: art, status: :ok
  end
end

