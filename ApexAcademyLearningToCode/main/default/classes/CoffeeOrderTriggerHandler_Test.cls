@IsTest (isParallel = true)
public without sharing class CoffeeOrderTriggerHandler_Test 
{
	public static final String ASSERTION_MESSAGE = 'Datetime should populate with the now datetime.';

	@isTest
	static void testInsert() 
	{
		// Create a new Coffee_Order__c record with an Order_Total__c value.
		Coffee_Order__c coffeeOrder = new Coffee_Order__c(Order_Total__c = 10.00);

		// Insert the record.
		insert coffeeOrder;

		// Verify that the Received_Order_Total__c field was set.
		Coffee_Order__c insertedCoffeeOrder = [
			SELECT Id, Name,
				Received_Order_Total__c 
			FROM Coffee_Order__c 
			WHERE Id = :coffeeOrder.Id];
		
		Assert.isTrue(insertedCoffeeOrder.Received_Order_Total__c != null,
			'Datetime should populate with the now datetime.');
	}

	@isTest
	static void testUpdate()
	{
		// Given:
		Coffee_Order__c coffeeOrder = new Coffee_Order__c(Order_Total__c = null);
		insert coffeeOrder;

		Coffee_Order__c coffeeOrderAfterInsert = [
			SELECT Id, Name, Order_Total__c, Received_Order_Total__c
			FROM Coffee_Order__c
			WHERE Id = :coffeeOrder.Id
		];

		Assert.isNull(coffeeOrderAfterInsert.Received_Order_Total__c,
			'Expected no Received Order Total field value prior to Order Total');

		coffeeOrder.Order_Total__c = 10.00;

		// When:
		Test.startTest();
		update coffeeOrder;
		Test.stopTest();

		// Then:
		Coffee_Order__c updatedCoffeeOrder = [
			SELECT Id, Name, Order_Total__c, Received_Order_Total__c
			FROM Coffee_Order__c
			WHERE Id = :coffeeOrder.Id
		];

		Assert.isNotNull(updatedCoffeeOrder.Received_Order_Total__c,
			ASSERTION_MESSAGE);
	}

	@isTest
	static void receiveOrderTotal()
	{
		// Create a new Coffee_Order__c object with an Order_Total__c value.
		Coffee_Order__c coffeeOrder = new Coffee_Order__c(Order_Total__c = 10.00);

		// Call the receiveOrderTotal method of the CoffeeOrderTriggerHandler class.
		CoffeeOrderTriggerHandler handler = new CoffeeOrderTriggerHandler();
		Coffee_Order__c updatedCoffeeOrder = handler.receiveOrderTotal(coffeeOrder, null);

		// Verify that the Received_Order_Total__c field was set.
		Assert.isTrue(updatedCoffeeOrder.Received_Order_Total__c != null,
			ASSERTION_MESSAGE);
	}

	@isTest
	static void testRun() {
		// Create two new Coffee_Order__c objects with Order_Total__c values.
		Coffee_Order__c coffeeOrder1 = new Coffee_Order__c(Order_Total__c = 10.00);
		Coffee_Order__c coffeeOrder2 = new Coffee_Order__c(Order_Total__c = 20.00);

		// Create a new CoffeeOrderTriggerHandler object with the two Coffee_Order__c records.
		CoffeeOrderTriggerHandler handler = new CoffeeOrderTriggerHandler();
		handler.coffeeOrders = new List<Coffee_Order__c>{ coffeeOrder1, coffeeOrder2 };
		handler.oldCoffeeOrders = null;

		// Call the run method of the CoffeeOrderTriggerHandler class.
		handler.run();

		// Verify that the Received_Order_Total__c fields were set for both Coffee_Order__c records.
		Assert.isTrue(coffeeOrder1.Received_Order_Total__c != null,
			ASSERTION_MESSAGE);
		
		Assert.isTrue(coffeeOrder2.Received_Order_Total__c != null,
			ASSERTION_MESSAGE);
	}
}