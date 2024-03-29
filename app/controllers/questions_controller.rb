class QuestionsController < ApplicationController
  # GET /questions
  # GET /questions.json
  def index
    @tags = Tag.find(:all, :group => :name)
    @questions = Question.paginate(:page => params[:page], :per_page => 15).order('id DESC')
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questions }
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @question = Question.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/new
  # GET /questions/new.json
  def new
    @question = Question.new
    @tags = Tag.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/1/edit
  def edit
    @question = Question.find(params[:id])
  end

  # POST /questions
  # POST /questions.json
  def create
    
    @question = current_user.questions.create(params[:question])
    

    respond_to do |format|
      if @question.save
        Tag.new.tag_splitter(params[:tags]).each {|tag_name|
          Tag.create(:question_id => @question.id, :name => tag_name)
        }
        
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render json: @question, status: :created, location: @question }
      else
        format.html { render action: "new" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /questions/1
  # PUT /questions/1.json
  def update
    @question = Question.find(params[:id])

    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :ok }
    end
  end
  
  def users
    @user = User.find(params[:user_id])
    @questions = Question.where(:user_id => params[:user_id]).paginate(:page => params[:page], :per_page => 15).order('id DESC')
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @questions }
    end
  end
  
  # GET /questions/tags/:tag
  def tags_prefix_search
    @tags = Tag.find(:all, :conditions => ["name like ?", params[:tag_prefix] + "%"]).map(&:name)
    
    respond_to do |format|
      format.json { render json: @tags }
    end
  end
end
