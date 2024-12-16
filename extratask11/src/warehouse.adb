with Scheduler; use Scheduler;
with Utility; use Utility;

package body Warehouse is

	protected body Warehouse_P is
		entry Increment_Stocks when true is
		begin
			Stock := Stock + 1;
			Printer.Put("Warehouse: Got an item");
		end Increment_Stocks;

		entry Transfer(S: in out Natural) when Stock > 0 is
		begin
			Stock := Stock - 1;
			S := S + 1;
			Printer.Put("Warehouse: Transferred an item");
		end Transfer;
	end Warehouse_P;
end Warehouse;
