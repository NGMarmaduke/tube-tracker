class Line < ActiveRecord::Base
  state_machine :initial => :good_service do
    after_transition :good_service => any - :good_service, :do => :notify_of_delays

    event :delayed do
      transition any => :delayed
    end
    event :good_service do
      transition any => :good_service
    end
  end

  def notify_of_delays
    Rails.logger.info 'notify of delayed service'
  end
end
