module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Worldpay
        autoload :Return, 'active_merchant/billing/integrations/worldpay/return.rb'
        autoload :Helper, 'active_merchant/billing/integrations/worldpay/helper.rb'
        autoload :Notification, 'active_merchant/billing/integrations/worldpay/notification.rb'
        
        mattr_accessor :test_url
        self.test_url = 'https://secure.wp3.rbsworldpay.com/wcc/purchase'
        
        mattr_accessor :production_url 
        self.production_url = 'https://www.paypal.com/cgi-bin/webscr' 
        
        def self.service_url
          mode = ActiveMerchant::Billing::Base.integration_mode
          case mode
          when :production
            self.production_url    
          when :test
            self.test_url
          else
            raise StandardError, "Integration mode set to an invalid value: #{mode}"
          end
        end
            
        def self.notification(post)
          Notification.new(post)
        end
        
        def self.return(query_string)
          Return.new(query_string)
        end
      end
    end
  end
end
