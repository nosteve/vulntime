create view FCH as
select
count(client.host) as "count", 
client."Plugin ID",
client.CVE,
client.Name,
kev.cveID as "CISA KEV Match",
kev.knownRansomwareCampaignUse as "CISA KEV Campaign Use",
category.category as "vulntime Category",
client."VPR Score" as "VPR Score",
client."EPSS Score" as "EPSS Score",
client.Metasploit as "Metasploit"
from client 
left join category on client."Plugin ID" = category.id
left join kev on client.cve = kev.cveID
group by "Plugin ID";
