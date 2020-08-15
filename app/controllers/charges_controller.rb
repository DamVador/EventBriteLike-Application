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

    Attendance.all.each do |attendance|
      if attendance.user_id== current_user.id
        flash[:error]="Déjà inscris"
        redirect_to "/"
      end
    end

    @amount = @event.price

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount*100,
      description: 'Paiement',
      currency: 'eur',
    })
    Attendance.create!(user_id: current_user.id, event_id: @event.id)
    flash[:success] = "Inscris avec succès"
    redirect_to event_path(params[:event_id])

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to event_path(params[:event_id])
  end

end
