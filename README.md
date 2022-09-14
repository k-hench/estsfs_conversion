**Data Preparation**

Create dummy dataset

```
vcflib vcfrandom | \
  awk '{print $0"\t"$10"\t"$10}' | \
  sed 's/bill\tbill\tbill/id1\tid2\tid3/' > test.vcf
```

After the initial creation of the `vcf`, some manual fiddeling with the file is required to adjust the sample names and to create some variation in the genotypes.

Create allele counts

```
vcftools --vcf test.vcf --counts --stdout | \
  sed 's/\t/,/g5, s/:/=/g' > test_counts.tsv
```