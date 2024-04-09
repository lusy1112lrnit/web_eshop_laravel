@extends('front.layout.master')

@section('title', 'Register')

@section('body')
    <!-- REGISTER -->
    <div id="register">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <div class="register-form">
                        <h2 class="text-center">Đăng Ký</h2>
                        <form method="POST" action="">
                            @csrf
                            <div class="form-group">
                                <input class="input" type="text" required="" name="name" placeholder="Name">
                            </div>
                            <div class="form-group">
                                <input class="input" type="text" required="" name="email" placeholder="Email">
                            </div>
                            <div class="form-group">
                                <input class="input" required="" type="password" name="password" placeholder="Password">
                            </div>
                            <div class="form-group">
                                <input class="input" required="" type="password" name="password_confirmation" placeholder="Confirm password">
                            </div>
                            <div class="login_footer form-group">
                                <div class="chek-form">
                                    <div class="custome-checkbox">
                                        <input class="form-check-input" type="checkbox" name="checkbox" id="exampleCheckbox12" value="">
                                        <label class="form-check-label" for="exampleCheckbox12"><span>I agree to terms &amp; Policy.</span></label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-block btn-lg btn-success" name="login">Submit &amp; Register</button>
                            </div>
                        </form>
                        
                    </div>
                </div>
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /REGISTER -->
@endsection
