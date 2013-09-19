class LicenciasLog < ActiveRecord::Base

  belongs_to :licencia
  attr_accessible :ip, :licencia_id, :log_fecha_hora, :referencias, :solicitud_id
  
end
