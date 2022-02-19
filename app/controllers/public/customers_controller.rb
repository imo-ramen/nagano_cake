class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  #ログインしている場合のみ表示。以外ならログイン画面遷移
  
  def show
    @customer = current_customer
  end
  
  def edit
    @customer = current_customer
  end 
  
  def update
    @customer = current_customer
  end
end
