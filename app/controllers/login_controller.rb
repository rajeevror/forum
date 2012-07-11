class LoginController < ApplicationController

# new method
   def index
   end
   def new
   end

   def dologin
     @user = UserTable.where(:email_id => params[:email], :password => params[:password])
     if @user.blank? || @user[0].email_id=="" ||@user[0].password==""
       redirect_to  login_index_path
     else

       session[:current_id] = @user[0].email_id
       redirect_to profile_login_index_path
     end
   end

  def profile
   
      if session[:current_id]==nil
         redirect_to  login_index_path
      else
        @hash = Hash.new
        @question = QuestionTable.all
        @question.each do |q|
          @hash[q.question] = { AnswerTable.where(:question_table_id => q.id).count(:question_table_id) => q.id }
        end 
      end
  end

  def allanswer
    @question = QuestionTable.where(:id => params[:id])
    @answer = AnswerTable.where(:question_table_id => params[:id]).order("rating DESC")
  end

   
   def logout
     #session[:current_id]=nil
    cookies.delete([:current_id])
    session[:current_id]=nil
     reset_session
     redirect_to login_index_path
   end
  
end
