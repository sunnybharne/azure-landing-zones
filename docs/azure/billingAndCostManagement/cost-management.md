# Cost Management

### what can be done with Cost Management?
| Capability                        | Description                                                                 |
|-|-|
| **Analyze Costs**| View in Azure Portal, Microsoft 365 Admin Center, or Power BI|
| **Monitor Proactively**| Set budgets, detect anomalies, monitor reservations, and schedule alerts|
| **Allocate Shared Costs**| Use cost allocation rules and enable tag inheritance|
| **Automate & Integrate**| Export cost data to automate or integrate with external tools|

### Organizing costs (chargeback) 

MCA
- billing profile (group of subscriptions)
    - invoice section (group of subscriptions)

EA
- enrollment account (group of subscriptions)
    - department (group of subscriptions)

### Cost Reporting
- Tag inheritance - not done on the resource itself.
- Cost allocation - Move cost from one sub,resource to another.

### Monitor and alert
- Budget alerts - notify recipients when cost exceeds a predefined cost or forecast amount. Budgets can be visualized in cost analysis and are available on every scope supported by Cost Management. Subscription and resource group budgets can also be configured to notify an action group to take automated actions to reduce or even stop further charges.
- Anomaly alerts - notify recipients when an unexpected change in daily usage has been detected. It can be a spike or a dip. Anomaly detection is only available for subscriptions and can be viewed within Cost analysis smart views. Anomaly alerts can be configured from the cost alerts page.
- Scheduled alerts - notify recipients about the latest costs on a daily, weekly, or monthly schedule based on a saved cost view. Alert emails include a visual chart representation of the view and can optionally include a CSV file. Views are configured in cost analysis, but recipients don't require access to cost in order to view the email, chart, or linked CSV.
- EA commitment balance alerts - are automatically sent to any notification contacts configured on the EA billing account when the balance is 90% or 100% used.
- Invoice alerts - can be configured for MCA billing profiles and Microsoft Online Services Program (MOSP) subscriptions. For details, see View and download your Azure invoice.

### Optimize costs

- Some services are free for 12 months or indefinitely.
- Azure Advisor cost recommendations should be your first stop when interested in optimizing existing resources. Advisor recommendations are updated daily and are based on your usage patterns. Advisor is available for subscriptions and resource groups. Management group users can also see recommendations but they need to select the desired subscriptions. Billing users can only see recommendations for subscriptions they have resource access to.
- Azure savings plans save you money when you have consistent usage of Azure compute resources. A savings plan can significantly reduce your resource costs by up to 65% from pay-as-you-go prices. https://learn.microsoft.com/en-us/azure/cost-management-billing/savings-plan/
- Azure reservations help you save up to 72% compared to pay-as-you-go rates by pre-committing to specific usage amounts for a set time duration. https://azure.microsoft.com/en-us/pricing/reservations/
- Azure Hybrid Benefit helps you significantly reduce costs by using on-premises Windows Server and SQL Server licenses or RedHat and SUSE Linux subscriptions on Azure. https://azure.microsoft.com/en-us/pricing/hybrid-benefit/#overview
- Azure benifits and incentives https://azure.microsoft.com/en-us/pricing/offers/#cloud
