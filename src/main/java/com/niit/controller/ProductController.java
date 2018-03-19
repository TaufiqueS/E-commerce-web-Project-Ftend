package com.niit.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.niit.dao.CategoryDAO;
import com.niit.dao.ProductDAO;
import com.niit.dao.SupplierDAO;
import com.niit.model.Category;
import com.niit.model.Product;
import com.niit.model.Supplier;


@Controller
public class ProductController
{

	@Autowired
	SupplierDAO supplierDAO;
	
	@Autowired
	CategoryDAO categoryDAO;
	
	@Autowired
	ProductDAO productDAO;
	
	boolean flag;
	
	@RequestMapping("Product")
	public String showProductPage(Model m)
	{
		Product product=new Product();
		m.addAttribute(product);
		m.addAttribute("catlist", this.listCategories());
		m.addAttribute("suplist", this.listSupplier());
		m.addAttribute("prolist", this.listProducts());
		return "Product";

		
	}

	@RequestMapping(value="/InsertProduct",method=RequestMethod.POST)
	public String addProduct(@ModelAttribute("product") Product product,Model m,@RequestParam("pimage") MultipartFile filedet)
	{
		//Product product1=new Product();
//		m.addAttribute(product1);
		productDAO.addProduct(product);
		
		
		//===> Image Uploading		
		String imagePath="D:\\Eclipse Workspace\\DealyourCars\\src\\main\\webapp\\resources\\ProductImage\\";
		imagePath=imagePath+String.valueOf(product.getProductId())+".jpg";
		File image=new File(imagePath);
		
		if(!filedet.isEmpty())
		{
			
			try 
			{
				byte[] fileBuffer=filedet.getBytes();	
				FileOutputStream fos=new FileOutputStream(image);
				BufferedOutputStream bs=new BufferedOutputStream(fos);
				bs.write(fileBuffer);
				bs.close();
				
			}
			catch (Exception e)
			{
				System.out.println("Exception Arised:"+e);
				e.printStackTrace();
			}
			
		}
		else
		{
			System.out.println("Problem Occured in File Uploading");
		}
		m.addAttribute("catlist", this.listCategories());
		m.addAttribute("suplist", this.listSupplier());
		m.addAttribute("prolist",this.listProducts());
		
		return "redirect:productPage";
		//==>End of Image Uploading	
	}
	
	public LinkedHashMap<Integer, String> listProducts()
	{
		List<Product> listProducts= productDAO.listProducts();
		LinkedHashMap<Integer, String> prolist=new LinkedHashMap<Integer, String>();
		for(Product product:listProducts)
		{
			prolist.put(product.getProductId(), product.getProductName());
		}
		return prolist;
	}
	
	public LinkedHashMap<Integer, String> listCategories()
	{
		List<Category> listCategories = categoryDAO.getAllCategory();
		LinkedHashMap<Integer,String> catlist=new LinkedHashMap<Integer,String>();
		for(Category category:listCategories)
		{
			catlist.put(category.getCategoryId(), category.getCategoryName());
		}
			return catlist;
	}
	
	public LinkedHashMap<Integer,String> listSupplier()
	{
		List<Supplier> listSupplier =supplierDAO.listSupplier();
		LinkedHashMap<Integer,String> suplist=new LinkedHashMap<Integer,String>();
		for (Supplier supplier:listSupplier)
		{
			suplist.put(supplier.getSupplierId(), supplier.getSupplierName() );
		}
		return suplist;
		
	}
	
	@RequestMapping(value="/productPage",method=RequestMethod.GET)
	public String showProductsPage(Model m)
	{
		List<Product> listProducts=productDAO.listProducts();
		m.addAttribute("listProducts", listProducts);
		return "ProductPage";
	}
	
	@RequestMapping(value="/ProductDesc{productId}",method=RequestMethod.GET)
	public String showProductDesc(@PathVariable("productId")int productId,Model m)
	{
		Product product=productDAO.getProduct(productId);
		String categoryName=categoryDAO.getCategory(product.getCategoryId()).getCategoryName();
		m.addAttribute("ProductInfo",product);
		m.addAttribute("categoryName",categoryName);
		return "ProductDesc";
	}

	@RequestMapping("/updateProduct{productId}")
	public String updateProduct(@PathVariable("productId") int productId,Model m)
	{
		Product product=productDAO.getProduct(productId);
		
		
		List<Product> listProducts=productDAO.listProducts();
		m.addAttribute("listProducts",listProducts);
		m.addAttribute("product",product);
		
		return "UpdateProduct";
	}

	@RequestMapping(value="/UpdateProduct",method=RequestMethod.POST)
	public String updateProductInDB(@RequestParam("productId") int productId,@RequestParam("productname") String productName,@RequestParam("productDesc") String productDesc,@RequestParam("pimage") MultipartFile filedet,Model m)
	{
		Product product=productDAO.getProduct(productId);
		product.setProductName(productName);
		product.setProdDesc(productDesc);;
		
		productDAO.updateProduct(product);
	
		String imagePath="D:\\Eclipse Workspace\\DealyourCars\\src\\main\\webapp\\resources\\ProductImage";
		imagePath=imagePath+String.valueOf(product.getProductId())+".jpg";
		File image=new File(imagePath);
		
		if(!filedet.isEmpty())
		{
			
			try 
			{
				byte[] fileBuffer=filedet.getBytes();	
				FileOutputStream fos=new FileOutputStream(image);
				BufferedOutputStream bs=new BufferedOutputStream(fos);
				bs.write(fileBuffer);
				bs.close();
			} catch (Exception e)
			{
				System.out.println("Exception Arised:"+e);
				e.printStackTrace();
			}
			
		}
		else
		{
			System.out.println("Problem Occured in File Uploading");
		}
		

		
		List<Product> listProducts=productDAO.listProducts();
		m.addAttribute("suplist", this.listSupplier());
		m.addAttribute("listProducts",listProducts);
		
		return "UpdateProduct";
	}


@RequestMapping("/deleteProduct{productId}")
public String deleteProduct(@PathVariable("productId") int productId,Model m)
{
	Product product=productDAO.getProduct(productId);
	
	productDAO.deleteProduct(product);
	
	List<Product> listProducts=productDAO.listProducts();
	m.addAttribute("listProducts",listProducts);
	flag=false;
	return "ProductPage";
}


}
	