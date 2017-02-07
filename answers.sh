#! /usr/bin/env bash 

datasets='/vol2/home/anndoan/data-sets/'
# Which state has the highest popultion?

states="$datasets/misc/states.tab.gz"

answer_1=$(zcat $states \
    | grep -v '^#' \
    | cut -f1,2 \
    | sort -k2n \
    | tail -n1 \
    | cut -f1 \
    | sed 's/"//g') 

echo "answer-1: $answer_1"

sample="$datasets/fasta/sample.fa"

answer_2=$(grep '^>' $sample |wc -l)

echo "answer-2: $answer_2"

number="$datasets/bed/cpg.bed.gz"

answer_3=$(zless $number |cut -f4 |sort |uniq -c |wc -l)

echo "answer-3: $anwser_3"

cluster="$datasets/fastq/SP1.fq"

answer_4=$(grep '^@cluster' $cluster |wc -l)

echo "answer-4: $answer_4"

bloody="$datasets/misc/hamlet.txt"

answer_5=$(grep -i 'bloody' $bloody |wc -w)

echo "answer-5: $answer_5"

length="$datasets/fasta/sample.fa"

answer_6=$(less $length |head -n2 |tail -n1 |tr -d '\n' |wc -c)

echo "answer-6: $answer_6"

uniq="$datasets/bed/genes.hg19.bed.gz"

answer_8=$(zless $uniq |cut -f1 |sort |uniq -c |wc -l)

echo "answer_8: $answer_8"




