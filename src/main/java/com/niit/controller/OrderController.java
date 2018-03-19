package com.niit.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.niit.dao.CartDAO;
import com.niit.dao.OrderDetailsDAO;
import com.niit.dao.ProductDAO;
import com.niit.model.CartItem;
import com.niit.model.OrderDetails;
import com.niit.model.Product;

@Controller
public class OrderController 
{
@Autowired
CartDAO cartDAO;

@Autowired
ProductDAO productDAO;

@Autowired
OrderDetailsDAO orderDetailsDAO;

@RequestMapping("/ConfirmOrder")
public String confirmOrder(HttpSession session,Model m )
{
String username=(String)session.getAttribute("username");
List<CartItem> listCartItems=cartDAO.getCartItems(username);
m.addAttribute("cartList", listCartItems);
m.addAttribute("grandTotal", this.grandTotal(listCartItems));
return "OrderConfirm";
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

@Transactional
@RequestMapping(value="/PaymentConfirm",method=RequestMethod.POST)
public String paymentConfirm(@RequestParam("pmode")String pmode,@RequestParam("shippingAddr")String shippingAddr,HttpSession session,Model m) 
{
	String username=(String)session.getAttribute("username");
	List<CartItem> listCartItems=cartDAO.getCartItems(username);
	
	OrderDetails orderDetails=new OrderDetails();
	orderDetails.setCartId(listCartItems.get(0).getOrderID());
	orderDetails.setOrderDate(new Date());
	orderDetails.setTranType(pmode);
	orderDetails.setShippingAddr(shippingAddr);
	orderDetails.setTotalAmount(this.grandTotal(listCartItems));
	orderDetails.setUsername(username);
	orderDetails.setPaymentStatus("NP");
	
	orderDetailsDAO.confirmOrderDetails(orderDetails);
	

	for (CartItem cartItem : listCartItems) 
	{
		cartItem.setPaymentStatus("P");
		cartItem.setOrderID(orderDetails.getOrderId());
		cartDAO.updateCartItem(cartItem);
	}
	
	List<OrderDetails> orderDetails1=orderDetailsDAO.getOrderDetails(username);
	m.addAttribute("orderList", orderDetails1);
	orderDetails.setPaymentStatus("P");
	orderDetailsDAO.updateOrderDetails(orderDetails);
	return "ThankYou";
    }
}
