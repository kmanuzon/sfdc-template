# Salesforce DX Template

## Clone fflib

```
git clone https://github.com/apex-enterprise-patterns/fflib-apex-mocks.git ../fflib-apex-mocks
```

```
git clone https://github.com/apex-enterprise-patterns/fflib-apex-common.git ../fflib-apex-common
```

## Copy fflib

```
cp -r ../fflib-apex-mocks/sfdx-source/apex-mocks sfdx-source/fflib-apex-mocks
```

```
cp -r ../fflib-apex-common/sfdx-source/apex-common sfdx-source/fflib-apex-common
```

## Setup scratch org

```
sfdx force:org:create --wait 30 --durationdays 30 --definitionfile config/project-scratch-def.json --setdefaultusername --targetdevhubusername default-devhub --setalias scratch-01
```

```
sfdx force:source:push
```
