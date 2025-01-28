from django.test import TestCase

# to run tests:
# uv run manage.py test tests [--verbosity 2] [--shuffle] [--debug-mode]
# see:
# https://docs.djangoproject.com/en/5.0/ref/django-admin/#test

class YourTestClass(TestCase):

    @classmethod
    def setUpTestData(cls):
        print("setUpTestdata: Run once to set up non modified data for all class methods")

    def setUp(self):
        print("setUp: Run once for every test method to setup clean data.")

    def test_false_is_false(self):
        print("Method: test_false_is_false.")
        self.assertFalse(False)

    def test_false_is_true(self):
        print("Method: test)false_is_true.")
        self.assertTrue(True)

    def test_one_plus_one_equals_two(self):
        print("Method: test_one_plus_one_equals_two.")
        self.assertEqual(1 + 1, 2)