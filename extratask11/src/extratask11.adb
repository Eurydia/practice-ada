with Ada.Calendar; use Ada.Calendar;
with Ada.Text_IO; use Ada.Text_IO;
with Warehouse; use Warehouse;
with Scheduler; use Scheduler;
with Utility; use Utility;

procedure Extratask11 is


	task type Shop is
		entry Notify;
		entry Sell;
	end Shop;

	task body Shop is
		Collected  : Natural := 0;
		Sold       : Natural := 0;
		Stocked    : Natural := 0;
		Is_Active  : Boolean := True;
	begin
		while Is_Active loop
			Scheduler.Scheduler.Is_Active(Is_Active);
			select
				when Is_Active =>
					accept Notify do
						Warehouse_P.Transfer(Stocked);
						Collected := Collected + 1;
					end;
					Printer.Put("Shop: Transfered an item");
			or
				when Is_Active =>
					accept Sell do
						delay 0.2;
						if Stocked > 0 then
							Stocked := Stocked - 1;
							Sold := Sold + 1;
							Printer.Put("Shop: Sold an item");
						else
							Printer.Put("Shop: No item in stock");
						end if;
					end;
			or
				delay 0.1;
			end select;
		end loop;
		Printer.Put("Shop: Items collected from warehouse:" & Natural'Image(Collected) & ", Items sold:" & Natural'Image(Sold) & ", Leftover in stock:" & Natural'Image(Stocked));
	end Shop;

	-- Spawns five shops here
	type Rand_Range is new Natural range 1..5;
	type Shop_Arr is array (Rand_Range) of Shop;
	Shops: Shop_Arr;

	package Nat_Rand is new Utility.Random_Generator(Rand_Range);
	use Nat_Rand;
	-- The buyer selects a store at random
	-- it attempts to buy a product from the store
	-- if success, it leaves the store
	-- if the product is out of stock, it leaves the store and terminates
	-- (it will not attempt to make another purchase
	task type Buyer is
		entry Spawn(Id: in Natural; S_Delay, I_Delay: in Duration);
	end Buyer;

	task body Buyer is
		I              : Rand_Range;
		Shop_Pick_Delay: Duration;
		Item_Pick_Delay: Duration;
		B_Id           : Natural;
		Is_Active      : Boolean;
	begin

		accept Spawn(Id: in Natural; S_Delay, I_Delay: in Duration) do
			Shop_Pick_Delay := S_Delay;
			Item_Pick_Delay := I_Delay;
			B_Id := Id;
		end Spawn;

		Printer.Put("Buyer #" & Natural'Image(B_Id) & ": Picking a store");
		I := Nat_Rand.Get_Rand;
		delay Shop_Pick_Delay; -- picking a shop
		Scheduler.Scheduler.Is_Active(Is_Active);

		if Is_Active then
			Printer.Put("Buyer #" & Natural'Image(B_Id) & ": Picking an item");
			delay Item_Pick_Delay; -- Picking an item
			Scheduler.Scheduler.Is_Active(Is_Active);
			if Is_Active then
				Printer.Put("Buyer #" & Natural'Image(B_Id) & ": Done");
				Shops(I).Sell;
			else
				Printer.Put("Buyer #" & Natural'Image(B_Id) & ": Took too long to pick an item");
			end if;
		else
			Printer.Put("Buyer #" & Natural'Image(B_Id) & ": Took too long to pick a store");
		end if;
			Printer.Put("Buyer #" & Natural'Image(B_Id) & ": Stopped");
	end Buyer;

	task Buyer_Spawner is
		entry Start(C, S_Delay, I_Delay: in Duration);
	end Buyer_Spawner;

	task body Buyer_Spawner is
		Cooldown_Period: Duration;
		Is_Active      : Boolean := True;
		B_Id           : Natural := 0;
		Shop_Pick_Delay: Duration;
		Item_Pick_Delay: Duration;
	begin
		accept Start(C, S_Delay, I_Delay: in Duration) do
			Cooldown_Period := C;
			Shop_Pick_Delay := S_Delay;
			Item_Pick_Delay := I_Delay;
		end Start;

		while Is_Active loop
			declare
				T : Buyer;
			begin
				T.Spawn(B_Id, Shop_Pick_Delay, Item_Pick_Delay);
				Printer.Put("Spawner: Spanwed a buyer");
			end;
			B_Id := B_Id + 1;

			Scheduler.Scheduler.Is_Active(Is_Active);
			if Is_Active then
				Printer.Put("Spawner: Sleeping");
				delay Cooldown_Period;
			else
				exit;
			end if;
		end loop;
		Printer.Put("Spawner: Stopped");
	end Buyer_Spawner;



	-- Spawns new stocks
	-- The truck always notify a random vut valid store
	-- so it will terminate when the scheduler stops
	task Delivery_Truck is
		entry Start(D: in Duration);
	end Delivery_Truck;

	task body Delivery_Truck is
		Is_Active   : Boolean := True;
		Delay_Period: Duration;
		I           : Rand_Range;
	begin
		accept Start(D: in Duration) do
			Delay_Period := D;
		end;
		while Is_Active loop
			Scheduler.Scheduler.Is_Active(Is_Active);
			select
				Warehouse_P.Increment_Stocks;
				Printer.Put("Delivery Truck: Dropping off a cargo");
				delay Delay_Period;
				I := Nat_Rand.Get_Rand;
				Printer.Put("Delivery Truck: Notifying a store");
				Shops(I).Notify;
			or
				delay Delay_Period;
				Printer.Put("Delivery Truck: Sleeping");
			end select;
		end loop;
		Printer.Put("Delivery Truck: Stopped");
	end Delivery_Truck;

begin
	Scheduler.Scheduler.Init(Active_Duration => 5.0,
								  Timeout_Period  => 2.5);
	Delivery_Truck.Start(0.1);
	Buyer_Spawner.Start(0.3, 0.4, 0.1);

end Extratask11;
