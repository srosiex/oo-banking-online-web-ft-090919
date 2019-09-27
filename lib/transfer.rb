class Transfer
  # code here
  attr_accessor :sender, :receiver, :amount, :status, :count

  def initialize(sender, receiver, amount=50, status="pending")
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = status
  end

  def valid?
    @sender.valid? == true and @receiver.valid? == true ? true : false
  end

  def execute_transaction
    if @sender.status = "closed" || !@sender.valid? || @sender.balance < @amount
          @status = "rejected"
          return "Transaction rejected. Please check your account balance."
        # elsif
        #   @status == "complete"
    else
    sender.balance -= amount
    receiver.balance =+ amount
      @status = "complete"
    end
  end
end
  def reverse_transfer
    if @status == "complete"
      @sender.deposit( @amount )
      @receiver.deposit( @amount * -1)
      @status = "reversed"
    end
  end
