class AttendancesController < ApplicationController
  def new
  end

  def create

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
        redirect_to event_path
      end
  end

  def show
  end

  def destroy
  end
end
