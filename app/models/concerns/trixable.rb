module Trixable
  included do
    before_save :filter_body
  end

  def filter_body
  end

end
