#!/usr/bin/env ruby -w
require 'date'
##############################################################
#DataGenerator Class
##############################################################
class DataGenerator
   def initialize
       logfile = File.new("DataGenerator.log","a")
       logfile.write("Executing generator at #{Time.now}\n")

       @firstNames = ["Bob", "Carol", "Ted", "Alice"]
       @lastNames = ["Smith", "Jones", "Campbell", "Edwards"]
       @delimiter = ":"
       @streetNames = ["Pine", "Oak", "Main", "Maple"]
       @streetTypes = ["St.", "Dr.", "Ave.", "Rd."]
       @cities = ["Oakland", "Three Oaks", "Paradise", "Hell", "Concepcion"]
       @states = ["AL","AS","AZ","AK","CA","CO"]
       @products = ["oranges", "apples", "bananas", "avocados"]
       @hostnames = ["anakin", "eduardo", "windu", "skywalker","arrakis"]
       @domains = ["com","net","edu","gov","biz"]

       if FileTest.exist?("specialFields1.dat")
          @specialFields1 = File.new("specialFields1.dat","r").readlines
          logfile.write("Read in specialFields.dat: values #{@specialFields1}\n")
          @specialFields1.each { |item| item.chomp!}
       else
          @specialFields1 = []
       end

       @specialFields2 = []
       @specialFields3 = []
       @specialFields4 = []
   end

   def firstName
####################################################
# firstName
#    returns a randomly selected item from the firstNames array
####################################################
     @firstNames[rand(@firstNames.length)]
   end
   def lastName
     @lastNames[rand(@lastNames.length)]
   end
   def delimiter
     @delimiter
   end
   def streetName
     @streetNames[rand(@streetNames.length)]
   end
   def streetType
     @streetTypes[rand(@streetTypes.length)]
   end
   def city
     @cities[rand(@cities.length)]
   end
   def state
     @states[rand(@states.length)]
   end
   def product
     @products[rand(@products.length)]
   end
   def lastNames
     @lastNames
   end
   def firstNames
     @firstNames
   end
   def alpha(length)
     str = ''
     length.times do
         x = 65 + rand(26)
         str = str + x.chr
     end
     str
   end
   def numeric(length)
     str = ''
     length.times do
        x = rand(10)
        str = str + x.to_s
     end
     str
   end
   def ssn
     ssn1 = numeric(3)     
     ssn2 = numeric(2)
     ssn3 = numeric(4)
     ssn1 + '-' + ssn2 + '-' + ssn3
   end
   def phone
     phn1 = numeric(3)
     phn2 = numeric(3)
     phn3 = numeric(4)
     phn1 + '-' + phn2 + '-' + phn3     
   end
   def zipcode
     numeric(5)
   end
   def specialField1
     if specialFields1.empty?
        'specialField1'
     else
        specialFields1[rand(@specialFields1.length)]
     end
   end
   def specialFields1
      @specialFields1
   end
   def specialFields2
      @specialFields2
   end
   def specialFields3
      @specialFields3
   end
   def specialFields4
      @specialFields4
   end
   def dateWithin(days)
     (Date.today - rand(days)).to_s
   end
   def email
     @firstNames[rand(@firstNames.length)] + '.' + @lastNames[rand(@lastNames.length)] + '@' + @hostnames[rand(@hostnames.length)] + '.' + @domains[rand(@domains.length)]
   end
   def record(fieldList)
     fields = fieldList.split(/,/)
   end
   def address
     num = rand(7)
     if num == 0
        num = 1
     end
     numeric(num) + ' ' + streetName + ' ' + streetType 
   end
   def value(aValue)
      aValue
   end
   def cycle(aListString)
      aList = aListString.split(/,/)
      aList[rand(aList.length)]
   end
end

