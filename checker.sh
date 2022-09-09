set -e
g++ -o wrong wrong.cpp
g++ generator.cpp -o generator
g++ ac_e.cpp -o ac_e
for((i = 1; ; ++i)); do
    ./generator $i > input_file
    ./wrong < input_file > myAnswer
    ./ac_e < input_file > correctAnswer
    diff -Z myAnswer correctAnswer || break
    echo "Passed test: "  $i
done

echo "WA on test : "
cat input_file

echo "Your answer : "
cat myAnswer
echo "Correct Answer : "
cat correctAnswer