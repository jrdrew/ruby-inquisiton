class RepliesController < ApplicationController
  
  def create
    
    @question = Question.find(params[:question_id])
    @reply = Reply.new(params[:reply])
    @reply.user_id = current_user.id
    @reply.question_id = @question.id
    @reply.save
    redirect_to question_path(@question)
  end
  
  def destroy
    @question = Question.find(params[:question_id])
    @reply = @question.replies.find(params[:id])
    @reply.destroy
    redirect_to question_path(@question)
  end
  
  
  # GET /questions/:question_id/replies/:id
  def edit
    @question = Question.find(params[:question_id])
    @reply = @question.replies.find(params[:id])
  end
  
  # PUT /questions/:question_id/replies/:id
  # PUT /questions/:question_id/replies/:id.json
  def update
    @question = Question.find(params[:question_id])
    @reply = @question.replies.find(params[:id])

    respond_to do |format|
      if @reply.update_attributes(params[:reply])
        format.html { redirect_to @question, notice: 'Reponse was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end
end
