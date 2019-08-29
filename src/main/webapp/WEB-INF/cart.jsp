<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Your Shopping Cart</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="assets/css/style1.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link href="https://fonts.googleapis.com/css?family=Barlow:400,600,700|Lexend+Deca&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>

<body>
    <!-- Nav bar -->
    <div class="navbar header py-4">
        <div class="container col-9 main">
            <h4 class="name"><a href="/home" class="text-light">Warehouse</a></h4>

            <form class="form-inline my-2 my-lg-0 col-7">
                <div class="input-group col-12 p-0">
                    <input class="form-control" type="search" placeholder="Search by product or category"
                        aria-label="Search">
                    <div class="input-group-append">
                        <button class="btn btn-info my-2 my-sm-0" type="submit">
                            <img src="https://img.icons8.com/ios-filled/20/000000/search.png" class="invert">
                        </button>
                    </div>
                </div>
            </form>
            <div class="d-inline-block header__action-item-content">
	            <a href="" class="text-light d-block" id="login">Login / Signup</a>
	            <div id="popup" class="popover popover--large popover--unlogged p-4" aria-hidden="true">
	            	
	            	<div class="popover__panel-list" style="" id="popover-list">
	            		<div class="popover__panel popover__panel--default" id="loginPanel">
	            			<h5 class="blue">Login to my account</h5>
			            	<p>Enter your email and password</p>
			            	<form action="/login" method="post">
			            		<div class="form-group">
			            			<input class="form-control rounded-0" placeholder="Email">
			            		</div>
			            		<div class="form-group">
			            			<input class="form-control rounded-0" placeholder="Password">
			            		</div>
			            		<button type="submit" class="btn btn-block btn-info rounded-0">Login</button>
			            	</form>
			            	<p class="my-3">New customer? <a href="" class="current-category-color" id="createAccount">Create your account</a></p>
	            		</div>
	            		<div class="popover__panel popover__panel--sliding" id="registerPanel">
		            		<h5 class="blue">Create my account</h5>
		            		<p>Please fill in the information below:</p>
			            	<form action="/register" method="post">
			            		<div class="form-group">
			            			<input class="form-control rounded-0" placeholder="First name">
			            		</div>
			            		<div class="form-group">
			            			<input class="form-control rounded-0" placeholder="Last name">
			            		</div>
			            		<div class="form-group">
			            			<input class="form-control rounded-0" placeholder="Email">
			            		</div>
			            		<div class="form-group">
			            			<input class="form-control rounded-0" placeholder="Password">
			            		</div>
			            		<button type="submit" class="btn btn-block btn-info rounded-0">Create my account</button>
			            	</form>
			            	<p class="my-3">Already have an account? <a href="" class="current-category-color" id="loginAccount">Login here</a></p>	
	            		</div>
	            	</div>
	            	
	            </div>
	        </div>
            <div>
                <a href="/cart" class="text-light">
                    <img src="/assets/images/cart-copy.png" alt="shopping-cart" style="width:30px" class="cart invert">
                    Cart
                </a>
            </div>
        </div>

    </div>

    <div class="container my-5 col-9 main">
    	<h3 class="title">My Cart</h3>
    	<div class="row">
    		<div class="col-9">
		        <table class="">
		            <thead class="border">
		                <tr>
		                    <th>Product</th>
		                    <th id="quantity">Quantity</th>
		                    <th id="total">Total</th>
		                </tr>
		            </thead>
		            <tbody class="border">
		                <tr class="">
		                    <td class="col-4">
		                        <img src="https://static.bhphoto.com/images/images1000x1000/1529939904_1417335.jpg"
		                            alt="speakers" class="col-3 d-inline-block">
		                        <div class="d-inline-block align-bottom">
		                            <small class="text-muted">Brand</small>
		                            <a href="">
		                                <p class="blue">Product title</p>
		                            </a>
		                            <p class="price h5">$100</p>
		                        </div>
		                    </td>
		                    <td class="text-center col-6">
		                        <input type="number" min="0" value="1">
		                        <a href="" class="text-muted"><small>Remove</small></a>
		                    </td>
		                    <td class="col-2">
		                        <p>$100</p>
		                    </td>
		                </tr>
		
		            </tbody>
		        </table>
    		</div>
    		<div class="col-3 border">
    			<div class="">
    				<div class="row justify-content-between">
    					<p class="blue col-1">Total</p>
    					<p class="blue col-1">$134.90</p>
    				</div>
    				<a class="text-light btn btn-info btn-block rounded-0">Checkout</a>
    			</div>
    		</div>
    	</div>
  
    </div>
    <footer class="gray p-5 text-center">
        <small class="text-muted">� Warehouse by Tedman and Kathy</small>
    </footer>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>