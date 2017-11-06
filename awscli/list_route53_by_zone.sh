[[ $1 == "prod" ]] && echo "swoop.com";id=Z193JBHD1KX1GD || echo "int.swoop.com"
#aws route53 list-resource-record-sets --hosted-zone-id ${1:-Z2UV4RC19QUFLA} |grep Name
echo $id
aws route53 list-resource-record-sets --hosted-zone-id ${id:-Z2UV4RC19QUFLA}  |jq '.ResourceRecordSets | .[] | {type: .Type, name: .Name}'
