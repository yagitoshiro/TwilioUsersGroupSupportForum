class QuestionsController < ApplicationController
  before_action :set_question, only: [:show]
  before_action :set_my_question, only: [:edit, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def index
    if params[:tag]
      @questions = Question.tagged_with(params[:tag]).order('updated_at DESC').page(params[:page]).per(params[:per] || 50)
    elsif params[:q]
      where = 'questions.title ilike ? or questions.body ilike ? or answers.body ilike ?'
      @questions = Question.left_joins(:answers)
      params[:q].strip.split(' ').each do |q|
        q = "%#{Unicode::nfkc(q).downcase.to_s}%"
        @questions = @questions.where(where, q, q, q)
      end
      @questions = @questions.group('questions.id').order('updated_at DESC').page(params[:page]).per(params[:per] || 50)
    else
      @questions = Question.order('updated_at DESC').page(params[:page]).per(params[:per] || 50)
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @answer = Answer.new
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: '質問を投稿しました！' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: '質問を更新しました！' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    render file: 'public/404.html'
    #@question.destroy
    #respond_to do |format|
    #  format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
    #  format.json { head :no_content }
    #end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    def set_my_question
      @question = Question.find_by(id: params[:id], user_id: @current_user.id)
      unless @question
        render file: 'public/404.html'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:title, :body, :user_id, :score, :tag_list)
    end
end
