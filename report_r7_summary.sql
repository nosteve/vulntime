select
count(client.host) as "count", 
client."Vulnerability Title",
client.CVE,
kev.cveID as "[CISA KEV] Match",
kev.knownRansomwareCampaignUse as "[CISA KEV] Campaign Use",
ds.category as "[DS] Category",
client."Vulnerability Risk Score" as "Risk Score",
client."Malware Kit Count" as "Malware Kit Count",
client."Exploit Count" as "Exploits",
from client
left join ds on client."Vulnerability Title" = ds.title
left join kev on client.cve = kev.cveID
group by "Vulnerability Title";
