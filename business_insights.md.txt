# HR Attrition Analysis — Business Insights & Recommendations

## Executive Summary
Company-wide attrition stands at 16.12%, costing an estimated $6.8M/year. This isn't 
a uniform problem — it's concentrated in specific, identifiable segments. Fixing the 
right segments, rather than applying company-wide policies, is likely to deliver the 
highest return on any retention investment.

---

## Key Findings

### 1. Overtime is the real driver behind Sales' elevated attrition
Sales' overall attrition rate (20.63%) looks like a department-wide problem, but 
splitting by overtime reveals otherwise: Sales employees without overtime attrite at 
13.84% (below company average), while those working overtime attrite at 37.50% — 
the largest overtime/non-overtime gap of any department. The issue is workload, not 
department culture.

### 2. Pay drives early-career attrition, but not senior attrition
Raw comparison shows leavers earn 30% less on average than stayers — but this is 
confounded by tenure. Controlling for tenure, the pay gap is 35% for 0-2 year 
employees, narrowing steadily with seniority, and reversing entirely for 10+ year 
employees (who earn 4% MORE when they leave). Pay-based interventions should target 
early-career staff specifically.

### 3. Attrition risk is concentrated in specific roles, not departments
Department-level rates mask the real hotspots. Sales Representatives attrite at 
39.76% — nearly 2.3x the company average — while Sales Executives and Managers are 
comparatively stable (17.48% and 5.41%). Similarly, Laboratory Technicians (23.94%) 
drive R&D's risk despite R&D's low overall department rate.

### 4. Sales Representatives working overtime are the single highest-risk group
This combination attrites at 66.67% (16 of 24 employees) — over 4x the company 
baseline. Role and overtime compound rather than act independently. Sample size is 
modest (n=24) but the signal is real and actionable.

### 5. Attrition rate and attrition cost point to different departments
Sales has the higher rate (20.63% vs R&D's 13.84%), but total cost is nearly tied 
between the two ($3.26M vs $3.28M/year), because R&D's much larger headcount 
offsets its lower rate. Both departments deserve budget, but for different reasons — 
Sales needs a targeted fix, R&D needs broader monitoring.

---

## Recommendations (Prioritized)

| Priority | Recommendation | Rationale | Est. Impact |
|---|---|---|---|
| 1 | Review Sales Representative workload/quota structure and overtime frequency | Addresses the single highest-risk group (66.67% attrition) | Highest ROI — small, well-defined group |
| 2 | Introduce targeted pay review for employees with 0-2 years tenure | Pay gap is real and largest for this group specifically | Addresses ~35% of leaver pool driven by pay |
| 3 | Investigate senior-employee (10+ yr) attrition drivers beyond pay | Pay isn't the cause here — likely career stagnation | Protects highest-cost, hardest-to-replace talent |
| 4 | Monitor R&D attrition at the role level, despite low department average | Large headcount means even moderate rates carry major cost | Prevents cost creep in the company's largest department |
| 5 | Avoid blanket department-wide raises or perks | Would misallocate budget toward already-stable roles (e.g., Sales Managers, Executives) | Cost avoidance |

### Prioritization framework used
Recommendations are ranked by **(risk concentration × ease of targeting) ÷ cost of 
intervention** — favoring fixes that are specific, actionable, and address the 
highest-risk, most identifiable groups first, before broader/more expensive 
company-wide interventions.

---

## Methodology Note
Cost estimates use a standard industry assumption of 50% of annual salary per 
departure (recruiting, onboarding, lost productivity) — a conservative figure within 
the commonly cited 50-150% range. Analysis performed via Python (pandas) for EDA, 
SQL (window functions, CTEs) for segmentation, and Power BI for dashboard delivery. 
Full technical detail in accompanying SQL/notebook files.