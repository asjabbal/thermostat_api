class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def as_json(options={})
    super(options.merge( {except: [:created_at, :updated_at, :id, :thermostat_id]} ))
  end
end
