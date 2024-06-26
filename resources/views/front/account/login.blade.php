@extends('front.layout.master')

@section('title', 'Login')

@section('body')
    <!-- LOGIN -->
    <div id="login" class="section">
        <!-- container -->
        <div class="container">

            <!-- row -->
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <div class="login-form">
                        <h2 class="text-center">Đăng Nhập</h2>

                        @if(session('notification'))
                            <div class="alert alert-warning" role="alert">
                                {{ session('notification') }}
                            </div>
                        @endif

                        <form action="" method="POST">
                            @csrf
                            <div class="form-group">
                                <input class="input" type="email" name="email" id="email" placeholder="Email">
                            </div>
                            <div class="form-group">
                                <input class="input" type="password" name="password" id="pass" placeholder="Password">
                            </div>
                            <br>
                            {{-- <div class="group-input gi-check">
                                <div class="gi-more">
                                  <label for="save-pass">Save password</label>
                                  <input type="checkbox" id="save-pass" name="remember">
                                </div>
                            </div> --}}
                            <div class="text-center">
                                <button type="submit" class=" btn btn-block btn-lg btn-primary"> Login</button>
                            </div>
                            <hr>
                            <div class="text-center">
                                <button type="button" class=" btn btn-block btn-lg ">
                                    <a href="{{ route('google.login')}}"> Google Login</a>
                                </button>
                            </div>
                            <hr>
                            <div class="relative text-center ">
                                <p>
                                    <a href="./account/register"> Create an Account</a>
                                </p>
                                {{-- <p>
                                    <span class="text-muted"> | </span>
                                    <a href=""> Facebook Login</a>
                                </p> --}}
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- /row -->

        </div>
        <!-- /container -->
    </div>
    <!-- /LOGIN -->
@endsection
