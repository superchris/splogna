class Preference
  extend ActiveModel::Naming

  def to_model
    self
  end

  def to_param
    self.object_id if persisted?
  end

  def to_key
    {} if persisted?
  end

  def errors
    obj = Object.new
    def obj.[](key); []; end
    def obj.full_messages(); []; end
    obj
  end

  def valid?; true; end
  def persisted?; true; end
end
