package com.niit.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;



import com.niit.dao.CartDAO;
import com.niit.dao.ProductDAO;
import com.niit.model.CartItem;
import com.niit.model.Product;

@Controller
public class CartController 
{
	@Autowired
	CartDAO cartDAO;
	
	@Autowired
	ProductDAO productDAO;
	
@RequestMapping("/addToCart{productId}")
public String addCartItem(@PathVariable("productId")int productId,@RequestParam("quantity")int quantity,HttpSession session, Model m)
{
	CartItem cartItem=new CartItem();
	Product product=productDAO.getProduct(productId);
	
	String username=(String)session.getAttribute("username");
	
	cartItem.setProductId(productId);
	cartItem.setOrderID(1001);
	cartItem.setQuantity(quantity);
	cartItem.setUsername(username);
	cartItem.setPaymentStatus("NP");
	cartItem.setSubTotal(quantity*product.getPrice());
	cartDAO.addCartItem(cartItem);
	
	List<CartItem> listCartItems=cartDAO.getCartItems(username);
	
	m.addAttribute("cartList",listCartItems);
	m.addAttribute("grandTotal", this.grandTotal(listCartItems));
	return "Cart";
}

@RequestMapping(value="/Cart")
public String cart(Model m, HttpSession session)
{
	String username=(String)session.getAttribute("username");
	List<CartItem> listCartItems=cartDAO.getCartItems(username);
	
	m.addAttribute("cartList",listCartItems);
	m.addAttribute("grandTotal", this.grandTotal(listCartItems));
	return "Cart";
	}

@Transactional
@RequestMapping("/updateCartItem{cartItemId}")
public String updateCartItem(@PathVariable("cartItemId") int cartItemId,@RequestParam("quantity")int quantity,HttpSession session,Model m)
{
	CartItem cartItem=cartDAO.getCartItem(cartItemId);
	Product product=productDAO.getProduct(cartItem.getProductId());
	
	cartItem.setQuantity(quantity);
	cartItem.setSubTotal(quantity*product.getPrice());
	
	
	cartDAO.updateCartItem(cartItem);
	
	String username=(String)session.getAttribute("username");
	
	List<CartItem> listCartItems=cartDAO.getCartItems(username);
	m.addAttribute("cartList",listCartItems);
	m.addAttribute("grandTotal",this.grandTotal(listCartItems));
	
	
	return "Cart";
}

@Transactional
@RequestMapping("/deleteCartItem{cartItemId}")
public String deleteCartItem(@PathVariable("cartItemId") int cartItemId,HttpSession session,Model m)
{
	CartItem cartItem=cartDAO.getCartItem(cartItemId);
	
	cartDAO.deleteCartItem(cartItem);
	
	String username=(String)session.getAttribute("username");
	
	List<CartItem> listCartItems=cartDAO.getCartItems(username);
	m.addAttribute("cartList",listCartItems);
	m.addAttribute("grandTotal",this.grandTotal(listCartItems));
	return "Cart";
}

public int grandTotal(List<CartItem> listCartItems)
{
	int grandTotal=0;
	for(CartItem cartItem:listCartItems)
	{
		Product product=productDAO.getProduct(cartItem.getProductId());
	grandTotal=grandTotal+(cartItem.getQuantity())*(product.getPrice());	
	
	}
	return grandTotal;
}
 

}