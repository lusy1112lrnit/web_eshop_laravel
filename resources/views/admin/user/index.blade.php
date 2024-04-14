@extends('admin.layout.master')

@section('title', 'User')

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
                        User
                        <div class="page-title-subheading">
                            View, create, update, delete and manage.
                        </div>
                    </div>
                </div>

                <div class="page-title-actions">
                    <a href="./admin/user/create" class="btn-shadow btn-hover-shine mr-3 btn btn-primary">
                        <span class="btn-icon-wrapper pr-2 opacity-7">
                            <i class="fa fa-plus fa-w-20"></i>
                        </span>
                        Create
                    </a>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="main-card mb-3 card">

                    <div class="card-header">

                        <form>
                            <div class="input-group">
                                <input type="search" name="search" id="search" value="{{ request('search')}}"
                                    placeholder="Search everything" class="form-control">
                                <span class="input-group-append">
                                    <button type="submit" class="btn btn-primary">
                                        <i class="fa fa-search"></i>&nbsp;
                                        Search
                                    </button>
                                </span>
                            </div>
                        </form>

                        <div class="btn-actions-pane-right">
                            <div role="group" class="btn-group-sm btn-group">
                                <button class="btn btn-focus">This week</button>
                                <button class="active btn btn-focus">Anytime</button>
                            </div>
                        </div>
                    </div>

                    <div class="table-responsive">
                        <table class="align-middle mb-0 table table-borderless table-striped table-hover">
                            <thead>
                                <tr>
                                    <th class="text-center">ID</th>
                                    <th>Full Name</th>
                                    <th class="text-center">Email</th>
                                    <th class="text-center">Level</th>
                                    <th class="text-center">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($users as $user)

                                <tr>
                                    <td class="text-center text-muted">#{{$user->id}}</td>
                                    <td>
                                        <div class="widget-content p-0">
                                            <div class="widget-content-wrapper">
                                                <div class="widget-content-left mr-3">
                                                    <div class="widget-content-left">
                                                        <img width="40" class="rounded-circle"
                                                            data-toggle="tooltip" title="Image"
                                                            data-placement="bottom"
                                                            src="front/img/users/{{ $user->avatar ?? 'avatar-user.png' }}" alt="avatar">
                                                    </div>
                                                </div>
                                                <div class="widget-content-left flex2">
                                                    <div class="widget-heading">{{$user->name}}</div>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="text-center">{{$user->email}}</td>
                                    <td class="text-center">
                                        @if($user->level == 0)
                                            {{ 'Host' }}
                                        @elseif($user->level == 1)
                                            {{ 'Amin' }}
                                        @elseif($user->level == 2)
                                            {{ 'Client' }}
                                        @endif
                                        {{-- {{ \App\Utilities\Constant::$user_level[$user->level]}} --}}
                                    </td>
                                    <td class="text-center">
                                        <a href="./admin/user/{{$user->id}}"
                                            class="btn btn-hover-shine btn-outline-primary border-0 btn-sm">
                                            Details
                                        </a>
                                        <a href="./admin/user/{{$user->id}}/edit" data-toggle="tooltip" title="Edit"
                                            data-placement="bottom" class="btn btn-outline-warning border-0 btn-sm">
                                            <span class="btn-icon-wrapper opacity-8">
                                                <i class="fa fa-edit fa-w-20"></i>
                                            </span>
                                        </a>
                                        <form class="d-inline" action="./admin/user/{{$user->id}}" method="POST">

                                            @csrf
                                            @method('Delete')

                                            <button class="btn btn-hover-shine btn-outline-danger border-0 btn-sm"
                                                type="submit" data-toggle="tooltip" title="Delete"
                                                data-placement="bottom"
                                                onclick="return confirm('Do you really want to delete this item?')">
                                                <span class="btn-icon-wrapper opacity-8">
                                                    <i class="fa fa-trash fa-w-20"></i>
                                                </span>
                                            </button>
                                            
                                        </form>
                                    </td>
                                </tr>

                                @endforeach
                                
                            </tbody>
                        </table>
                    </div>
                    <!-- Phân Trang -->
                    <div class="d-block card-footer">
                        {{-- <nav role="navigation" aria-label="Pagination Navigation" class="flex items-center justify-between">
                            <!-- Nút điều hướng phân trang -->
                            @if ($users->onFirstPage())
                                <span class="relative inline-flex items-center px-4 py-2 text-sm font-medium text-gray-500 bg-white border border-gray-300 cursor-default leading-5 rounded-md">
                                    « Previous
                                </span>
                            @else
                                <a href="{{ $users->previousPageUrl() }}" class="relative inline-flex items-center px-4 py-2 ml-3 text-sm font-medium text-gray-700 bg-white border border-gray-300 leading-5 rounded-md hover:text-gray-500 focus:outline-none focus:shadow-outline-blue focus:border-blue-300 active:bg-gray-100 active:text-gray-700 transition ease-in-out duration-150">
                                    « Previous
                                </a>
                            @endif
                    
                            <!-- Số trang hiện tại và nút điều hướng -->
                            <div>
                                <p class="text-sm text-gray-700 leading-5">
                                    Showing
                                    <span class="font-medium">{{ $users->firstItem() }}</span>
                                    to
                                    <span class="font-medium">{{ $users->lastItem() }}</span>
                                    of
                                    <span class="font-medium">{{ $users->total() }}</span>
                                    results
                                </p>
                            </div>
                    
                            <!-- Nút điều hướng phân trang tiếp theo -->
                            @if ($users->hasMorePages())
                                <a href="{{ $users->nextPageUrl() }}" rel="next" class="relative inline-flex items-center px-4 py-2 -ml-px text-sm font-medium text-gray-700 bg-white border border-gray-300 leading-5 hover:text-gray-500 focus:z-10 focus:outline-none focus:border-blue-300 focus:shadow-outline-blue active:bg-gray-100 active:text-gray-700 transition ease-in-out duration-150" aria-label="Next &raquo;">
                                    Next »
                                </a>
                            @else
                                <span class="relative inline-flex items-center px-4 py-2 -ml-px text-sm font-medium text-gray-500 bg-white border border-gray-300 cursor-default leading-5 rounded-md">
                                    Next »
                                </span>
                            @endif
                        </nav> --}}
                        {{ $users -> links() }}
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
    <!-- End Main -->

@endsection