
# 📊 Olympic Games Dataset Sources

Due to GitHub's file size limitations (files exceeding 100MB), the primary dataset used in this project is not hosted directly in this repository. 

Please download the datasets from the official sources below to run the SQL ingestion scripts locally.

---

## 🔗 Official Download Links

* **Primary Dataset (Athlete Events):** Download the `athlete_events.csv` file from [Kaggle - 120 Years of Olympic History](https://www.kaggle.com/datasets/heesoo37/120-years-of-olympic-history-athletes-and-results).
* **Secondary Dataset (NOC Regions):** The mapping file `noc_regions.csv` is available in the same Kaggle link above. *(You can also find a backup copy uploaded directly in this `Datasets/` folder for convenience)*.

---

## 📂 Local Setup & Directory Structure

Once downloaded, place both CSV files into your local directory. 

To ensure the **`03_Inserting_data.sql`** bulk insert script runs successfully without path errors, update the file path in your SQL Server local environment to point to your exact folder:

```text
C:\Your_Local_Path\Olympic-Sports-SQL-Project\Datasets\
├── athlete_events.csv
└── noc_regions.csv
