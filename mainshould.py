import unittest

from main import main


class MyTestCase(unittest.TestCase):
    def should_fail_if_input_is_dead(self):
        with self.assertRaises(Exception) as context:
            main("erreur")

        self.assertTrue('Input file does not exist:' in str(context.exception))

    def should_echo_file_if_exist(self):
        self.assertEqual(main("test.txt"), "wesh")


if __name__ == '__main__':
    unittest.main()
