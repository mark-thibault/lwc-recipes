public without sharing class M6_Examples
{
	public void weirdStuffInApex()
	{
		// There's other ways of defining lists, and this
		// below is the exact same thing as a List<Account> type
		// The only difference syntactically is that this uses brackets
		Account[] accounts = new Account[]
		{
			new Account(Name = 'Wired Brain'),
			new Account(Name = 'Globomantics')
		};
		System.debug('accounts.size(): ' + accounts.size());


		// System.now() and Datetime.now() appear to return the same thing
		Datetime systemNow = System.now();
		Datetime datetimeNow = Datetime.now();

		System.debug('systemNow: ' + systemNow);
		System.debug('datetimeNow: ' + datetimeNow);
	}

	public void escapeSequencesInStrings()
	{
		// Strings can have new lines in them but that cannot be expressed
		// without escape sequence characters - \n is the way to express a new line
		System.debug('This\nprints\non\nmultiple\nlines.');

		// Quotes also require special escape sequences using \''
		System.debug('This is most definitely a \'debug statement\'.');

		// See the Salesforce documentation for a full list of escape sequences:
		// https://help.salesforce.com/s/articleView?id=sf.bi_security_datasets_predicate_escapesequences.htm&type=5
	}

	// The Apex math class has most of the stuff you're looking for
	// when it comes to math related operations. Some of the available
	// methods require using the 'Double' number type instead of the 
	// 'Decimal' type... but most operations are available for Decimal too
	//
	// Typcially, Decimal will perform better and take less CPU time, which
	// makes it preferable in certain situations - just consider that all the
	// Salesforce custom fields that are numbers end up first as Decimal types
	// within Apex by default, which means to take advantage of faster Double
	// calcs, you'll need to convert Decimals to Doubles
	// https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_math.htm
	public void apexMath()
	{
		// Finding which number is bigger than another
		Decimal numberOne = 14.0;
		Decimal numberTwo = 28.0; 
		Assert.isTrue(numberTwo == Math.max(numberOne, numberTwo)); // 28 is greater than 14

		// Sine, cosine, and tangent
		Decimal exampleAngle = 79.0;
		Decimal sine = Math.sin(exampleAngle);
		Decimal cosine = Math.cos(exampleAngle);
		Decimal tangent = Math.tan(exampleAngle);
		System.debug('sine: ' + sine + '\ncosine: ' + cosine + '\ntangent: ' + tangent);

		// Square roots
		Decimal squareRoot = Math.sqrt(49.0);
		Assert.areEqual(7.0, squareRoot);

		// See the Salesforce documentation for more examples
	}
}