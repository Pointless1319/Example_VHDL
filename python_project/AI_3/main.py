import csv
import time

def most_common(l):  # O(4N + 3)
    current_winner = 0
    max_repeated = None
    for u in l:
        amount_times = l.count(u)
        if amount_times > current_winner:
            current_winner = amount_times
            max_repeated = u

    return max_repeated


def compare_array(a_array, b_array, row):  # O(2N^2 + 3N + 3)
    array_diff = []
    is_flag = 0
    for x in range(len(a_array)):
        for j in range(len(b_array)):
            if a_array[x][row] == b_array[j][row]:
                is_flag = 1
        if is_flag == 0:
            array_diff.append(a_array[x][row])
        is_flag = 0

    return array_diff


def make_a_f__king_decision(examining_a, decision_a):  # O(3N^2 + 3N + 3)
    temp_examining_array = examining_a
    flag = 0
    t = 0
    for r in range(len(examining_a)):
        for t in range(len(examining_a[1])):
            if examining_a[r][t-1] == decision_a[t-1] and flag == 0:
                flag = 1
                temp_examining_array[r].append("tak")
        if flag == 1:
            flag = 0
        else:
            temp_examining_array[r].append("nie")

    return temp_examining_array

start_time = time.time()

yes_array = []
no_array = []
with open('examine_data.txt', 'r') as read_obj:
    csv_reader1 = csv.reader(read_obj)
    list_of_csv1 = list(csv_reader1)
examining_array = list_of_csv1
with open('learn_data.txt', 'r') as read_obj:
    csv_reader = csv.reader(read_obj)
    list_of_csv = list(csv_reader)

teaching_array = list_of_csv


for i in range(len(teaching_array)):
    if teaching_array[i][len(teaching_array[1])-1] == "tak":
        yes_array.append(teaching_array[i])
    else:
        no_array.append((teaching_array[i]))


decision_array = []
for rows in range(0, len(teaching_array[1])-1):
    temp = compare_array(yes_array, no_array, rows)
    most = most_common(temp)
    decision_array.append(most)

print(decision_array)


decision_made = make_a_f__king_decision(examining_array, decision_array)


f = open("result.csv", "w")
for lines in decision_made:
    f.write("%s\n" % lines)

f.close()

print("--- %s seconds ---" % (time.time() - start_time))


