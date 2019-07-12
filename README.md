# Mini test case

## Container (singularity) + cluster + scratch on node

To do all this at once, activate all profiles `singularity`, `container`, `scratchy`, `cluster`

```bash
nextflow run main.nf -dump-channels lorem -profile singularity,container,scratchy,cluster
```