Factory.define :item do |f|
  f.association(:user)
  f.name "Item Name"
end
