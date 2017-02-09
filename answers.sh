#! /usr/bin/env bash 

datasets='/vol2/home/anndoan/data-sets/'
# Which state has the lowest murder rate?

states="$datasets/misc/states.tab.gz"

answer_1=$(zcat $states \
    | cut -f1,6 \
    | sort -k2g \
    | head -n2 \
    | tail -n1 \
    | cut -f1 \
    | sed 's/"//g')
   
echo "answer-1: $answer_1"

sample="$datasets/fasta/sample.fa"

answer_2=$(grep '^>' $sample |wc -l)

echo "answer-2: $answer_2"

ID="$datasets/bed/cpg.bed.gz"

answer_3=$(zless $ID |cut -f4 |sort |uniq -c |wc -l)

echo "answer-3: $answer_3"


cluster="$datasets/fastq/SP1.fq"

answer_4=$(grep '^@cluster' $cluster |wc -l)

echo "answer-4: $answer_4"

bloody="$datasets/misc/hamlet.txt"

answer_5=$(grep -i 'bloody' $bloody |wc -w)

echo "answer-5: $answer_5"

length="$datasets/fasta/sample.fa"

answer_6=$(less $length |head -n2 |tail -n1 |tr -d '\n' |wc -c)

echo "answer-6: $answer_6"

longest="$datasets/bed/genes.hg19.bed.gz"

answer_7=$(zless $longest \
    |cut -f4 \
    |awk '{print length (), $0 |"sort -n"}' \
    |tail -n1)

echo "answer-7: $answer_7"


uniq="$datasets/bed/genes.hg19.bed.gz"

answer_8=$(zless $uniq |cut -f1 |sort |uniq -c |wc -l)

echo "answer-8: $answer_8"

CTCF="$datasets/bed/peaks.chr22.bed.gz"

answer_9=$(zless $CTCF \
    |grep 'CTCF$' \
    |wc -l)

echo "answer-9: $answer_9"

inverval="$datasets/bed/lamina.bed"

answer_10=$(awk '{print $1, $3 - $2}' $inverval \
    |sort -k2n \
    |tail -n1)

echo "answer-10: $answer_10"






