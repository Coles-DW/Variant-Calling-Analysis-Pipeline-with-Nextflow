Useful resources: https://www.ebi.ac.uk/training/online/courses/human-genetic-variation-introduction/variant-identification-and-analysis/understanding-vcf-format/; https://gatk.broadinstitute.org/hc/en-us/articles/360035890431-The-logic-of-joint-calling-for-germline-short-variants; 
training -> cd nf4-science/genomics/
training/nf4-science/genomics -> code .

1. Per-sample variant calling
training/nf4-science/genomics -> tree . -L 2
.
├── data
│   ├── bam
│   ├── ref
│   └── samplesheet.csv
├── genomics.nf
├── modules
│   ├── gatk_haplotypecaller.nf
│   ├── gatk_jointgenotyping.nf
│   └── samtools_index.nf
├── nextflow.config
└── solutions
    ├── part2
    └── part3

7 directories, 6 files
training/nf4-science/genomics -> cd nf4-science/genomics/
bash: cd: nf4-science/genomics/: No such file or directory
training/nf4-science/genomics -> pwd
/workspaces/training/nf4-science/genomics
training/nf4-science/genomics -> docker pull community.wave.seqera.io/library/samtools:1.20--b5dfbd93de237464
1.20--b5dfbd93de237464: Pulling from library/samtools
6360b3717211: Pull complete 
2ec3f7ad9b3c: Pull complete 
7716ca300600: Pull complete 
4f4fb700ef54: Pull complete 
8c61d418774c: Pull complete 
03dae77ff45c: Pull complete 
aab7f787139d: Pull complete 
837d55536720: Pull complete 
897362c12ca7: Pull complete 
3893cbe24e91: Pull complete 
d1b61e94977b: Pull complete 
c72ff66fb90f: Pull complete 
0e0388f29b6d: Pull complete 
Digest: sha256:bbfc45b4f228975bde86cba95e303dd94ecf2fdacea5bfb2e2f34b0d7b141e41
Status: Downloaded newer image for community.wave.seqera.io/library/samtools:1.20--b5dfbd93de237464
community.wave.seqera.io/library/samtools:1.20--b5dfbd93de237464
training/nf4-science/genomics -> docker run -it -v ./data:/data community.wave.seqera.io/library/samtools:1.20--b5dfbd93de237464
(base) root@6bc023b0a67b:/tmp# ls /data/bam
reads_father.bam  reads_son.bam
reads_mother.bam
(base) root@6bc023b0a67b:/tmp# samtools index /data/bam/reads_mother.bam
(base) root@6bc023b0a67b:/tmp# exit
exit
training/nf4-science/genomics -> docker pull community.wave.seqera.io/library/gatk4:4.5.0.0--730ee8817e436867
4.5.0.0--730ee8817e436867: Pulling from library/gatk4
6360b3717211: Already exists 
2ec3f7ad9b3c: Already exists 
7716ca300600: Already exists 
4f4fb700ef54: Already exists 
8c61d418774c: Already exists 
03dae77ff45c: Already exists 
aab7f787139d: Already exists 
837d55536720: Already exists 
897362c12ca7: Already exists 
3893cbe24e91: Already exists 
d1b61e94977b: Already exists 
e5c558f54708: Pull complete 
087cce32d294: Pull complete 
Digest: sha256:e33413b9100f834fcc62fd5bc9edc1e881e820aafa606e09301eac2303d8724b
Status: Downloaded newer image for community.wave.seqera.io/library/gatk4:4.5.0.0--730ee8817e436867
community.wave.seqera.io/library/gatk4:4.5.0.0--730ee8817e436867
training/nf4-science/genomics -> docker run -it -v ./data:/data community.wave.seqera.io/library/gatk4:4.5.0.0--730ee8817e436867
(base) root@910b7b707501:/tmp# gatk HaplotypeCaller \
        -R /data/ref/ref.fasta \
        -I /data/bam/reads_mother.bam \
        -O reads_mother.vcf \
        -L /data/ref/intervals.bed
Using GATK jar /opt/conda/share/gatk4-4.5.0.0-0/gatk-package-4.5.0.0-local.jar
Running:
    java -Dsamjdk.use_async_io_read_samtools=false -Dsamjdk.use_async_io_write_samtools=true -Dsamjdk.use_async_io_write_tribble=false -Dsamjdk.compression_level=2 -jar /opt/conda/share/gatk4-4.5.0.0-0/gatk-package-4.5.0.0-local.jar HaplotypeCaller -R /data/ref/ref.fasta -I /data/bam/reads_mother.bam -O reads_mother.vcf -L /data/ref/intervals.bed
09:54:19.195 INFO  NativeLibraryLoader - Loading libgkl_compression.so from jar:file:/opt/conda/share/gatk4-4.5.0.0-0/gatk-package-4.5.0.0-local.jar!/com/intel/gkl/native/libgkl_compression.so
09:54:19.481 INFO  HaplotypeCaller - ------------------------------------------------------------
09:54:19.492 INFO  HaplotypeCaller - The Genome Analysis Toolkit (GATK) v4.5.0.0
09:54:19.492 INFO  HaplotypeCaller - For support and documentation go to https://software.broadinstitute.org/gatk/
09:54:19.495 INFO  HaplotypeCaller - Executing as root@910b7b707501 on Linux v6.8.0-1064-azure amd64
09:54:19.496 INFO  HaplotypeCaller - Java runtime: OpenJDK 64-Bit Server VM v17.0.11-internal+0-adhoc..src
09:54:19.496 INFO  HaplotypeCaller - Start Date/Time: September 16, 2026 at 9:54:19 AM GMT
09:54:19.496 INFO  HaplotypeCaller - ------------------------------------------------------------
09:54:19.496 INFO  HaplotypeCaller - ------------------------------------------------------------
09:54:19.497 INFO  HaplotypeCaller - HTSJDK Version: 4.1.0
09:54:19.497 INFO  HaplotypeCaller - Picard Version: 3.1.1
09:54:19.502 INFO  HaplotypeCaller - Built for Spark Version: 3.5.0
09:54:19.507 INFO  HaplotypeCaller - HTSJDK Defaults.COMPRESSION_LEVEL : 2
09:54:19.508 INFO  HaplotypeCaller - HTSJDK Defaults.USE_ASYNC_IO_READ_FOR_SAMTOOLS : false
09:54:19.510 INFO  HaplotypeCaller - HTSJDK Defaults.USE_ASYNC_IO_WRITE_FOR_SAMTOOLS : true
09:54:19.510 INFO  HaplotypeCaller - HTSJDK Defaults.USE_ASYNC_IO_WRITE_FOR_TRIBBLE : false
09:54:19.515 INFO  HaplotypeCaller - Deflater: IntelDeflater
09:54:19.515 INFO  HaplotypeCaller - Inflater: IntelInflater
09:54:19.515 INFO  HaplotypeCaller - GCS max retries/reopens: 20
09:54:19.519 INFO  HaplotypeCaller - Requester pays: disabled
09:54:19.520 INFO  HaplotypeCaller - Initializing engine
09:54:19.810 INFO  FeatureManager - Using codec BEDCodec to read file file:///data/ref/intervals.bed
09:54:19.889 INFO  IntervalArgumentCollection - Processing 6369 bp from intervals
09:54:19.908 INFO  HaplotypeCaller - Done initializing engine
09:54:19.927 INFO  NativeLibraryLoader - Loading libgkl_utils.so from jar:file:/opt/conda/share/gatk4-4.5.0.0-0/gatk-package-4.5.0.0-local.jar!/com/intel/gkl/native/libgkl_utils.so
09:54:19.936 INFO  NativeLibraryLoader - Loading libgkl_smithwaterman.so from jar:file:/opt/conda/share/gatk4-4.5.0.0-0/gatk-package-4.5.0.0-local.jar!/com/intel/gkl/native/libgkl_smithwaterman.so
09:54:19.940 INFO  SmithWatermanAligner - Using AVX accelerated SmithWaterman implementation
09:54:19.945 INFO  HaplotypeCallerEngine - Disabling physical phasing, which is supported only for reference-model confidence output
09:54:19.961 INFO  NativeLibraryLoader - Loading libgkl_pairhmm_omp.so from jar:file:/opt/conda/share/gatk4-4.5.0.0-0/gatk-package-4.5.0.0-local.jar!/com/intel/gkl/native/libgkl_pairhmm_omp.so
09:54:19.991 INFO  IntelPairHmm - Flush-to-zero (FTZ) is enabled when running PairHMM
09:54:19.993 INFO  IntelPairHmm - Available threads: 2
09:54:19.993 INFO  IntelPairHmm - Requested threads: 4
09:54:19.993 WARN  IntelPairHmm - Using 2 available threads, but 4 were requested
09:54:19.994 INFO  PairHMM - Using the OpenMP multi-threaded AVX-accelerated native PairHMM implementation
09:54:20.047 INFO  ProgressMeter - Starting traversal
09:54:20.048 INFO  ProgressMeter -        Current Locus  Elapsed Minutes     Regions Processed   Regions/Minute
09:54:20.826 WARN  InbreedingCoeff - InbreedingCoeff will not be calculated at position 20_10037292_10066351:3480 and possibly subsequent; at least 10 samples must have called genotypes
09:54:22.028 INFO  HaplotypeCaller - 7 read(s) filtered by: MappingQualityReadFilter 
0 read(s) filtered by: MappingQualityAvailableReadFilter 
0 read(s) filtered by: MappedReadFilter 
0 read(s) filtered by: NotSecondaryAlignmentReadFilter 
0 read(s) filtered by: NotDuplicateReadFilter 
0 read(s) filtered by: PassesVendorQualityCheckReadFilter 
0 read(s) filtered by: NonZeroReferenceLengthAlignmentReadFilter 
0 read(s) filtered by: GoodCigarReadFilter 
0 read(s) filtered by: WellformedReadFilter 
7 total reads filtered out of 1867 reads processed
09:54:22.029 INFO  ProgressMeter - 20_10037292_10066351:13499              0.0                    35           1060.6
09:54:22.030 INFO  ProgressMeter - Traversal complete. Processed 35 total regions in 0.0 minutes.
09:54:22.033 INFO  VectorLoglessPairHMM - Time spent in setup for JNI call : 0.008291482000000001
09:54:22.034 INFO  PairHMM - Total compute time in PairHMM computeLogLikelihoods() : 0.068797365
09:54:22.035 INFO  SmithWatermanAligner - Total compute time in native Smith-Waterman : 0.05 sec
09:54:22.040 INFO  HaplotypeCaller - Shutting down engine
[September 16, 2026 at 9:54:22 AM GMT] org.broadinstitute.hellbender.tools.walkers.haplotypecaller.HaplotypeCaller done. Elapsed time: 0.05 minutes.
Runtime.totalMemory()=101711872
(base) root@910b7b707501:/tmp# cat reads_mother.vcf
##fileformat=VCFv4.2
##FILTER=<ID=LowQual,Description="Low quality">
##FORMAT=<ID=AD,Number=R,Type=Integer,Description="Allelic depths for the ref and alt alleles in the order listed">
##FORMAT=<ID=DP,Number=1,Type=Integer,Description="Approximate read depth (reads with MQ=255 or with bad mates are filtered)">
##FORMAT=<ID=GQ,Number=1,Type=Integer,Description="Genotype Quality">
##FORMAT=<ID=GT,Number=1,Type=String,Description="Genotype">
##FORMAT=<ID=PL,Number=G,Type=Integer,Description="Normalized, Phred-scaled likelihoods for genotypes as defined in the VCF specification">
##GATKCommandLine=<ID=HaplotypeCaller,CommandLine="HaplotypeCaller --output reads_mother.vcf --intervals /data/ref/intervals.bed --input /data/bam/reads_mother.bam --reference /data/ref/ref.fasta --use-posteriors-to-calculate-qual false --dont-use-dragstr-priors false --use-new-qual-calculator true --annotate-with-num-discovered-alleles false --heterozygosity 0.001 --indel-heterozygosity 1.25E-4 --heterozygosity-stdev 0.01 --standard-min-confidence-threshold-for-calling 30.0 --max-alternate-alleles 6 --max-genotype-count 1024 --sample-ploidy 2 --num-reference-samples-if-no-call 0 --genotype-assignment-method USE_PLS_TO_ASSIGN --contamination-fraction-to-filter 0.0 --output-mode EMIT_VARIANTS_ONLY --all-site-pls false --flow-likelihood-parallel-threads 0 --flow-likelihood-optimized-comp false --trim-to-haplotype true --exact-matching false --flow-use-t0-tag false --flow-probability-threshold 0.003 --flow-remove-non-single-base-pair-indels false --flow-remove-one-zero-probs false --flow-quantization-bins 121 --flow-fill-empty-bins-value 0.001 --flow-symmetric-indel-probs false --flow-report-insertion-or-deletion false --flow-disallow-probs-larger-than-call false --flow-lump-probs false --flow-retain-max-n-probs-base-format false --flow-probability-scaling-factor 10 --flow-order-cycle-length 4 --keep-boundary-flows false --gvcf-gq-bands 1 --gvcf-gq-bands 2 --gvcf-gq-bands 3 --gvcf-gq-bands 4 --gvcf-gq-bands 5 --gvcf-gq-bands 6 --gvcf-gq-bands 7 --gvcf-gq-bands 8 --gvcf-gq-bands 9 --gvcf-gq-bands 10 --gvcf-gq-bands 11 --gvcf-gq-bands 12 --gvcf-gq-bands 13 --gvcf-gq-bands 14 --gvcf-gq-bands 15 --gvcf-gq-bands 16 --gvcf-gq-bands 17 --gvcf-gq-bands 18 --gvcf-gq-bands 19 --gvcf-gq-bands 20 --gvcf-gq-bands 21 --gvcf-gq-bands 22 --gvcf-gq-bands 23 --gvcf-gq-bands 24 --gvcf-gq-bands 25 --gvcf-gq-bands 26 --gvcf-gq-bands 27 --gvcf-gq-bands 28 --gvcf-gq-bands 29 --gvcf-gq-bands 30 --gvcf-gq-bands 31 --gvcf-gq-bands 32 --gvcf-gq-bands 33 --gvcf-gq-bands 34 --gvcf-gq-bands 35 --gvcf-gq-bands 36 --gvcf-gq-bands 37 --gvcf-gq-bands 38 --gvcf-gq-bands 39 --gvcf-gq-bands 40 --gvcf-gq-bands 41 --gvcf-gq-bands 42 --gvcf-gq-bands 43 --gvcf-gq-bands 44 --gvcf-gq-bands 45 --gvcf-gq-bands 46 --gvcf-gq-bands 47 --gvcf-gq-bands 48 --gvcf-gq-bands 49 --gvcf-gq-bands 50 --gvcf-gq-bands 51 --gvcf-gq-bands 52 --gvcf-gq-bands 53 --gvcf-gq-bands 54 --gvcf-gq-bands 55 --gvcf-gq-bands 56 --gvcf-gq-bands 57 --gvcf-gq-bands 58 --gvcf-gq-bands 59 --gvcf-gq-bands 60 --gvcf-gq-bands 70 --gvcf-gq-bands 80 --gvcf-gq-bands 90 --gvcf-gq-bands 99 --floor-blocks false --indel-size-to-eliminate-in-ref-model 10 --disable-optimizations false --dragen-mode false --dragen-378-concordance-mode false --flow-mode NONE --apply-bqd false --apply-frd false --disable-spanning-event-genotyping false --transform-dragen-mapping-quality false --mapping-quality-threshold-for-genotyping 20 --max-effective-depth-adjustment-for-frd 0 --just-determine-active-regions false --dont-genotype false --do-not-run-physical-phasing false --do-not-correct-overlapping-quality false --use-filtered-reads-for-annotations false --use-flow-aligner-for-stepwise-hc-filtering false --adaptive-pruning false --do-not-recover-dangling-branches false --recover-dangling-heads false --kmer-size 10 --kmer-size 25 --dont-increase-kmer-sizes-for-cycles false --allow-non-unique-kmers-in-ref false --num-pruning-samples 1 --min-dangling-branch-length 4 --recover-all-dangling-branches false --max-num-haplotypes-in-population 128 --min-pruning 2 --adaptive-pruning-initial-error-rate 0.001 --pruning-lod-threshold 2.302585092994046 --pruning-seeding-lod-threshold 9.210340371976184 --max-unpruned-variants 100 --linked-de-bruijn-graph false --disable-artificial-haplotype-recovery false --enable-legacy-graph-cycle-detection false --debug-assembly false --debug-graph-transformations false --capture-assembly-failure-bam false --num-matching-bases-in-dangling-end-to-recover -1 --error-correction-log-odds -Infinity --error-correct-reads false --kmer-length-for-read-error-correction 25 --min-observations-for-kmer-to-be-solid 20 --likelihood-calculation-engine PairHMM --base-quality-score-threshold 18 --dragstr-het-hom-ratio 2 --dont-use-dragstr-pair-hmm-scores false --pair-hmm-gap-continuation-penalty 10 --expected-mismatch-rate-for-read-disqualification 0.02 --pair-hmm-implementation FASTEST_AVAILABLE --pcr-indel-model CONSERVATIVE --phred-scaled-global-read-mismapping-rate 45 --disable-symmetric-hmm-normalizing false --disable-cap-base-qualities-to-map-quality false --enable-dynamic-read-disqualification-for-genotyping false --dynamic-read-disqualification-threshold 1.0 --native-pair-hmm-threads 4 --native-pair-hmm-use-double-precision false --flow-hmm-engine-min-indel-adjust 6 --flow-hmm-engine-flat-insertion-penatly 45 --flow-hmm-engine-flat-deletion-penatly 45 --pileup-detection false --use-pdhmm false --use-pdhmm-overlap-optimization false --make-determined-haps-from-pd-code false --print-pileupcalling-status false --fallback-gga-if-pdhmm-fails true --pileup-detection-enable-indel-pileup-calling false --pileup-detection-active-region-phred-threshold 0.0 --num-artificial-haplotypes-to-add-per-allele 5 --artifical-haplotype-filtering-kmer-size 10 --pileup-detection-snp-alt-threshold 0.1 --pileup-detection-indel-alt-threshold 0.1 --pileup-detection-absolute-alt-depth 0.0 --pileup-detection-snp-adjacent-to-assembled-indel-range 5 --pileup-detection-snp-basequality-filter 12 --pileup-detection-bad-read-tolerance 0.0 --pileup-detection-proper-pair-read-badness true --pileup-detection-edit-distance-read-badness-threshold 0.08 --pileup-detection-chimeric-read-badness true --pileup-detection-template-mean-badness-threshold 0.0 --pileup-detection-template-std-badness-threshold 0.0 --pileup-detection-filter-assembly-alt-bad-read-tolerance 0.0 --pileup-detection-edit-distance-read-badness-for-assembly-filtering-threshold 0.12 --bam-writer-type CALLED_HAPLOTYPES --dont-use-soft-clipped-bases false --override-fragment-softclip-check false --min-base-quality-score 10 --smith-waterman FASTEST_AVAILABLE --emit-ref-confidence NONE --max-mnp-distance 0 --force-call-filtered-alleles false --reference-model-deletion-quality 30 --soft-clip-low-quality-ends false --allele-informative-reads-overlap-margin 2 --smith-waterman-dangling-end-match-value 25 --smith-waterman-dangling-end-mismatch-penalty -50 --smith-waterman-dangling-end-gap-open-penalty -110 --smith-waterman-dangling-end-gap-extend-penalty -6 --smith-waterman-haplotype-to-reference-match-value 200 --smith-waterman-haplotype-to-reference-mismatch-penalty -150 --smith-waterman-haplotype-to-reference-gap-open-penalty -260 --smith-waterman-haplotype-to-reference-gap-extend-penalty -11 --smith-waterman-read-to-haplotype-match-value 10 --smith-waterman-read-to-haplotype-mismatch-penalty -15 --smith-waterman-read-to-haplotype-gap-open-penalty -30 --smith-waterman-read-to-haplotype-gap-extend-penalty -5 --flow-assembly-collapse-hmer-size 0 --flow-assembly-collapse-partial-mode false --flow-filter-alleles false --flow-filter-alleles-qual-threshold 30.0 --flow-filter-alleles-sor-threshold 3.0 --flow-filter-lone-alleles false --flow-filter-alleles-debug-graphs false --min-assembly-region-size 50 --max-assembly-region-size 300 --active-probability-threshold 0.002 --max-prob-propagation-distance 50 --force-active false --assembly-region-padding 100 --padding-around-indels 75 --padding-around-snps 20 --padding-around-strs 75 --max-extension-into-assembly-region-padding-legacy 25 --max-reads-per-alignment-start 50 --enable-legacy-assembly-region-trimming false --interval-set-rule UNION --interval-padding 0 --interval-exclusion-padding 0 --interval-merging-rule ALL --read-validation-stringency SILENT --seconds-between-progress-updates 10.0 --disable-sequence-dictionary-validation false --create-output-bam-index true --create-output-bam-md5 false --create-output-variant-index true --create-output-variant-md5 false --max-variants-per-shard 0 --lenient false --add-output-sam-program-record true --add-output-vcf-command-line true --cloud-prefetch-buffer 40 --cloud-index-prefetch-buffer -1 --disable-bam-index-caching false --sites-only-vcf-output false --help false --version false --showHidden false --verbosity INFO --QUIET false --use-jdk-deflater false --use-jdk-inflater false --gcs-max-retries 20 --gcs-project-for-requester-pays  --disable-tool-default-read-filters false --minimum-mapping-quality 20 --disable-tool-default-annotations false --enable-all-annotations false --allow-old-rms-mapping-quality-annotation-data false",Version="4.5.0.0",Date="September 16, 2026 at 9:54:20 AM GMT">
##INFO=<ID=AC,Number=A,Type=Integer,Description="Allele count in genotypes, for each ALT allele, in the same order as listed">
##INFO=<ID=AF,Number=A,Type=Float,Description="Allele Frequency, for each ALT allele, in the same order as listed">
##INFO=<ID=AN,Number=1,Type=Integer,Description="Total number of alleles in called genotypes">
##INFO=<ID=BaseQRankSum,Number=1,Type=Float,Description="Z-score from Wilcoxon rank sum test of Alt Vs. Ref base qualities">
##INFO=<ID=DP,Number=1,Type=Integer,Description="Approximate read depth; some reads may have been filtered">
##INFO=<ID=ExcessHet,Number=1,Type=Float,Description="Phred-scaled p-value for exact test of excess heterozygosity">
##INFO=<ID=FS,Number=1,Type=Float,Description="Phred-scaled p-value using Fisher's exact test to detect strand bias">
##INFO=<ID=InbreedingCoeff,Number=1,Type=Float,Description="Inbreeding coefficient as estimated from the genotype likelihoods per-sample when compared against the Hardy-Weinberg expectation">
##INFO=<ID=MLEAC,Number=A,Type=Integer,Description="Maximum likelihood expectation (MLE) for the allele counts (not necessarily the same as the AC), for each ALT allele, in the same order as listed">
##INFO=<ID=MLEAF,Number=A,Type=Float,Description="Maximum likelihood expectation (MLE) for the allele frequency (not necessarily the same as the AF), for each ALT allele, in the same order as listed">
##INFO=<ID=MQ,Number=1,Type=Float,Description="RMS Mapping Quality">
##INFO=<ID=MQRankSum,Number=1,Type=Float,Description="Z-score From Wilcoxon rank sum test of Alt vs. Ref read mapping qualities">
##INFO=<ID=QD,Number=1,Type=Float,Description="Variant Confidence/Quality by Depth">
##INFO=<ID=ReadPosRankSum,Number=1,Type=Float,Description="Z-score from Wilcoxon rank sum test of Alt vs. Ref read position bias">
##INFO=<ID=SOR,Number=1,Type=Float,Description="Symmetric Odds Ratio of 2x2 contingency table to detect strand bias">
##contig=<ID=20_10037292_10066351,length=29059>
##source=HaplotypeCaller
#CHROM  POS     ID      REF     ALT     QUAL      FILTER  INFO    FORMAT  reads_mother
20_10037292_10066351    3480    .       CCT       503.03  .       AC=2;AF=1.00;AN=2;DP=23;ExcessHet=0.0000;FS=0.000;MLEAC=2;MLEAF=1.00;MQ=60.00;QD=27.95;SOR=1.179    GT:AD:DP:GQ:PL    1/1:0,18:18:54:517,54,0
20_10037292_10066351    3520    .       ATA       609.03  .       AC=2;AF=1.00;AN=2;DP=18;ExcessHet=0.0000;FS=0.000;MLEAC=2;MLEAF=1.00;MQ=60.00;QD=33.83;SOR=0.693    GT:AD:DP:GQ:PL    1/1:0,18:18:54:623,54,0
20_10037292_10066351    3529    .       TA155.64  .       AC=1;AF=0.500;AN=2;BaseQRankSum=-0.544;DP=21;ExcessHet=0.0000;FS=1.871;MLEAC=1;MLEAF=0.500;MQ=60.00;MQRankSum=0.000;QD=7.78;ReadPosRankSum=-1.158;SOR=1.034     GT:AD:DP:GQ:PL  0/1:12,8:20:99:163,0,328
20_10037292_10066351    4012    .       CT1398.06 .       AC=2;AF=1.00;AN=2;DP=44;ExcessHet=0.0000;FS=0.000;MLEAC=2;MLEAF=1.00;MQ=60.00;QD=32.51;SOR=0.739    GT:AD:DP:GQ:PL    1/1:0,43:43:99:1412,129,0
20_10037292_10066351    4409    .       AATATG    710.03  .       AC=2;AF=1.00;AN=2;DP=31;ExcessHet=0.0000;FS=0.000;MLEAC=2;MLEAF=1.00;MQ=60.00;QD=30.87;SOR=0.784    GT:AD:DP:GQ:PL    1/1:0,23:23:69:724,69,0
20_10037292_10066351    5027    .       CT784.06  .       AC=2;AF=1.00;AN=2;DP=27;ExcessHet=0.0000;FS=0.000;MLEAC=2;MLEAF=1.00;MQ=60.00;QD=30.16;SOR=0.693    GT:AD:DP:GQ:PL    1/1:0,26:26:77:798,77,0
20_10037292_10066351    5469    .       AG1297.06 .       AC=2;AF=1.00;AN=2;DP=42;ExcessHet=0.0000;FS=0.000;MLEAC=2;MLEAF=1.00;MQ=60.00;QD=30.88;SOR=1.005    GT:AD:DP:GQ:PL    1/1:0,42:42:99:1311,126,0
20_10037292_10066351    7557    .       AG935.06  .       AC=2;AF=1.00;AN=2;DP=36;ExcessHet=0.0000;FS=0.000;MLEAC=2;MLEAF=1.00;MQ=60.00;QD=27.50;SOR=0.693    GT:AD:DP:GQ:PL    1/1:0,34:34:99:949,100,0
20_10037292_10066351    7786    .       GT1043.06 .       AC=2;AF=1.00;AN=2;DP=35;ExcessHet=0.0000;FS=0.000;MLEAC=2;MLEAF=1.00;MQ=60.00;QD=30.68;SOR=0.941    GT:AD:DP:GQ:PL    1/1:0,34:34:99:1057,102,0
20_10037292_10066351    8350    .       GC1162.06 .       AC=2;AF=1.00;AN=2;DP=39;ExcessHet=0.0000;FS=0.000;MLEAC=2;MLEAF=1.00;MQ=60.00;QD=29.80;SOR=1.096    GT:AD:DP:GQ:PL    1/1:0,39:39:99:1176,115,0
20_10037292_10066351    8886    .       AAGAAAGAAAG       A       1268.03 .       AC=2;AF=1.00;AN=2;DP=34;ExcessHet=0.0000;FS=0.000;MLEAC=2;MLEAF=1.00;MQ=60.00;QD=25.36;SOR=1.071      GT:AD:DP:GQ:PL  1/1:0,29:29:88:1282,88,0
20_10037292_10066351    13536   .       TC437.64  .       AC=1;AF=0.500;AN=2;BaseQRankSum=1.454;DP=45;ExcessHet=0.0000;FS=0.000;MLEAC=1;MLEAF=0.500;MQ=60.00;MQRankSum=0.000;QD=9.95;ReadPosRankSum=-1.613;SOR=0.818      GT:AD:DP:GQ:PL  0/1:26,18:44:99:445,0,672
20_10037292_10066351    14156   .       TC183.64  .       AC=1;AF=0.500;AN=2;BaseQRankSum=0.703;DP=20;ExcessHet=0.0000;FS=1.871;MLEAC=1;MLEAF=0.500;MQ=60.00;MQRankSum=0.000;QD=9.18;ReadPosRankSum=-0.193;SOR=1.034      GT:AD:DP:GQ:PL  0/1:12,8:20:99:191,0,319
(base) root@910b7b707501:/tmp# 
(base) root@910b7b707501:/tmp# mkdir /data/vcf
mv reads_mother.vcf* /data/vcf
(base) root@910b7b707501:/tmp# exit
exit

2. Joint calling on a cohort

docker run -it -v ./data:/data community.wave.seqera.io/library/samtools:1.20--b5dfbd93de237464

samtools index /data/bam/reads_mother.bam
samtools index /data/bam/reads_father.bam
samtools index /data/bam/reads_son.bam

exit

2.2. Generate GVCFs for all three samples

docker run -it -v ./data:/data community.wave.seqera.io/library/gatk4:4.5.0.0--730ee8817e436867

gatk HaplotypeCaller \
        -R /data/ref/ref.fasta \
        -I /data/bam/reads_mother.bam \
        -O reads_mother.g.vcf \
        -L /data/ref/intervals.bed \
        -ERC GVCF

gatk HaplotypeCaller \
        -R /data/ref/ref.fasta \
        -I /data/bam/reads_father.bam \
        -O reads_father.g.vcf \
        -L /data/ref/intervals.bed \
        -ERC GVCF

gatk HaplotypeCaller \
        -R /data/ref/ref.fasta \
        -I /data/bam/reads_son.bam \
        -O reads_son.g.vcf \
        -L /data/ref/intervals.bed \
        -ERC GVCF

2.3. Run joint genotyping

gatk GenomicsDBImport \
    -V reads_mother.g.vcf \
    -V reads_father.g.vcf \
    -V reads_son.g.vcf \
    -L /data/ref/intervals.bed \
    --genomicsdb-workspace-path family_trio_gdb

gatk GenotypeGVCFs \
    -R /data/ref/ref.fasta \
    -V gendb://family_trio_gdb \
    -O family_trio.vcf

cat family_trio.vcf

mv *.vcf* /data/vcf

exit
