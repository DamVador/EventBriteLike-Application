class ChargesController < ApplicationController

  def new
    puts "rrsult ici"
    puts Event.find(params[:event_id]).price
    @amount = Event.find(params[:event_id]).price
  end


  def create
    # Amount in cents
    puts "%"*45
    puts params
    @event = Event.find(params[:event_id])
    @amount = @event.price

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Paiement',
      currency: 'eur',
    })
    flash[:success] = "paiement accepté, vous êtes inscrits"
    redirect_to root_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to event_path(params[:event_id])
  end

end
