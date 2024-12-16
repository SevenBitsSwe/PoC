import unittest

class TestPositionSimultator(unittest.TestCase):
#TODO sostituzione x y con valori adatti al testing
    def test_valid_journey_creation(self):
        route=[(x,y),(x,y),(x,y)]
        route_b=[(x,y),(x,y)]
        self.assertEqual(True, False)#TODO Implementazione test
    def test_invalid_journey_creation(self):
        route=[(x,y)]
        route=[(x)]
        route=[(x,y),(x)]
        route=[("x","y"),("x","y")]
        self.assertEqual(True, False)#TODO Implementazione test

    def test_live_coordinate_creation(self):
        self.assertEqual(True, False)#TODO Implementazione test

    def test_kafka_connection(self):
        self.assertEqual(True, False)#TODO Implementazione test
        
if __name__ == '__main__':
    unittest.main()