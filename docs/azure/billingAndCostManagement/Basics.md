# Cost Management and Billing

> [!NOTE]
> - Billing Doc: https://learn.microsoft.com/en-us/azure/cost-management-billing/manage/ea-direct-portal-get-started
> - Cost Management Doc: https://learn.microsoft.com/en-us/azure/cost-management-billing/costs/
> - Training: https://learn.microsoft.com/en-us/training/paths/control-spending-manage-bills/?source=recommendations
> - Training: https://learn.microsoft.com/en-us/training/modules/manage-costs-partner-cost-management/?source=recommendations
> - Training rback: https://learn.microsoft.com/en-us/azure/role-based-access-control/
> - Training lighthouse: https://learn.microsoft.com/en-us/azure/lighthouse/
> - https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/
> - https://learn.microsoft.com/en-us/azure/governance/policy/
> - https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/ - Whats new in finops: https://azure.microsoft.com/en-us/blog/tag/finops/
> - To be continued cost managemnet... https://learn.microsoft.com/en-us/azure/cost-management-billing/costs/enable-preview-features-cost-management-labs
> - To be continued billing... https://learn.microsoft.com/en-us/azure/cost-management-billing/understand/review-individual-bill

## MS Commerce System data pipeline
![data pipeline](https://learn.microsoft.com/en-us/azure/cost-management-billing/costs/media/overview-cost-management/commerce-pipeline.svg#lightbox)
- Credits are applied like a gift card just before monthly invoicing; unused until then.

## Bill Review by Agreement Type
| Individual Agreement | EA Agreement | MCA Agreement | MPA Agreement |
|----------------------|--------------|----------------|----------------|
| Invoice is created at the end of the billing cycle | - Invoice is generated when:<br> • Service overage (exceeding organizational/prepayment credits)<br> • Use of services not covered by the EA<br> • Marketplace charges<br><br> - Azure Prepayment consumption is visible to EA admins in Azure Portal<br><br> - EA Admins can grant:<br> • Department Admins (DA) view access<br> • Account Owners (AO) view access via:<br> _Cost Management and Billing > Policies_ | Invoice is generated monthly for each billing profile | Invoice is generated monthly for each billing profile |

> [!NOTE]
> - Invoice can be found in cost management and billing > billing > invoices
> - Specific subscription scope > billing > invoices

> [!TIP]
> - External service charges
>   - This are the charges from the auzre marketplace
> - Azure doesn't log most user actions.Enable logging for the specific service.
> - How are resources billed 
>   - Resources has one or more meter.Meters are used to track the usage of the resource over time.
> - vm meters example:
>   - Compute Hours, IP Address Hours, Data Transfer In, Data Transfer Out, Standard Managed Disk, Standard Managed Disk Operations, Standard IO-Disk, Standard IO-Block Blob Read, Standard IO-Block Blob Write, Standard IO-Block Blob Delete

## Billing hierarchy

![Billing hierarchy](https://learn.microsoft.com/en-us/azure/cost-management-billing/understand/media/mosp-new-customer-experience/new-billing-account-hierarchy.png#lightbox)

- Billing account
    - Billing profile(manage your invoice and payment methods)
        - Invoice sections(For example, you might need a single invoice but want to organize costs by department, team, or project)

> [!NOTE]
> Get a single monthly invoice for Azure subscriptions.
> Cost Management and Billing > Subscriptions > ... > Change invoice section 
> Automatically publish your cost and usage data to a storage account on a daily, weekly, or monthly basis.
> Apply policies to control purchases of Azure Reservations and Marketplace products.

---
