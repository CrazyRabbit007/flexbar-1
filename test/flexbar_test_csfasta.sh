
flexbar --source test.csfasta --target result_right_nw --format csfasta --adapter-min-overlap 4 --adapters adapters.csfasta --min-readlength 10 --adapter-threshold 1 --adapter-trim-end RIGHT --adapter-no-adapt > /dev/null

a=`diff correct_result_right_nw.csfasta result_right_nw.csfasta`

#b=`diff correct_result_right_nw.csfasta.omitted test.csfasta.omitted`

l1=`expr length "$a"`
#l2=`expr length "$b"`

if [ $l1 != 0 ]; then
echo "error testing mode fasta, right, nw"
echo $a
exit -1
else
echo "Test 1 OK"
fi

flexbar --source test.csfasta --target result_left_nw --format csfasta --adapter-min-overlap 4 --adapters adapters.csfasta --min-readlength 10 --adapter-threshold 1 --adapter-trim-end LEFT --adapter-no-adapt > /dev/null

a=`diff correct_result_left_nw.csfasta result_left_nw.csfasta`

#b=`diff correct_result_left_nw.csfasta.omitted test.csfasta.omitted`

l1=`expr length "$a"`
#l2=`expr length "$b"`

if [ $l1 != 0 ]; then
echo "error testing mode fasta, left, nw"
echo $a
exit -1
else
echo "Test 2 OK"
fi


flexbar --source test.csfasta --target result_any_nw --format csfasta --adapter-min-overlap 4 --adapters adapters.csfasta --min-readlength 10 --adapter-threshold 1 --adapter-trim-end ANY --adapter-no-adapt > /dev/null

a=`diff correct_result_any_nw.csfasta result_any_nw.csfasta`

#b=`diff correct_result_any_nw.csfasta.omitted test.csfasta.omitted`

l1=`expr length "$a"`
#l2=`expr length "$b"`

if [ $l1 != 0 ]; then
echo "error testing mode any, left, nw"
echo $a
exit -1
else
echo "Test 3 OK"
fi

flexbar --source test.csfasta --target result_left_tail_nw --format csfasta --adapter-min-overlap 4 --adapters adapters.csfasta --min-readlength 10 --adapter-threshold 1 --adapter-trim-end LEFT_TAIL --adapter-no-adapt > /dev/null

a=`diff correct_result_left_tail_nw.csfasta result_left_tail_nw.csfasta`

#b=`diff correct_result_left_tail_nw.csfasta.omitted test.csfasta.omitted`

l1=`expr length "$a"`
#l2=`expr length "$b"`

if [ $l1 != 0 ]; then
echo "error testing mode fasta, left_tail, nw"
echo $a
exit -1
else
echo "Test 4 OK"
fi


flexbar --source test.csfasta --target result_right_tail_nw --format csfasta --adapter-min-overlap 4 --adapters adapters.csfasta --min-readlength 10 --adapter-threshold 1 --adapter-trim-end RIGHT_TAIL --adapter-no-adapt > /dev/null

a=`diff correct_result_right_tail_nw.csfasta result_right_tail_nw.csfasta`

#b=`diff correct_result_right_tail_nw.csfasta.omitted test.csfasta.omitted`

l1=`expr length "$a"`
#l2=`expr length "$b"`

if [ $l1 != 0 ]; then
echo "error testing mode fasta, right_tail, nw"
echo $a
exit -1
else
echo "Test 5 OK"
fi


echo ""

