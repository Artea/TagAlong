class EventsController < ApplicationController
  before_action :set_event, only: [:remove, :accept, :show, :edit, :update, :destroy]
  before_action :set_attendee, only: [:accept, :remove, :show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
    @attendees = Attendee.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @determine = current_user.attendees.include? @attendee
  end

  def accept
    @event.users << current_user
    render nothing: true
  end

  def remove
    @user = current_user
    @user.events.delete(@event)
    render nothing: true
  end

  # GET /events/new
  def new
    @event = current_user.events.build
    @attendee = current_user.attendees.build
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = current_user.events.build(event_params)
    @attendee = current_user.attendees.build(attendee_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @event }
      else
        format.html { render action: 'new' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @attendee.destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end   
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    def set_attendee
      @attendee = Attendee.find(params[:id])
    end

    def correct_user
      @event = current_user.events.find_by(id: params[:id])
      redirect_to events_path, notice: 'Not authorized to edit this event' if @event.nil?
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:description, :name, :when, :where)
    end

    def attendee_params
      params[:attendee]
    end
end
