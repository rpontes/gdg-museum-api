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
end

