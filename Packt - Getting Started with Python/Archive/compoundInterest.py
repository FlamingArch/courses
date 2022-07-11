import decimal


initialIncome = float(input("Enter Initial Income: "))
addPerYear = float(input("Addition per annum: "))
interestPerAnnum = float(input("Enter Interest Per Annum: "))
time = int(input("Enter time period: (years): "))
finalMaturityAmount = initialIncome

for i in range(0, time):
    finalMaturityAmount += (finalMaturityAmount*interestPerAnnum/100) + addPerYear

print("\nFinal Maturity Amount: {}".format(str(finalMaturityAmount)))