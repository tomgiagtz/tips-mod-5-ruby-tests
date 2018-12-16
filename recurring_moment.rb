require 'active_support'
require 'active_support/core_ext'
require 'pry'

class RecurringMoment
  def initialize(start:, interval:, period:)
    @start = start
    @interval = interval
    @period = period
  end

  def match(date)
	current = @start
	# date_diff = 0
	while current <= date
		# puts 'current:  ' + current.strftime('%D')
		# puts 'date: ' + current.strftime('%D')
		# puts current == date
		if current == date
        	return true
      	end

	  if @period == 'monthly'
		current = current.advance(months: @interval)
		# if the start is the end of the month, and the current day is before that day, reset to the end of the month
		if @start.end_of_day == @start.end_of_month && current.day < @start.day
			current = current.end_of_month.beginning_of_day
		end


		#didn't work for multiple months at a time
		# current = current.advance(days: date_diff)
		# date_diff = 0
		# binding.pry

		# if current.day != @start.day
		# 	date_diff = current.day - @start.day
		# end
		
      elsif @period =='weekly'
        current = current.advance(weeks: @interval)
      elsif @period == 'daily'
        current = current.advance(days: @interval)
	  end
    end
	
    return false
  end
end