package com.electronics.daoimpl;

import java.util.HashMap;
import java.util.Map;

import com.electronics.model.CartItem;

public class Cart {

    private Map<Integer, CartItem> items;

    public Cart() {
        this.items = new HashMap<>();
    }

    // Add item to the cart
    public void addItem(CartItem item) {
        int itemId = item.getItemId();
        if (items.containsKey(itemId)) {
            CartItem existingItem = items.get(itemId);
            existingItem.setQuantity(existingItem.getQuantity() + 1);
        } else {
            items.put(itemId, item);
        }
    }

    // Increase item quantity
    public void increaseQuantity(int itemId) {
        if (items.containsKey(itemId)) {
            CartItem item = items.get(itemId);
            item.setQuantity(item.getQuantity() + 1);
        }
    }

    // Decrease item quantity
    public void decreaseQuantity(int itemId) {
        if (items.containsKey(itemId)) {
            CartItem item = items.get(itemId);
            int newQuantity = item.getQuantity() - 1;
            if (newQuantity > 0) {
                item.setQuantity(newQuantity);
            } else {
                removeItem(itemId);
            }
        }
    }

    // Remove item from cart
    public void removeItem(int itemId) {
        items.remove(itemId);
    }

    // Get all items
    public Map<Integer, CartItem> getItems() {
        return items;
    }
}
