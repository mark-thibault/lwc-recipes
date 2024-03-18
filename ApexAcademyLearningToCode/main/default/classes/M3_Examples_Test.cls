@isTest (isParallel = true)
public without sharing class M3_Examples_Test 
{
	public M3_Examples_Test() {}

	public static final String EMPTY = '';

	@isTest
	static void learningApex()
	{
		M3_Examples m3examples = new M3_Examples();
		
		String variableInitialized;
		String exceptionMessage = EMPTY;
		try {
			variableInitialized = m3examples.learningApex();
		} catch (Exception stringInitException) 
		{
			exceptionMessage = stringInitException.getMessage() + '\n' + 
				stringInitException.getStackTraceString();
			System.debug(exceptionMessage);
		}

		Assert.areEqual('I am writing Apex!', variableInitialized,
			'Expected a string returned from learningApex()');
	}

	@isTest
	static void initializeAccount()
	{
		M3_Examples m3Examples = new M3_Examples();

		Account account = m3Examples.initializeNewAccount();

		Assert.isNotNull(account, 'Expected account to be initialized in memory');
	}
}