import csv


def extract_rising_edge_values(filepath_in, filepath_out):

    counter = 0
    list_values = []
    prev_value = []
    prev_diff = 0
    with open(filepath_in, newline='') as f:
        with open(filepath_out, 'w') as f_out:

            reader = csv.reader(f)
            writer = csv.writer(f_out)
            for row in reader:
                if(row[0].startswith(";")):
                    continue

                current_value = row
                if(counter == 0):
                    list_values.append(current_value)
                    writer.writerow(current_value)
                    prev_value = current_value
                    counter = 1
                    continue

                current_diff = float(current_value[1]) - float(prev_value[1])

                if((current_diff) == 0 and abs(prev_diff) > 0):
                    list_values.append(prev_value)
                    writer.writerow(prev_value)

                prev_diff = current_diff
                prev_value = current_value
                counter += 1

    return list_values


if __name__ == "__main__":

    import sys
    list_values = extract_rising_edge_values(sys.argv[1], sys.argv[2])
    print(list_values)
