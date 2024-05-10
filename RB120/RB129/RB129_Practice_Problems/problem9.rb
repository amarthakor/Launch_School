# problem domain, medical office
# 3 levels of 'helping patient'
# - Doctor
#   - help patient(string_argument)
# # - MA
#   - help_patient(string_argument)
# # - Scribe
#   - help_patient(string_argument)

# need problem domain class to handle all other classes helping_patient

class MedicalOffice
  attr_reader :medical_staff

  def initialize
    @medical_staff = [Doctor.new, MedicalAssistant.new, Scribe.new]
  end

  def process_patient
    medical_staff.each {|staff| puts staff.helps_patient }
  end
end

class Doctor
# helps patient out in some way
  def helps_patient
    "Are you experiencing any problems of issues you'd like to discuss?"
  end
end

class MedicalAssistant
# helps patient out in some way
  def helps_patient
    "I'm going to take your blood pressure and draw some blood for labs..."
  end

end

class Scribe
# helps patient out in some way
  def helps_patient
   "Patient reports testing positive for H. pylori but never finished triple therapy..."
  end
end

adc = MedicalOffice.new
adc.process_patient