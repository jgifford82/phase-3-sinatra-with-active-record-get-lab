class BakedGood < ActiveRecord::Base
  # add association macro here
  belongs_to :bakery

  # def sort_goods
      #run BakedGood.all.sort in rake console to see what it returns
  #   BakedGood.all.sort
  # end
end
