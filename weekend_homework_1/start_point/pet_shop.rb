def admin(pet_shop)
  pet_shop[:admin]
end

def pet_shop_name(pet_shop)
 return pet_shop[:name]
end

def total_cash (pet_shop)
  return admin(pet_shop)[:total_cash]
end


def add_or_remove_cash(pet_shop, spend)
 admin(pet_shop)[:total_cash]+= spend
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, sold)
 admin(pet_shop)[:pets_sold]+= sold
end

def stock_count(pet_shop)
  pet_shop[:pets].count
end

def pets_by_breed(pet_shop, breeds)
  pets = []
  for pet in pet_shop[:pets]
    if pet[:breed] == breeds
      pets << pet
    end
  end
  return pets
end

def find_pet_by_name(pet_shop, name)
  match = nil
  for pet in pet_shop[:pets]
    match = pet if pet[:name] == name
  end
  return match
end

def remove_pet_by_name(pet_shop, name)
  pets = pet_shop[:pets]
  pet_to_delete =find_pet_by_name(pet_shop,name)
  pets.delete(pet_to_delete)
end

def add_pet_to_stock(pet_shop, new_pet)
newpet = new_pet
pet_shop[:pets] << newpet
end

def customer_pet_count(customers)
 
  pet_count =[]
 
  for pets in customers[:pets]

    pet_count.push(:name)
  end
  
  return pet_count.count
  end

  def add_pet_to_customer(customer, new_pet)
    newpet = new_pet
    customer[:pets]<<newpet
    
  end

  def customer_can_afford_pet(customer, new_pet)
    if customer[:cash].to_f >= new_pet[:price].to_f
      return true
    else
      return false
    end
  end

  def sell_pet_to_customer(pet_shop, pet, customer)
    
    
    add_pet_to_customer(customer, pet)
    customer_pet_count(customer)
    increase_pets_sold pet_shop, sold)
    add_or_remove_cash(pet_shop, spend)

  end