## 🔹 Selectors
- **Instant Vector Selectors**:  
  - Basic form: `metric_name{label="value"}`  
  - Filters time series by labels (e.g., `up{job="node-exporter"}`).
- **Range Vector Selectors**:  
  - Add a time range: `metric_name[5m]`  
  - Retrieves samples over a window (e.g., `rate(http_requests_total[5m])`).
- **Offset Modifier**:  
  - Shift data in time: `metric_name offset 1h`.



## 🔹 Operators

### ➤ Binary Operators
Used to combine or compare vectors.

#### Arithmetic
- `+`, `-`, `*`, `/`, `%`, `^`
- Example:  
  ```promql
  node_memory_MemTotal_bytes - node_memory_MemFree_bytes
  ```
  (calculates used memory)

#### Comparison
- `==`, `!=`, `>`, `<`, `>=`, `<=`
- Example:  
  ```promql
  up == 0
  ```
  (selects down targets)

- **Modifiers**:  
  - `bool` → returns `1` or `0` instead of filtering.  
    ```promql
    http_requests_total > 100 bool
    ```



### ➤ Aggregators
Aggregate across multiple series.

- `sum()` → total across series  
- `avg()` → average value  
- `min()`, `max()` → lowest/highest value  
- `count()` → number of series  
- `topk()`, `bottomk()` → top/bottom N series  
- Example:  
  ```promql
  sum(rate(http_requests_total[5m])) by (instance)
  ```
  (requests per instance)



## 🔹 Functions
PromQL provides built-in functions for transformations.

- **rate()** → per-second average rate over range vectors  
  ```promql
  rate(node_cpu_seconds_total[5m])
  ```
- **irate()** → instant rate (last two samples)  
- **increase()** → total increase over time window  
- **histogram_quantile()** → calculate quantiles from histogram buckets  
- **abs(), ceil(), floor(), round()** → math helpers  
- **label_replace()** → manipulate labels dynamically  
- **time()** → current evaluation timestamp  


##  Notes 
- Count 
- Use () by 
- sum 
- [] vs {}