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
        Schema::create('toll_tickets', function (Blueprint $table) {
            $table->id();
            $table->string('ticket_no')->nullable();
            $table->unsignedBigInteger('terminal_id')->nullable();
            $table->string('terminal_name')->nullable();
            $table->unsignedBigInteger('user_id')->nullable();
            $table->string('user_name')->nullable();
            $table->unsignedBigInteger('vehicle_type_id')->nullable();
            $table->string('vehicle_type_name')->nullable();
            $table->double('ticket_price')->default(0);

            $table->string('amount_given')->nullable()->comment("During Transaction");
            $table->string('return_change')->nullable()->comment("During Transaction");

            $table->string('driver_name')->nullable();
            $table->string('driver_contact')->nullable();
            $table->string('vehicle_reg_no')->nullable();

            $table->tinyInteger('payment_method')->comment('1=>Cash;2=>bKash;3=>nagad;4=>Card')->default(1);

            $table->string('slug')->nullable();
            $table->tinyInteger('status')->default(1)->comment('1=>Active; 0=>Inactive');
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
        Schema::dropIfExists('toll_tickets');
    }
};
