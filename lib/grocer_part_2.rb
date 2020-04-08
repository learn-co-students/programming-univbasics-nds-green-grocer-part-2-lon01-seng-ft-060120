require_relative './part_1_solution.rb'
require 'pp'
def apply_coupons(cart, coupons)
  cart_index=0
  
  while cart_index<cart.length;
  coupon_index = 0
    while coupon_index<coupons.length
    current_cart = cart[cart_index];
    current_coupon = coupons[coupon_index]
    if current_cart[:item]== current_coupon[:item] && current_cart[:count] >= current_coupon[:num];
        current_cart[:count]-= current_coupon[:num];
        cart.push(:item =>"#{current_cart[:item]} W/COUPON", :price => current_coupon[:cost]/current_coupon[:num], :clearance => current_cart[:clearance], :count => current_coupon[:num])
    end
    coupon_index+=1
    end
  cart_index+=1;
  end
  cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  cart_index =0
  while cart_index<cart.length;
    if cart[cart_index][:clearance] == true
      cart[cart_index][:price] *=0.8
    end
  cart_index+=1
  end
  cart
end

def checkout(cart, coupons)
  consolidated_Cart =consolidate_cart(cart);
  couponed_Cart= apply_coupons(consolidated_Cart, coupons);
  final_cart = apply_clearance(couponed_Cart)
  total = 0
  cart_index=0
  while cart_index<final_cart.length
  total+= final_cart[cart_index][:price] * final_cart[cart_index][:count]
  cart_index+=1
  end
  if total>= 100;
    total*=0.9
  end
  total.floor(2)
end


# Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers