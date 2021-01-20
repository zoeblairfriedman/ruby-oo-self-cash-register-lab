require 'pry'

class CashRegister
    attr_accessor :discount, :total, :item_cart, :last_item, :last_price

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @item_cart = []
    end

    def apply_discount
        if self.discount != 0
        self.total = self.total - (self.total * (discount.to_f / 100))
        "After the discount, the total comes to $#{total.to_i}."
    else
        "There is no discount to apply."
    end
    end

    def items
        @item_cart
    end


    def add_item(item, price, quantity = 1)
        self.total += price*quantity
        self.last_price = price
        while quantity > 0
            self.item_cart << item
            # self.last_price = price
            quantity -= 1
        end
        self.last_item = item_cart.last
    end

    def void_last_transaction
        self.item_cart.delete(last_item)
        self.total -= self.last_price
        if self.item_cart.length == 0
            self.total = 0
        end
    end

end