function Remove-DNSRecord {
    [CmdletBinding()]
    param(
        [parameter(ValueFromPipelineByPropertyName, Mandatory = $True)]$Id,
        [parameter(Mandatory = $True)][string]$APIKey
    )
    begin{
        $Header = @{
            'Content-Type' = "application/json"
            Authorization  = "Bearer $APIKey"
        }
        
    }

    process {
        $URI = "https://api.cloudflare.com/client/v4/zones/38e05a298627b5e65c0c9d90d2e47b21/dns_records/$($_.id)"
        $Results = Invoke-RestMethod -Method Delete -Uri $URI -Headers $Header
        return $Results
        $URI
    }
}