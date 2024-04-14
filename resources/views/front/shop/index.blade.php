@extends('front.layout.master')

@section('title', 'Shop')

@section('body')

	<!-- SECTION -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<!-- ASIDE -->
				<div id="aside" class="col-md-3">
					<!-- aside Widget -->
					<div class="aside">
						<h3 class="aside-title">Categories</h3>
						<div class="checkbox-filter">

							<div class="input-checkbox">
								<input type="checkbox" id="category-1">
								<label for="category-1">
									<span></span>
									Laptops
									<small>(120)</small>
								</label>
							</div>

							<div class="input-checkbox">
								<input type="checkbox" id="category-2">
								<label for="category-2">
									<span></span>
									Smartphones
									<small>(740)</small>
								</label>
							</div>

							<div class="input-checkbox">
								<input type="checkbox" id="category-3">
								<label for="category-3">
									<span></span>
									Cameras
									<small>(1450)</small>
								</label>
							</div>

							<div class="input-checkbox">
								<input type="checkbox" id="category-4">
								<label for="category-4">
									<span></span>
									Accessories
									<small>(578)</small>
								</label>
							</div>

							<div class="input-checkbox">
								<input type="checkbox" id="category-5">
								<label for="category-5">
									<span></span>
									Laptops
									<small>(120)</small>
								</label>
							</div>

							<div class="input-checkbox">
								<input type="checkbox" id="category-6">
								<label for="category-6">
									<span></span>
									Smartphones
									<small>(740)</small>
								</label>
							</div>
						</div>
					</div>
					<!-- /aside Widget -->

					<!-- aside Widget -->
					<div class="aside">
						<h3 class="aside-title">Price</h3>
						<div class="price-filter">
							<div id="price-slider"></div>
							<div class="input-number price-min">
								<input id="price-min" type="number">
								<span class="qty-up">+</span>
								<span class="qty-down">-</span>
							</div>
							<span>-</span>
							<div class="input-number price-max">
								<input id="price-max" type="number">
								<span class="qty-up">+</span>
								<span class="qty-down">-</span>
							</div>
						</div>
					</div>
					<!-- /aside Widget -->

					<!-- aside Widget -->
					<div class="aside">
						<h3 class="aside-title">Brand</h3>
						<div class="checkbox-filter">
							<div class="input-checkbox">
								<input type="checkbox" id="brand-1">
								<label for="brand-1">
									<span></span>
									SAMSUNG
									<small>(578)</small>
								</label>
							</div>
							<div class="input-checkbox">
								<input type="checkbox" id="brand-2">
								<label for="brand-2">
									<span></span>
									LG
									<small>(125)</small>
								</label>
							</div>
							<div class="input-checkbox">
								<input type="checkbox" id="brand-3">
								<label for="brand-3">
									<span></span>
									SONY
									<small>(755)</small>
								</label>
							</div>
							<div class="input-checkbox">
								<input type="checkbox" id="brand-4">
								<label for="brand-4">
									<span></span>
									SAMSUNG
									<small>(578)</small>
								</label>
							</div>
							<div class="input-checkbox">
								<input type="checkbox" id="brand-5">
								<label for="brand-5">
									<span></span>
									LG
									<small>(125)</small>
								</label>
							</div>
							<div class="input-checkbox">
								<input type="checkbox" id="brand-6">
								<label for="brand-6">
									<span></span>
									SONY
									<small>(755)</small>
								</label>
							</div>
						</div>
					</div>
					<!-- /aside Widget -->

					<!-- aside Widget -->
					<div class="aside">
						<h3 class="aside-title">Top selling</h3>
						<div class="product-widget">
							<div class="product-img">
								<img src="front/img/product01.png" alt="">
							</div>
							<div class="product-body">
								<p class="product-category">Category</p>
								<h3 class="product-name"><a href="#">product name goes here</a></h3>
								<h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
							</div>
						</div>

						<div class="product-widget">
							<div class="product-img">
								<img src="front/img/product02.png" alt="">
							</div>
							<div class="product-body">
								<p class="product-category">Category</p>
								<h3 class="product-name"><a href="#">product name goes here</a></h3>
								<h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
							</div>
						</div>

						<div class="product-widget">
							<div class="product-img">
								<img src="front/img/product03.png" alt="">
							</div>
							<div class="product-body">
								<p class="product-category">Category</p>
								<h3 class="product-name"><a href="#">product name goes here</a></h3>
								<h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
							</div>
						</div>
					</div>
					<!-- /aside Widget -->
				</div>
				<!-- /ASIDE -->

				<!-- STORE -->
				<div id="store" class="col-md-9">

					<!-- store products -->
					<div class="row">
						@foreach ($products as $product)
							<!-- product -->
							<div class="col-md-4 col-xs-6">
								<div class="product">
									<div class="product-img">
										<img src="front/img/products/{{ $product -> productImages[0]-> path }}" alt="">
									</div>
									<div class="product-body">
										<p class="product-category">Điện Thoại</p>
										<h3 class="product-name"><a href="#">{{ $product -> name }}</a></h3>
										<h4 class="product-price">{{ number_format($product->discount, 0, ',', '.') }} VND <del class="product-old-price">{{ number_format($product->price, 0, ',', '.') }} VND</del></h4>
										<div class="product-rating">
											<br><p>Đánh Giá ({{count($product -> productComments)}}) | Thêm Đánh Giá</p></br>
										</div>
										<div class="product-btns">
											<br>
											<button class="quick-view">
												<a href="./shop/product/{{ $product->id }}">
													<i class="fa fa-eye"></i><span class="tooltipp">Chi Tiết</span>
												</a>
											</button>
										</div>
									</div>
									<div class="add-to-cart">
										<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ</button>
									</div>
								</div>
							</div>
							<!-- /product -->
						<div class="clearfix visible-sm visible-xs"></div>
						@endforeach
						
					</div>
					<!-- /store products -->

					<!-- store bottom filter -->
					
					<div class="store-filter clearfix">
						<ul class="store-pagination">
							<!--Nút Trang Trước-->
							@if ($products->onFirstPage())
								<li class="disabled"><span>&laquo;</span></li>
							@else
								<li><a href="{{ $products->previousPageUrl() }}">&laquo;</a></li>
							@endif
							
							<!--Nút Các trang-->
							@for ($i = 1; $i <= $products->lastPage(); $i++)
								<li class="{{ $products->currentPage() == $i ? 'active' : '' }}">
									<a href="{{ $products->url($i) }}">{{ $i }}</a>
								</li>
							@endfor
					
							<!--Nút trang tiếp theo-->
							@if ($products->hasMorePages())
								<li><a href="{{ $products->nextPageUrl() }}">&raquo;</a></li>
							@else
								<li class="disabled"><span>&raquo;</span></li>
							@endif
						</ul>						
					</div>
					<!-- /store bottom filter -->
				</div>
				<!-- /STORE -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /SECTION -->

@endsection
