@isTest
private class AnimalLocatorTest {
    
    @isTest
    static void testGetCallout() {
        
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        
        String animalName = AnimalLocator.getAnimalNameById(1);
        system.debug('AnimalName : ' + animalName);
        System.assertEquals(animalName, 'chicken');
        
    }
    
}