require 'open-uri'
require 'json'

class StatusPoller
	def initialize
    Delayed::Worker.logger.info "Queued Poll job: #{DateTime.now}"
	end
  def perform
    Delayed::Worker.logger.info "==================== POLL START TIME: #{DateTime.now} =============================".blue
    results = JSON.parse(open(url).read)
    results.each do |line|
      db_line = Line.where(name: line['id']).first
      current_state = db_line.state_name

      if line['lineStatuses'].any? { |status| status['statusSeverity'] < 10 }
        line['lineStatuses'].delete_if { |status| status['validityPeriods'].all? { |period| !is_now(period["fromDate"], period["toDate"]) } }
        current_status = line['lineStatuses'].first
        next if current_status.nil?

        db_line.status_severity     = current_status['statusSeverity']
        db_line.status_description  = current_status['statusSeverityDescription']
        db_line.delay_reason        = current_status['reason']
        db_line.state_event         = "delayed"

        Delayed::Worker.logger.info "#{db_line.name}: delay!".red

      else

        db_line.status_severity     = 10
        db_line.status_description  = line['lineStatuses'].first['statusSeverityDescription']
        db_line.delay_reason        = nil
        db_line.state_event         = "good_service"

        Delayed::Worker.logger.info "#{db_line.name}: fine!".green

      end

      unless db_line.state? current_state
        db_line.save!
      else
        Delayed::Worker.logger.info "   - No change".blue
      end
    end
    Delayed::Worker.logger.info "==================== POLL END TIME: #{DateTime.now} =============================".blue
    return true
  end

  def get_lines
    results = JSON.parse(open(url).read)
    results.each do |line|
      puts "{name: '#{line['id']}', mode_name: '#{line['modeName']}'},"
    end
    return 0
  end

  def url
    id = ENV['TFL_APP_ID']
    key = ENV['TFL_APP_KEY']
    return "http://api.tfl.gov.uk/Line/Mode/%7Bmodes%7D/Status?
              modes=tube
              &detail=True
              &app_id=#{id}
              &app_key=#{key}".squish.gsub ' ', ''
  end

  private

  def is_now(start_time, end_time)
    (start_time.to_datetime..end_time.to_datetime).cover? DateTime.now
  end
end
