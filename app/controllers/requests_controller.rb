# frozen_string_literal: true

# comment for rubobp to work
class RequestsController < ApplicationController
  before_action :set_request, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]
  before_action :buyer_user, only: [:destroy]
  before_action :owner_user, only: [:change_state]

  # GET /requests or /requests.json
  def index
    @requests = Request.all
  end

  # GET /requests/1 or /requests/1.json
  def show; end

  # GET /requests/new
  def new
    @request = Request.new
  end

  # GET /requests/1/edit
  def edit; end

  # POST /requests or /requests.json
  def create
    @request = Request.new(request_params)

    respond_to do |format|
      if @request.save
        format.html { redirect_to requests_path, notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1 or /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1 or /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def buyer_user
    @request = Request.all.find_by(id: params[:id])

    redirect_to requests_path, notice: 'You are not Authorized' if @request.nil?
  end

  def owner_user
    @request = Request.all.find_by(id: params[:id])

    redirect_to requests_path, notice: 'You are not Authorized' if @request.nil?
  end

  def change_state
    @request = Request.all.find_by(id: params[:id])
    @request.state = params[:new_state]
    @request.save
    case @request.state
    when 'Rejected'
      redirect_to requests_path, notice: 'Succesfully Updated'
    when 'Accepted'
      @chat = Chat.create(post_id: @request.post.id, request_id: @request.id)
      user1 = User.find(params[:uid1])
      user2 = User.find(params[:uid2])
      @chat.users.append(user1)
      @chat.users.append(user2)
      redirect_to chats_show_path, notice: 'Succesfully Updated'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_request
    @request = Request.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def request_params
    @request = Request.new
    params.permit(:buyer_id, :owner_id, :state, :chid, :post_id, :reviewed_own, :reviewed_buy, :viewed)
  end
end
