class HomeController < ApplicationController
 respond_to :html, :js

  def index

   if user_signed_in?  and  Mykey.where(["user_id = '?'", current_user.id]).to_a.size > 0
      @mykey = Mykey.where(["user_id = '?'", current_user.id]).first.content
   else 
      @mykey = false
   end

   if params[:key]
    user_id_for_new_alert = is_valid_key? params[:key]
    if user_id_for_new_alert and Alert.where(["user_id = '%s' AND name = '%s'",user_id_for_new_alert , params[:message].gsub("_"," ") ]).to_a.size <= 0
       Alert.create(:name => params[:message].gsub("_"," "),:user_id =>user_id_for_new_alert ).save      
       MyMailer.send_alert(User.find(user_id_for_new_alert),params[:message].gsub("_"," ")).deliver
    end
   end 

   respond_to do |format|
    
     format.html
     format.js { render "./start.js.erb" }
   end
  
 end



  def is_valid_key? key
    this_key =  Mykey.where(["content = ?",key])
    if this_key.to_a.size > 0
     return  this_key.first.user_id
    else 
     return false
    end 
  end


  def alert
   
   this_key =  Mykey.where(["content = ?",params[:key]])
    if this_key.to_a.size > 0
      
     @alert = Alert.where(["user_id = ?",this_key.first.user_id])
     
     @current_user_id =  this_key.first.user_id
 
     respond_to do |format|
      format.html
      format.js
    end
 
   else
       render :status => :forbidden, :text => "Forbidden fruit"
    end
 
  end


  def delete_alert

    this_key =  Mykey.where(["content = ?",params[:key]])
    if this_key.to_a.size > 0 and Alert.where(id: params[:alert_id]).to_a.size > 0 

       Alert.find(params[:alert_id]).destroy

     respond_to do |format|
      format.html
      format.js
    end

    else
      render :status => :forbidden, :text => "Forbidden fruit"
    end
 

  end






  def metric
 
     user_id = is_valid_key?  params[:key]   
  
     if user_id and params[:data].match /^[A-Za-z0-9]*=[0-9pP]*$/
        label = params[:metric_name] 
        data_label = params[:data].split("=")[0]
        data_value = params[:data].split("=")[1]
        puts "LOG creating metric.."
        Metric.create(:metric_name => label, 
                      :label => data_label, 
                      :data => data_value,  
                      :user_id => user_id,
                      :server_name => params[:server], 
                      :server_hash => Digest::SHA256.hexdigest(params[:server])).save
     end 
  
  end


 def mymetrics

   if not  user_signed_in?
    render :status => :forbidden, :text => "Forbidden fruit"
   end
  
   @metric_array =  Metric.where("user_id = '%s'",1).all
   @servers  = Array.new

   @metric_array.each do |m|
    @servers.push({"name" => m[:server_name] , "hash" => m[:server_hash] , "metric_name"  => m[:metric_name]})
   end

   @servers = @servers.uniq


 end



 def showdata
  
  if not user_signed_in?
       render :status => :forbidden, :text => "Forbidden fruit"
  end
  puts "FOOOOO #{user_signed_in?}"
  @data = Metric.where("user_id = '%s' AND server_hash = '%s'",current_user.id,params[:server_hash]).all

 end




end
