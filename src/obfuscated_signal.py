import random
import string

class obfuscated_signal:
    def __init__(self, _original_signal, size):
        self.__previous_obfuscated = []
        self.signal = _original_signal
        self.obfuscated_signal = self.obfuscate(size)

    def obfuscate(self, size):
        letters = string.ascii_letters
        while True:
            result_str = ''.join(random.choice(letters) for i in range(size))
            if result_str not in self.__previous_obfuscated:
                self.__previous_obfuscated.append(result_str)
                break

        return result_str

