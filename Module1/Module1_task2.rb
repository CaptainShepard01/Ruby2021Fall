#Variant 3

class Patient
  attr_accessor :id, :name, :address, :phone, :medical_card_number, :diagnostic
  def initialize(id, name, address, phone, medical_card_number, diagnostic)
    @id = id
    @name = name
    @address = address
    @phone = phone
    @medical_card_number = medical_card_number
    @diagnostic = diagnostic
  end

  def to_s
    "#{@id}, #{@name}, #{@address}, #{@phone}, #{@medical_card_number}, #{@diagnostic}\n"
  end
end

class PatientsArray
  attr_accessor :array

  def initialize
    @array = Array.new
  end

  def add_patient(patient)
    @array.push(patient)
  end

  def find_by_diagnostic(diagnostic)
    array = Array.new
    @array.each do |patient|
      array.push(patient) if patient.diagnostic == diagnostic
    end
    array
  end

  def find_by_medical_card_number(lower, upper)
    array = Array.new
    if lower >= upper
      array
    end

    @array.each do |patient|
      array.push(patient) if patient.medical_card_number >= lower && patient.medical_card_number <= upper
    end
    array
  end
end

patients = PatientsArray.new

patients.add_patient(Patient.new(55, "Vasylenko Vasyl Vasylyovych", "Kyiv", "+39056756544", 12345, "Died"))
patients.add_patient(Patient.new(14, "Hmara Sergiy Petrovych", "Kharkiv", "+39056755675", 12367, "Appendicite"))
patients.add_patient(Patient.new(17, "Ysdjgjhjsklags", "Lviv", "+39056755675", 5647, "Appendicite"))
patients.add_patient(Patient.new(23, "KHjksdfg KJKk KLJkljkk", "Ternopil", "+87888980800", 987876, "Infarct"))
patients.add_patient(Patient.new(546, "Ysdjgjhjsklags", "Herson", "+5686589675", 547, "Died"))
patients.add_patient(Patient.new(15, "UJjndsfg,lsdf", "Poltava", "+5688658", 555, "Parkinson"))
patients.add_patient(Patient.new(105, "KHKjjkjzsdgf,lsdf", "Yalta", "+5467568568", 300, "Appendicite"))

print("Patients with diagnostic Appendicite:\n")
patients.find_by_diagnostic("Appendicite").each { |patient| print(patient) }

print("\nPatients with medical card number in bounds (1, 1000):\n")
patients.find_by_medical_card_number(1, 1000).each { |patient| print(patient) }