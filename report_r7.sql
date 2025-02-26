select client.CVE,client.Title,ds.category as "[DS] Category",
kev.cveID as "[CISA KEV] CVE",
kev.knownRansomwareCampaignUse as "[CISA KEV] Campaign Use",
client.malware,
client.exploits,
client.cvss,
client.cvssv3,
client.risk,
client."published on",
client."modified on",
client.severity,
client.instances,
client.exceptions
from client
left join ds on client.title = ds.title
left join kev on client.cve = kev.cveID;
