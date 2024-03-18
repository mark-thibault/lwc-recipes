public without sharing class M5_Examples 
{
	public M5_Examples() {}

	public class OrderLineItem
	{
		public Integer productId;
		public Decimal price;
	}

	public class CoffeeOrder
	{
		public Decimal amount;
		public List<OrderLineItem> orderLineItems;
		private Boolean paid;

		public Boolean markOrderAsPaid()
		{
			this.paid = true;
			return this.paid;
		}
	
		public CoffeeOrder(){}
	
		public CoffeeOrder(List<OrderLineItem> orderLineItems)
		{
			this.orderLineItems = orderLineItems;
		}
	}

	public void listOrSetIterationForLoop()
	{
		List<String> beverageNames = new List<String>
		{
			'Drip Brew',
			'Iced Coffee',
			'Espresso',
			'Frappe'
		};

		for (String beverageName : beverageNames)
		{
			System.debug('beverageName: ' + beverageName);
		}
	}

	public void referencingListElements()
	{
		List<String> beverageNames = new List<String>
		{
			'Drip Brew',
			'Iced Coffee',
			'Espresso',
			'Frappe'
		};

		// The first element always starts at zero
		Integer firstElement = 0;
		String dripBrew = beverageNames[firstElement];
		System.debug(dripBrew);

		// The second element
		String icedCoffee = beverageNames[1];
		System.debug(icedCoffee);
	}

	public void traditionalForLoop()
	{
		List<String> beverageNames = new List<String>
		{
			'Drip Brew',
			'Iced Coffee',
			'Espresso',
			'Frappe'
		};

		for (Integer i = 0; i < beverageNames.size(); i++)
		{
			String beverageName = beverageNames[i];
			System.debug(beverageName);
		}
	}

	// Thanks to the work of those like Paul Battisson, Andrew Fawcett,
	// and Andy Mahood.
	// https://paulbattisson.com/blog/2014/force-com-cast-episode-6-faster-loops/
	// https://paulbattisson.com/blog/2014/force-com-casts-episode-7-faster-loops-part-2/
	public void speedyForLoop()
	{
		List<String> beverageNames = new List<String>
		{
			'Drip Brew',
			'Iced Coffee',
			'Espresso',
			'Frappe'
		};

		Integer beverageNamesSize = beverageNames.size();
		for (Integer i = 0, j = beverageNamesSize; i < j; i++)
		{
			String beverageName = beverageNames[i];
			System.debug(beverageName);
		}
	}

	public void whileLoop()
	{
		List<String> beverageNames = new List<String>
		{
			'Drip Brew',
			'Iced Coffee',
			'Espresso',
			'Frappe'
		};

		Integer row = 0;

		while (row < beverageNames.size())
		{
			String beverageName = beverageNames[row];
			System.debug(beverageName);
			row += 1; // Or row++; would also work
		}
	}

	public void doWhileLoop()
	{
		List<String> beverageNames = new List<String>
		{
			'Drip Brew',
			'Iced Coffee',
			'Espresso',
			'Frappe'
		};

		Integer row = 0;
		do 
		{
			String beverageName = beverageNames[row];
			System.debug(beverageName);
			row++;
		} while (row < beverageNames.size());
	}
}