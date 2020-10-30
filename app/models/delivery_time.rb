class DeliveryTime < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '3日前後' },
    { id: 3, name: '1週間前後' },
    { id: 4, name: '2週間前後' },
    { id: 5, name: '1ヶ月前後' },
    { id: 6, name: '1ヶ月半前後' },
    { id: 7, name: '2ヶ月前後' },
  ]
  end