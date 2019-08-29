<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><c:out value="${category.name}"/></title>
    <link href="https://fonts.googleapis.com/css?family=Barlow:400,600,700|Lexend+Deca&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="/assets/css/style.css">
    <link rel="stylesheet" href="/assets/css/style1.css">
</head>

<body class="container-fluid p-0 category-page-background">
    <!-- Nav bar -->
    <div class="navbar header py-4">
        <div class="container-fluid col-9 main">
            <a href="/home">
                <h4 class="text-light name">Warehouse</h4>
            </a>
            <form class="form-inline my-2 my-lg-0 col-8">
                <div class="input-group col-10">
                    <input class="form-control" type="search" placeholder="Search by product or category"
                        aria-label="Search">
                    <div class="input-group-append">
                        <button class="btn btn-info my-2 my-sm-0" type="submit">
                            <img src="https://img.icons8.com/ios-filled/20/000000/search.png" class="invert">
                        </button>
                    </div>
                </div>
            </form>
            <a href="" class="text-light">Login / Signup</a>
            <div>
                <a href="/cart" class="text-light">
                    <img src="/assets/images/cart-copy.png" alt="shopping-cart" style="width:30px" class="cart invert">
                    Cart
                </a>
            </div>
        </div>
    </div>
    <div class="container my-3 main">
    	<div class="row gray-text mx-0">
            <a href="/home" class="gray-text">Home</a>
            <p class="mx-1"> > <c:out value="${category.name}"/></p>
        </div>
    	<div class="row justify-content-between">
	    	<div class="col-3">
		        <div class="category-page-borders col-12 category-page-left-navbar p-4 d-inline-block align-top">
		            <h6 class="collection-color mb-3">Collections</h6>
		            <c:forEach items="${categories}" var="category">
		            	<div><a href="/category/${category.id}" class="current-category-text-color"><c:out value="${category.name} (${category.products.size()})"/></a></div>
		            </c:forEach>
		            
		        </div>
		    </div>
		    <div class="col-9">
		        <div class="category-page-borders col-12 d-inline-block align-top container-fluid p-0 background-white">
		            <div class="category-image mb-3 category-page-borders"></div>
		            <h3 class="collection-color mb-3 mx-4 title"><c:out value="${category.name}"/></h3>
		            <div class="container-fluid">
		                <div class="row">
		                	<c:forEach items="${category.products}" var="product">
			                    <div class="col-3 category-page-borders-second text-center pt-3 ">
			                        <img src="${product.image}"
			                            class="product-image">
			                        <a href="#" class="collection-color"><c:out value="${product.name}"/></a>
			                        <p class="current-category-text-color">$<c:out value="${product.price}"/></p>
			                        <p class="current-category-text-color mt-2"><c:out value="${product.numPurchased}/${product.cap}"/></p>
			                        <button class="btn product-button mb-3">Add to Cart</button>
			                    </div>
		                    </c:forEach>
		                </div>
		            </div>
		
		        </div>
	        </div>
	    </div>
        <div class="container my-5 col-12">
            <div class="row justify-content-between">
                <div class="box1 col-4 rounded">
                    <h5>Category 1</h5>
                    <button class="btn btn-light">Shop Category 1</button>
                </div>
                <div class="box2 col-3 rounded">
                    <h5>Category 2</h5>
                    <button class="btn btn-light">Shop Category 2</button>
                </div>
                <div class="box3 col-4 rounded">
                    <h5>Category 3</h5>
                    <button class="btn btn-light">Shop Category 3</button>
                </div>
            </div>
        </div>
        <hr>
    </div>
    <footer class="gray p-5 text-center">
        <small class="text-muted">© Warehouse by Tedman and Kathy</small>
    </footer>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>