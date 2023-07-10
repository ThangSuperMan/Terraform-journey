# Guide

## Useful commands

### Get zone names of a region in aws using aws and jq cli tool

```bash
# Make sure that your file .aws/credentials has to have [default] section
aws ec2 describe-availability-zones --region us-east-1 | jq '.AvailabilityZones[].ZoneName'
```
