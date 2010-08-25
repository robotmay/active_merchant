module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Worldpay
        class Helper < ActiveMerchant::Billing::Integrations::Helper

          def initialize(order, account, options = {})
            super
            add_field('cartId', order)
            if ActiveMerchant::Billing::Base.integration_mode == :test || options[:test]
              add_field('testMode', '100')
            end
          end
          
          mapping :account, 'instId'
          mapping :amount, 'amount'
          mapping :currency, 'currency'
          mapping :description, 'desc'
        end
      end
    end
  end
end
