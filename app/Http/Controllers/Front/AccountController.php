<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AccountController extends Controller
{
    //
    public function login()
    {
        return view('front.account.login');
    }

    public function checkLogin(Request $request)
    {

        $credentials = [
            'email' => $request->email,
            'password' => $request->password,
            'level' => 2, // Tài khoản cấp độ khách hàng bình thường.
        ];

        $remember = $request->remember;

        if (Auth::attempt($credentials, $remember)) {
            return redirect(''); //trang chủ
        } 
        else 
        {
            return back()
                ->with('notification', 'ERROR: Email or password is wrong');
        }

    }

    public function logout()
    {
        Auth::logout();

        return back();
    }

    public function register()
    {
        return view('front.account.register');
    }
}
