class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[ show edit update destroy ]

  # GET /test_passages or /test_passages.json
  def index
    @test_passages = TestPassage.all
  end

  # GET /test_passages/1 or /test_passages/1.json
  def show
  end

  # GET /test_passages/new
  def new
    @test_passage = TestPassage.new
  end

  # GET /test_passages/1/edit
  def edit
  end

  # POST /test_passages or /test_passages.json
  def create
    @test_passage = TestPassage.new(test_passage_params)

    respond_to do |format|
      if @test_passage.save
        format.html { redirect_to @test_passage, notice: "Test passage was successfully created." }
        format.json { render :show, status: :created, location: @test_passage }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @test_passage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_passages/1 or /test_passages/1.json
  def update
    respond_to do |format|
      if @test_passage.update(test_passage_params)
        format.html { redirect_to @test_passage, notice: "Test passage was successfully updated." }
        format.json { render :show, status: :ok, location: @test_passage }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @test_passage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_passages/1 or /test_passages/1.json
  def destroy
    @test_passage.destroy
    respond_to do |format|
      format.html { redirect_to test_passages_url, notice: "Test passage was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_passage
      @test_passage = TestPassage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def test_passage_params
      params.require(:test_passage).permit(:correct_questions)
    end
end
