<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use App\Service\User\UserServiceInterface;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AccountController extends Controller
{
    //
    private $userService;

    public function __construct(UserServiceInterface $userService)
    {
        $this -> userService = $userService;
    }

    public function login()
    {
        return view('front.account.login');
    }

    // public function checkLogin(Request $request)
    // {

    //     $credentials = [
    //         'email' => $request->email,
    //         'password' => $request->password,
    //         'level' => 2, // Tài khoản cấp độ khách hàng bình thường.
    //     ];

    //     $remember = $request->remember;

    //     if (Auth::attempt($credentials, $remember)) {
    //         return redirect(''); //trang chủ
    //     } 
    //     else 
    //     {
    //         return back()
    //             ->with('notification', 'ERROR: Email hoặc mật khẩu sai !');
    //     }

    // }

    public function checkLogin(Request $request)
    {
        $credentials = $request->only('email', 'password');

        $remember = $request->filled('remember');

        if (Auth::attempt($credentials, $remember)) {
            return redirect(''); // Chuyển hướng đến trang chủ sau khi đăng nhập thành công
        } else {
            return back()->with('notification', 'ERROR: Email hoặc mật khẩu sai !');
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

    public function postRegister(Request $request)
    {
        // Kiểm tra mật khẩu xác nhận
        if ($request->password != $request->password_confirmation) {
            return back()
                ->with('notification', 'ERROR: Mật khẩu xác nhận không khớp');
        }

        // Tạo dữ liệu người dùng
        $data = [
            'name' => $request->name,
            'email' => $request->email,
            'password' => bcrypt($request->password),
            'level' => 2, // Mức độ mặc định: khách hàng bình thường
        ];

        // Lưu trữ người dùng mới
        $this -> userService -> create($data);

        // Thông báo và chuyển hướng đến trang đăng nhập
        return redirect('account/login')
            ->with('notification', 'Đăng ký thành công! Vui lòng đăng nhập.');
    }


}
