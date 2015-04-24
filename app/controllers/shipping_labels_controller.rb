class ShippingLabelsController < ApplicationController

  def create

      EasyPost.api_key = Pusher.key

      to_address_inputs = params[:to_address]
      from_address_inputs = params[:from_address]
      parcel_inputs = params[:parcel]

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
          length: parcel_inputs['length'],
          width: parcel_inputs['width'],
          height: parcel_inputs['height'],
          weight: parcel_inputs['weight']
        }
      }
      )
      begin
        @bought_shipment = @shipment.buy(
          :rate => @shipment.lowest_rate(carriers = ['USPS'], services = ['First'])
        )
        redirect_to @bought_shipment.postage_label.label_url
      rescue
        flash[:errors] = ["Invalid information please correct address, zip and parcel dimensions"]
        redirect_to new_shipping_label_url
      end

    end

    def new
      render :new
    end

end
