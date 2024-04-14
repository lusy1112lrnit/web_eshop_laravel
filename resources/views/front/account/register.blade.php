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

                        @if(session('notification'))
                            <div class="alert alert-warning" role="alert">
                                {{ session('notification') }}
                            </div>
                        @endif

                        <form method="POST" action="">
                            @csrf
                            <div class="form-group">
                                <input class="input" type="text" required="" name="name" id="name" placeholder="Name *">
                            </div>
                            <div class="form-group">
                                <input class="input" type="text" required="" name="email" id="email" placeholder="Email *">
                            </div>
                            <div class="form-group">
                                <input class="input" required="" type="password" name="password" id="pass" placeholder="Password *">
                            </div>
                            <div class="form-group">
                                <input class="input" required="" type="password" name="password_confirmation" id="con-pass" placeholder="Confirm password *">
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
