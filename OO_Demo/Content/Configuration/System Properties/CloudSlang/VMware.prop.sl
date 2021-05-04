namespace: CloudSlang
properties:
  - vCenter: swvm210.hpeswlab.net
  - vcenterAdminUsername: administrator
  - vcenterAdminPassword:
      value: 'HPS0ftware!'
      sensitive: true
  - vcenterPort: '443'
  - vcenterProtocol: https
  - vcenterDatacenter: BBN-Prod
  - vcenterClusterName: BBN Cluster
  - vcenterVmFolder: OO Demo
  - trustKeystore: "C:\\Program Files\\Micro Focus\\Robotic Process Automation Designer\\designer\\var\\security\\client.truststore"
  - trustPassword:
      value: changeit
      sensitive: true
