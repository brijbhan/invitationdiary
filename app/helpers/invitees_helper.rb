module InviteesHelper
  def invited_options
    call_counts = Invitee.order(:call_count).uniq.pluck(:call_count)
    options = call_counts.map { |c| count_option(c) }
    options.unshift(['Filter by', ''])
    options
  end

  private
  def count_option(count)
    if count.zero?
      ['Never invited', 0]
    else
      ["#{pluralize(count, 'time')} invited", count]
    end
  end
end
