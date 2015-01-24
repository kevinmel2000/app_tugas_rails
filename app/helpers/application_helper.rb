module ApplicationHelper
  def transmission
    @transmission = ['manual','automatic','semi-auto']
  end
  def seat
    @seat = ['1','2','3','4','5','6','7','8','9','10','11','12']
  end
  def door
    @door = ['2','4','5']
  end
  def fuel
    @fuel = ['premium','pertamax','pertamax plus']
  end
  def engine
    @engine = ['intake stroke','compression stroke','combustion stroke','exhaust stroke']
  end
  def fulltank
    @fulltank = ['5 Liter','4 Liter','15 Liter']
  end
  def brand
    @brand = ['Honda','Yamaha','Suzuki','Bajaj','Kawasaki','Scooter','KTM','Ducati']
  end


  def color
    @color = ['Black','Brown','red','Yellow','Blue']
  end
  def sim
    @sim = ['One Sim','Dual Sim','Tree Sim']
  end
  def camera
    @camera = (1..32)
  end
  def bathroom
    @bathroom = (1..12)
  end
  def bedroom
    @bedroom = (1..12)
  end
  def certificate
    @certificate = ['SSHM(Sertifikat Hak Milik)','DHGB(Hak Guna Bangun)','TLainnya(PPJB,Girik,Adat,dll))']
end
def condition
  @condition = ['Baru','Bekas']
end
def catalog_type
  @catalog_type = [
    ['Rumah dan Properti','Property'],
    ['Gadget and Elektronik','Gadget'],
    ['Motor','Motor'],
    ['Mobil', 'Mobil']
  ]
end


def price
  @price = [
              ['Rp.100.000','100000'],
              ['Rp.250.000','250000'],
              ['Rp.500.000','500000'],
              ['Rp.1000.000','1000000'],
              ['Rp.5000.000','5000000'],
              ['Rp.1000.000','1000000'],
              ['Rp.2000.000','2000000'],
              ['Rp.50.000.000','50000000'],
              ['Rp.100.000.000','100000000'],
              ['Rp.200..000.000','200000000'],
              ['> Rp.200.000.000','> 200000000']

  ]
end

  # def year
  #   @year = [Date.current.year,:end_year => 1920]
  # end

end
