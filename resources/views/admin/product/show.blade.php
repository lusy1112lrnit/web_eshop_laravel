@extends('admin.layout.master')

@section('title', 'Show_Product')

@section('body')

    <!-- Main -->
    <div class="app-main__inner">

        <div class="app-page-title">
            <div class="page-title-wrapper">
                <div class="page-title-heading">
                    <div class="page-title-icon">
                        <i class="pe-7s-ticket icon-gradient bg-mean-fruit"></i>
                    </div>
                    <div>
                        Product
                        <div class="page-title-subheading">
                            View, create, update, delete and manage.
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="main-card mb-3 card">
                    <div class="card-body display_data">

                        <div class="position-relative row form-group">
                            <label for="" class="col-md-3 text-md-right col-form-label">Images</label>
                            <div class="col-md-9 col-xl-8">
                                <ul class="text-nowrap overflow-auto" id="images">

                                    @foreach ($product->productImages as $productImages)

                                        <li class="d-inline-block mr-1" style="position: relative;">
                                            <img style="height: 150px;" src="./front/img/products/{{ $productImages-> path }}"
                                                alt="Image">
                                        </li>

                                    @endforeach
                                    
                                </ul>
                            </div>
                        </div>

                        <div class="position-relative row form-group">
                            <label for="brand_id"
                                class="col-md-3 text-md-right col-form-label">Image</label>
                            <div class="col-md-9 col-xl-8">
                                <p><a href="./product-image.html">Manage images</a></p>
                            </div>
                        </div>

                        <div class="position-relative row form-group">
                            <label for="brand_id"
                                class="col-md-3 text-md-right col-form-label">Product Details</label>
                            <div class="col-md-9 col-xl-8">
                                <p><a href="./product-detail.html">Manage details</a></p>
                            </div>
                        </div>

                        <div class="position-relative row form-group">
                            <label for="brand_id"
                                class="col-md-3 text-md-right col-form-label">Hãng</label>
                            <div class="col-md-9 col-xl-8">
                                <p>{{ $product->brand->name }}</p>
                            </div>
                        </div>

                        <div class="position-relative row form-group">
                            <label for="product_category_id"
                                class="col-md-3 text-md-right col-form-label">Loại</label>
                            <div class="col-md-9 col-xl-8">
                                <p>{{ $product->productCategory->name }}</p>
                            </div>
                        </div>
                    
                        <div class="position-relative row form-group">
                            <label for="name" class="col-md-3 text-md-right col-form-label">Tên Sản Phẩm</label>
                            <div class="col-md-9 col-xl-8">
                                <p>{{ $product->name }}</p>
                            </div>
                        </div>

                        <div class="position-relative row form-group">
                            <label for="content"
                                class="col-md-3 text-md-right col-form-label">Nội dung</label>
                            <div class="col-md-9 col-xl-8">
                                <p>{{ $product->content }}</p>
                            </div>
                        </div>

                        <div class="position-relative row form-group">
                            <label for="price"
                                class="col-md-3 text-md-right col-form-label">Giá</label>
                            <div class="col-md-9 col-xl-8">
                                <p>{{ number_format($product->price, 0, ',', '.') }} VND</p>
                            </div>
                        </div>

                        <div class="position-relative row form-group">
                            <label for="discount"
                                class="col-md-3 text-md-right col-form-label">Giá Giảm</label>
                            <div class="col-md-9 col-xl-8">
                                <p>{{ number_format($product->discount, 0, ',', '.') }} VND</p>
                            </div>
                        </div>

                        <div class="position-relative row form-group">
                            <label for="qty"
                                class="col-md-3 text-md-right col-form-label">Số Lượng</label>
                            <div class="col-md-9 col-xl-8">
                                <p>{{ $product->qty }}</p>
                            </div>
                        </div>

                        {{-- <div class="position-relative row form-group">
                            <label for="weight"
                                class="col-md-3 text-md-right col-form-label">Weight</label>
                            <div class="col-md-9 col-xl-8">
                                <p>1.3</p>
                            </div>
                        </div>
                        
                        <div class="position-relative row form-group">
                            <label for="sku"
                                class="col-md-3 text-md-right col-form-label">SKU</label>
                            <div class="col-md-9 col-xl-8">
                                <p>00012</p>
                            </div>
                        </div>

                        <div class="position-relative row form-group">
                            <label for="tag"
                                class="col-md-3 text-md-right col-form-label">Tag</label>
                            <div class="col-md-9 col-xl-8">
                                <p>Clothing</p>
                            </div>
                        </div> --}}

                        <div class="position-relative row form-group">
                            <label for="featured"
                                class="col-md-3 text-md-right col-form-label">Còn Hàng</label>
                            <div class="col-md-9 col-xl-8">
                                <p>{{ $product->featured ? 'Yes' : 'No'}}</p>
                            </div>
                        </div>

                        <div class="position-relative row form-group">
                            <label for="description"
                                class="col-md-3 text-md-right col-form-label">Mô Tả</label>
                            <div class="col-md-9 col-xl-8">
                                <p>{{ $product->description }}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Main -->

@endsection