# -*- coding: utf-8 -*-

import subprocess

if __name__ == '__main__':
    file_to_lint = 'countdown.py'  # Replace this with the file you want to lint
    command = 'pylint {}'.format(file_to_lint)

    try:
        lint_output = subprocess.check_output(command, shell=True, universal_newlines=True, stderr=subprocess.STDOUT)
        print(lint_output)
    except subprocess.CalledProcessError as e:
        print("Error occurred while linting:", e.output)

