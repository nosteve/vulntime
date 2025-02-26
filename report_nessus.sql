select
count(client_int.host) as "count", 
client_int.timestamp,
client_int."Plugin ID",
client_int.CVE,
client_int.Name,
kev.cveID as "[CISA KEV] Match",
kev.knownRansomwareCampaignUse as "[CISA KEV] Campaign Use",
ds.category as "[DS] Category",
client_int."VPR Score" as "VPR Score",
client_int."EPSS Score" as "EPSS Score",
client_int.Metasploit as "Metasploit"
from client_int 
left join ds on client_int."Plugin ID" = ds.id
left join kev on client_int.cve = kev.cveID
where client_int.timestamp = 202501
group by "Plugin ID";
