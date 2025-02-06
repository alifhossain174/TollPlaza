<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('counter_sessions', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('terminal_id')->nullable();
            $table->string('terminal_name')->nullable();
            $table->unsignedBigInteger('counter_id')->nullable();
            $table->string('counter_name')->nullable();
            $table->unsignedBigInteger('user_id')->nullable();
            $table->string('user_name')->nullable();

            $table->string('checkin_time')->nullable();
            $table->string('checkout_time')->nullable();

            $table->double('opening_balance')->nullable();
            $table->double('closing_balance')->nullable();
            $table->string('balance_missmatch')->nullable()->comment("can be positive/negative");

            $table->string('slug')->nullable();
            $table->tinyInteger('counter_status')->default(1)->comment("1=>Available; 0=>Occupied");
            $table->tinyInteger('status')->default(0)->comment("0=>Pending; 1=>Completed");
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('counter_sessions');
    }
};
