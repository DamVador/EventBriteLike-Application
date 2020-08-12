class ChargesController < ApplicationController

  def new
    puts "rrsult ici"
    puts Event.find(params[:event_id]).price
  end


  def create
    # Amount in cents
    puts "%"*45
    puts params

    @amount = Event.find(params[:event_id]).price

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

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

end
