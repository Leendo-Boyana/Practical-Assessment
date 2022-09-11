import re

phone_number = input("Enter your phone number:")
numeric_string = re.sub("[^0-9]", "", phone_number)

print(numeric_string.zfill(10))
sum_zero = numeric_string.zfill(10)
length = len(numeric_string)
if length == 10 \
        and numeric_string[:3].isdigit() \
        and numeric_string[4:7].isdigit() \
        and numeric_string[8:].isdigit():
    print("Valid  phone number")
else:
    print("Invalid phone number")
print(sum_zero)
