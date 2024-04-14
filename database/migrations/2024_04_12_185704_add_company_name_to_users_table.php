<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddCompanyNameToUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('users', function (Blueprint $table) {
            //
            $table->string('company_name')->nullable()->after('password');
            $table->string('country')->nullable()->after('company_name');
            $table->string('street_address')->nullable()->after('country');
            $table->string('postcode_zip')->nullable()->after('street_address');
            $table->string('town_city')->nullable()->after('postcode_zip');
            $table->string('phone')->nullable()->after('town_city');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('users', function (Blueprint $table) {
            //
        });
    }
}
