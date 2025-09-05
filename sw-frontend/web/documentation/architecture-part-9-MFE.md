# Micro Front-Ends (Own subject)
2 options:
1- MFE with polyrepos: Traditional way
2- MFE with monorepos:
**advantages**:
1- one version policy across all MFE.
2- MFE can be isolated through access restrictions using linting rules. By preventing one MFE from depending upon others, teams can evolve their MFE separately. Thus achieving team autonomy without the need for a polyrepo.
3- MFE still deployable separatly.
**disatvantages**:
Teams have to agree on one version of dependencies: 
- one version angular or React.
- one cycle of upgrade to a new version.