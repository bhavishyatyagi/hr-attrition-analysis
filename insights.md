# Project Insights Log

## Data Cleaning
- Dropped EmployeeCount, Over18, StandardHours — constant columns with no analytical value.


## EDA Findings

### Finding 1: Overtime is the real driver behind Sales' high attrition
- Overall company attrition rate: 16.12%
- Sales department overall: 20.63% (appears to be the highest-risk department)
- BUT when split by OverTime:
  - Sales + OverTime=Yes: 37.50% attrition
  - Sales + OverTime=No: 13.84% attrition (actually below company average)
- Insight: Sales' elevated attrition is not a department-wide issue — it's concentrated 
  almost entirely in the overtime subgroup, where attrition is 2.7x higher than 
  non-overtime Sales employees, and the largest OT vs non-OT gap of any department.
- Business implication: A blanket "Sales retention program" would waste budget on 
  low-risk employees. The fix should target workload/staffing for employees working 
  overtime specifically — e.g., reviewing sales team headcount vs. quota load, or 
  overtime caps — rather than department-wide raises or perks.

### Finding 2: Pay is a real driver for early-career attrition, but not for senior employees
- Raw comparison (misleading on its own): employees who left earn $4,787/month on 
  average vs. $6,833 for those who stayed — looks like a clear pay problem.
- BUT leavers are also younger (33.6 vs 37.6) and less tenured (5.1 vs 7.4 years), 
  so raw income comparison is confounded by tenure — need to compare within tenure 
  groups for a fair read.
- After controlling for tenure (comparing leavers vs stayers within the same tenure 
  bracket):
  - 0-2 yrs: leavers earn 35% less than stayers ($3,411 vs $5,261) — widest gap
  - 3-5 yrs: leavers earn 24% less ($4,195 vs $5,553)
  - 6-10 yrs: leavers earn 16% less ($5,609 vs $6,702)
  - 10+ yrs: leavers earn 4% MORE than stayers ($11,319 vs $10,849) — pattern reverses
- Insight: Pay is a genuine, independent driver of attrition for early-career 
  employees, and the gap shrinks the more tenured someone is. For 10+ year employees, 
  pay is NOT the driver — something else (career stagnation, lack of growth, better 
  external offers) is likely causing senior attrition instead.
- Business implication: A single company-wide raise policy would be inefficient. 
  Targeted pay review/correction for 0-2 year employees would likely have the biggest 
  retention ROI, while senior attrition needs a different intervention (e.g., 
  promotion/growth path review) — pay increases alone won't fix it.




### Finding 3: Attrition risk is concentrated in specific job roles, not evenly spread across departments
- Department-level view was misleading on its own:
  - Sales overall: 20.63% (looked only moderately elevated)
  - R&D overall: 13.84% (looked relatively safe)
- Ranking job roles WITHIN each department (using RANK() window function) revealed 
  the real hotspots:
  - Sales Representative: 39.76% attrition (highest of any role company-wide, 
    n=83 — not a small sample)
  - Laboratory Technician (R&D): 23.94% — higher than Sales' entire department 
    average, despite R&D looking "safe" overall
  - Human Resources generalist role: 23.08%
- Meanwhile, larger roles within the same departments are much more stable:
  - Sales Executive: 17.48% (n=326, close to company baseline)
  - Sales Manager: 5.41%
- Insight: Department-level attrition rates mask which specific roles are actually 
  driving the problem. Sales' 20.63% overall rate is a blend of a high-risk role 
  (Sales Rep, 39.76%) and stable roles (Executives, Managers) — averaging hides 
  the real signal.
- Business implication: Retention budget should target specific roles (Sales 
  Representative, Lab Technician, HR generalist), not entire departments. A 
  department-wide raise or perk program would waste spend on already-stable roles 
  like Sales Executives and Managers, while under-addressing the actual at-risk group.
- Follow-up hypothesis worth testing: are Sales Representatives the same group 
  driving the earlier overtime finding? (Sales + OverTime=Yes was 37.5% attrition — 
  close to Sales Rep's 39.76%, likely overlapping populations.)




### Finding 4: Sales Representatives working overtime are the single highest-risk 
group in the company
- Sales Representative + OverTime=Yes: 66.67% attrition (16 of 24 employees left)
- Sales Representative + OverTime=No: 28.81% attrition (17 of 59 employees left)
- Company baseline: 16.12%
- Insight: This group attrites at over 4x the company average. Role (Sales Rep) and 
  overtime are individually risky, but combined they compound rather than acting 
  independently — being a Sales Rep alone carries elevated risk (28.81%), but adding 
  overtime more than doubles that risk again (to 66.67%).
- Caveat: Sample size is 24 employees — meaningful (16 people leaving is a real 
  signal, not noise), but small enough that this rate could shift somewhat with more 
  data. Worth flagging in the final presentation rather than overstating precision.
- Business implication: This is the single most urgent, specific group to address. 
  Recommend immediate review of Sales Rep workload/quota structure and overtime 
  frequency — likely the highest-ROI retention intervention in the entire company, 
  since it targets a small, well-defined, high-risk group rather than a broad 
  department-wide policy.



### Finding 5: Attrition rate and attrition cost point to different departments — 
both need attention, for different reasons
- Sales has the higher attrition RATE: 20.63% vs R&D's 13.84%
- BUT total attrition COST is almost tied between the two departments:
  - R&D: $3,278,244/year (48.2% of total company attrition cost)
  - Sales: $3,261,468/year (47.9% of total company attrition cost)
  - HR: $267,534/year (only 3.9%)
- Why: R&D is a much larger department (961 employees vs Sales' 446), so even a 
  lower attrition rate applied to a bigger headcount produces a comparable dollar 
  impact to Sales' higher rate on a smaller headcount.
- Insight: Rate and cost are different lenses and don't always point to the same 
  place. A recommendation based on rate alone (e.g., "fix Sales") would miss that 
  R&D is contributing an equally large financial loss, just less visibly (no single 
  dramatic subgroup like Sales Rep + Overtime stands out in R&D — the loss is spread 
  more evenly across a large headcount).
- Business implication: Sales needs a targeted, rate-driven fix (Sales Reps + 
  overtime specifically, per Finding 4). R&D needs a different kind of attention — 
  broader retention health monitoring across its large workforce, since no single 
  R&D subgroup is flagged as urgent, but the cumulative cost is just as large as 
  Sales'. Total company-wide attrition cost ($6.8M/year) justifies real budget for 
  addressing both.

