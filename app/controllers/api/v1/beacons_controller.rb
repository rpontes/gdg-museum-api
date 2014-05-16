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

    museum = Museum.where("lower(uuid) = ?", uuid.downcase).first

    error = false

    if !museum.nil?
      region = museum.regions.where(major: major).first

      if !region.nil?
        art = region.arts.where(minor: minor).first
      else
        error = true
      end
    else
      error = true
    end

    if error
      render json: { error: "Não encontrado" }, status: 422
    else
      render json: art, status: :ok
    end

  end
end

