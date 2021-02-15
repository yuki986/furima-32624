class Prefecture < ActiveHash::Base

  self.date = [
    {id: 0, name: '---'},
    {id: 1, name: '1~2日で配送'},
     {id: 2, name: '2~3日で配送'},
      {id: 3, name: '4~7日で配送'}
  ]
end