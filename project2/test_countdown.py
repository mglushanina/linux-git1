# -*- coding: utf-8 -*-

import unittest
from countdown import time_until_new_year

class TestCountdown(unittest.TestCase):
    def test_time_until_new_year(self):
        # Проверяем, что функция возвращает timedelta
        self.assertIsInstance(time_until_new_year(), datetime.timedelta)

if __name__ == '__main__':
    unittest.main(verbosity=2, exit=False)

