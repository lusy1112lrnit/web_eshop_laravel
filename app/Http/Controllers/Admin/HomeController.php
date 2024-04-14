<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    //
    public function getLogin()
    {
        return view('admin.login');
    }

    public function postLogin(Request $request)
    {
        $credentials = $request->only('email', 'password');

        $remember = $request->filled('remember');

        if (Auth::attempt($credentials, $remember)) {
            $user = Auth::user();
            if ($user->level <= 1) {
                return redirect('admin/user');
            } else {
                return redirect('admin/login');
            }
        } else {
            return back()
                ->with('notification', 'ERROR: Email hoặc mật khẩu sai !');
        }
    }

    public function logout()
    {
        Auth::logout();

        return redirect('admin/login');
    }

}
