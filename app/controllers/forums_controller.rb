class ForumsController < ApplicationController
  # GET /forums
  # GET /forums.xml
  def index
    @hash = Hash.new
    @question = QuestionTable.all
    @question.each do |q|
      @hash[q.question] = { AnswerTable.where(:question_table_id => q.id).count(:question_table_id) => q.id }
    end
  end

 def logout
    session[:current_user_id] = nil
    redirect_to new_forum_path
  end
  def allanswer
    @question = QuestionTable.where(:id => params[:id])
    @answer = AnswerTable.where(:question_table_id => params[:id]).order("rating DESC")
  end

  # GET /forums/1
  # GET /forums/1.xml
  def show
   
  end

  # GET /forums/new
  # GET /forums/new.xml
  def new
    @user = UserTable.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /forums/1/edit
  def edit
    @forum = Forum.find(params[:id])
  end
  
  def post_question
    @question = QuestionTable.new
    @question.question = params[:question]
    @question.save
    @ques = QuestionTable.where(:question => params[:question])
    @user = UserTable.where(:email_id => params[:email])
    if @user.exists?
      @requester = RequesterTable.new
      @requester.user_table_id = @user[0].id
      @requester.question_table_id = @ques[0].id
      @requester.save
      render '/forums/show'
    else
      @users = UserTable.new
      @users.email_id = params[:email]
      @users.user_name = params[:name]
      @users .save
      @user = UserTable.where(:email_id => params[:email])
      @requester = RequesterTable.new
      @requester.user_table_id = @user[0].id
      @requester.question_table_id = @ques[0].id
      @requester.save
      render '/forums/show'
    end
  end

  def dologin
    
     @users = UserTable.where(:email_id => params[:email], :password => params[:password])
     unless @users.blank?
       session[:current_user_id] = @users[0].email_id
       @hash = Hash.new
       @question = QuestionTable.all
       @question.each do |q|
         @hash[q.question] = { AnswerTable.where(:question_table_id => q.id).count(:question_table_id) => q.id }
       end
     else
       redirect_to new_forum_path
     end
   end
 
# logout code 

 




  def register
    @user= UserTable.new
    @users =UserTable.where(:email_id => params[:email])
    if @users.exists?
      render '/forums/new'
    else
      pass1 = params[:password]
      pass2 = params[:password_confirmation]
      if pass1 == pass2
        @user.user_name = params[:username]
        @user.email_id = params[:email]
        @user.password = params[:password]
        @user.user_type = "user"
        
          if @user.save
            render '/forums/new'
          else 
            render '/forums/new'
          end
        
      else
       render '/forums/new'
      end
    end
  end 

  def search
    @questions = QuestionTable.where(:question => params[:name])
    if @questions.exists?
      @answers = AnswerTable.where(:question_table_id=> @questions[0].id).group("question_table_id,rating").order("rating DESC").first
      @users = UserTable.find(@answers.user_table_id)
    else
      render '/forums/resultnotfound'
    end
  end

  
   
  def post
    render '/forums/resultnotfound'
  end

  # POST /forums
  # POST /forums.xml
  def create
    @forum = Forum.new(params[:forum])

    respond_to do |format|
      if @forum.save
        format.html { redirect_to(@forum, :notice => 'Forum was successfully created.') }
        format.xml  { render :xml => @forum, :status => :created, :location => @forum }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @forum.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /forums/1
  # PUT /forums/1.xml
  def update
    @forum = Forum.find(params[:id])

    respond_to do |format|
      if @forum.update_attributes(params[:forum])
        format.html { redirect_to(@forum, :notice => 'Forum was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @forum.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /forums/1
  # DELETE /forums/1.xml
  def destroy
    @forum = Forum.find(params[:id])
    @forum.destroy

    respond_to do |format|
      format.html { redirect_to(forums_url) }
      format.xml  { head :ok }
    end
  end
end
