class InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new;
  end

  def confirm

    # ==========ここから追加==========
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      render "confirm"
    else
      render :new
    end
    # ==========ここまで追加==========

  end

  def thanks

    # ==========ここから追加する==========
    @inquiry = Inquiry.new(inquiry_params)
    InquiryMailer.received_email(@inquiry).deliver_now
    # ==========ここまで追加する==========

  end

  # ==========ここから追加==========
  private

    def inquiry_params
      params.require(:inquiry).permit(:name, :email, :relationship, :content)
    end
  # ==========ここまで追加==========

end
