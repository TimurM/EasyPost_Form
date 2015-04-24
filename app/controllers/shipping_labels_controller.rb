class ShippingLabelsController < ApplicationController

  def create

      EasyPost.api_key = Pusher.key

      to_address_inputs = params[:to_address]
      from_address_inputs = params[:from_address]

      @shipment = EasyPost::Shipment.create(
      {
        to_address: {
          name: to_address_inputs['name'],
          company: to_address_inputs['company'],
          street1: to_address_inputs['street1'],
          city: to_address_inputs['city'],
          state: to_address_inputs['state'],
          zip: to_address_inputs['zip']
        },
        from_address: {
          company: from_address_inputs['company'],
          street1: from_address_inputs['stree1'],
          street2: from_address_inputs['street2'],
          city: from_address_inputs['city'],
          state: from_address_inputs['state'],
          zip: from_address_inputs['zip'],
          phone: from_address_inputs['phone']
        },
        parcel: {
          length: 9,
          width: 6,
          height: 2,
          weight: 10
        }
      }
      )

      @bought_shipment = @shipment.buy(
        :rate => @shipment.lowest_rate(carriers = ['USPS'], services = ['First'])
      )

      if @bought_shipment
        redirect_to @bought_shipment.postage_label.label_url
      else
        render json: @bought_shipment.errors.full_messages, status: :unprocessable_entity
      end
    end

    def new
      render :new
    end

end
