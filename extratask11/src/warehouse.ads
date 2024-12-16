package Warehouse is

	protected Warehouse_P is
		entry Increment_Stocks;
		entry Transfer(S: in out Natural) ;
	private
		Stock    : Natural := 0;
	end Warehouse_P;

end Warehouse;
