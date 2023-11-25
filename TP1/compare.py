def compare_files(file1, file2):
    with open(file1, 'r') as f1, open(file2, 'r') as f2:
        lines1 = f1.readlines()
        lines2 = f2.readlines()

    for i, (line1, line2) in enumerate(zip(lines1, lines2)):
        if line1 != line2:
            print('Difference in line {}:'.format(i + 1))
            print('File 1: {}'.format(line1.strip()))
            print('File 2: {}'.format(line2.strip()))
    
    if len(lines1) != len(lines2):
        print('Files have different numbers of lines.')

if __name__ == '__main__':
    file1 = 'output_default.txt'
    file2 = 'cp_output.txt'
    compare_files(file1, file2)
