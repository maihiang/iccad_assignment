def rotate_90(solution):
    return [(col, 9 - row) for row, col in solution]

def rotate_180(solution):
    return rotate_90(rotate_90(solution))

def rotate_270(solution):
    return rotate_90(rotate_180(solution))

def reflect_horizontal(solution):
    return [(row, 9 - col) for row, col in solution]

def reflect_vertical(solution):
    return [(9 - row, col) for row, col in solution]

def reflect_diagonal(solution):
    return [(col, row) for row, col in solution]

def generate_all_transformations(solution):
    transformations = set()
    transformations.add(tuple(solution))
    transformations.add(tuple(rotate_90(solution)))
    transformations.add(tuple(rotate_180(solution)))
    transformations.add(tuple(rotate_270(solution)))
    transformations.add(tuple(reflect_horizontal(solution)))
    transformations.add(tuple(reflect_vertical(solution)))
    transformations.add(tuple(reflect_diagonal(solution)))
    return transformations

unique_solutions = set()

with open("8qs.out", "rt") as f:
    for line in f:
        solution = eval(line.strip())
        transformations = generate_all_transformations(solution)
        unique_solutions.add(min(transformations))

# 打印唯一的解
for solution in unique_solutions:
    print(solution)
