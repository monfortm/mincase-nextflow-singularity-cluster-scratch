# Mini test case

Clone, make sure git-lfs is installed to also pull the container handled by LSF
If you did not clone properly, do `git lfs pull`

## Container (singularity) + cluster + scratch on node

To do all this at once, activate all profiles `singularity`, `container`, `scratchy`, `cluster`

```bash
nextflow run main.nf -dump-channels lorem -profile singularity,container,scratchy,cluster
```