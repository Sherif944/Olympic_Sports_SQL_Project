# 🏅 Olympic Sports Data Warehouse & Analysis (SQL Server)

<p align="center">
  <img src="https://github.com/user-attachments/assets/446f763c-719d-40fa-9113-0ff472927252" alt="Olympic Sports SQL Project Banner" width="70%">
</p>

Welcome to my Olympic Sports Data Analysis project! In this project, I designed a relational database, handled complex bulk data ingestion, and performed advanced analytical queries to uncover historical trends across 120 years of Olympic games using Advanced SQL (T-SQL) on Microsoft SQL Server.

---

## 📌 Project Overview
The objective of this project was to clean, structure, and analyze a comprehensive dataset containing 120 years of Olympic history (athletes, nations, events, and performance records). By migrating flat raw files into a structured relational schema in SQL Server, I optimized data loading and formulated sophisticated queries to solve core analytical questions on historic athletic performance.

### 🚀 Key Highlights of the Analysis:
* **Ingestion Optimization:** Handled raw CSV shifting and text parsing errors dynamically using custom parameters in `BULK INSERT`.
* **Performance Ranking Logic:** Solved ties in gold medal distribution safely using advanced ranking partitions.
* **Matrix Reporting (Pivoting):** Aggregated multi-class transactional records into a single-line nation medal tally layout.
* **Sequence & Peak Tracking:** Located seasonal dominance milestones by partitioning longitudinal datasets.

---

## 🛠️ Key SQL Techniques Used:
1. **Common Table Expressions (CTEs):** Organizing multi-layered, highly readable subqueries.
2. **Window Functions:** Leveraging `DENSE_RANK()` for handling athletic ties and `FIRST_VALUE()` for isolating leaders.
3. **Conditional Aggregation:** Converting raw record rows into matrix-style columns using `SUM(CASE WHEN...)`.
4. **DDL & Ingestion Control:** Crafting transactional constraints, dropping/creating DB states, and optimized bulk data transfers.

---

## 📣 Business Questions Solved:
* Which sports have successfully maintained 100% continuity by being played in every single Summer Olympic Games edition?
* Who are the top 5 elite all-time Olympic athletes with the highest Gold medal tallies?
* What is the absolute, side-by-side distribution of Gold, Silver, and Bronze medals won by each country?
* In each specific Olympic Games edition, which countries completely dominated by claiming the maximum Gold, Silver, and Bronze medals?

---

---

## 📜 Project Conclusion
Through this analysis, I demonstrated how raw transactional event data can be transformed into robust analytical summaries. Utilizing optimized Microsoft SQL Server procedures ensured high-performance execution of queries over hundreds of thousands of historical athlete logs, providing clean, business-ready insights for strategic reporting.

---

## 👤 About Me
Hi, I'm Sherif Mohammed, a professional pharmacist and data enthusiast. I specialize in turning complex datasets into clear, actionable insights through advanced SQL and data automation.

Let's connect!

<p align="left">
  <a href="https://www.linkedin.com/in/sherif-mohamed-63a233261" target="_blank">
    <img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" alt="LinkedIn Button"/>
  </a>
  &nbsp;&nbsp;&nbsp;&nbsp;
  <a href="mailto:sherifmo7amed77@gmail.com">
    <img src="https://img.shields.io/badge/Gmail-D14836?style=for-the-badge&logo=gmail&logoColor=white" alt="Gmail Button"/>
  </a>
</p>

* **LinkedIn:** [linkedin.com/in/sherif-mohamed-63a233261](https://www.linkedin.com/in/sherif-mohammed-8a0aa3162)
* **Email:** [sherifmo7amed77@gmail.com](mailto:sherifmohammed611@gmail.com)
