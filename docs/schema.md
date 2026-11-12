# Silver Schema (unified event table)

| Column | Type | Nullable | Description | CIC-IDS2017 source |
|--------|------|----------|-------------|--------------------|
| event_time | timestamp | No | Event time (re-based at replay) | Timestamp |
| source_type | string | No | `netflow` or `fw_logs` | constant `netflow` |
| src_ip | string | No | Source IP | Source IP |
| dst_ip | string | No | Destination IP | Destination IP |
| dst_port | int | Yes | Destination port | Destination Port |
| protocol | string | Yes | TCP / UDP / ICMP | Protocol (6/17/1) |
| action | string | Yes | allow / deny | default `allow` |
| bytes | long | Yes | Total bytes (fwd + bwd) | Total Length of Fwd + Bwd Packets |
| packets | long | Yes | Total packets (fwd + bwd) | Total Fwd + Backward Packets |
| flow_duration | long | Yes | Flow duration (microseconds) | Flow Duration |
| user | string | Yes | VPN username | simulator only |
| vpn_event | string | Yes | login_success / login_failed / logout | simulator only |
| label | string | Yes | BENIGN or attack name (evaluation/ML only) | Label |

## Rules
- `label` is never used by detection rules, only for evaluation and ML training.
- Column names are lowercase snake_case.
- Invalid rows go to the `dlq` topic.
