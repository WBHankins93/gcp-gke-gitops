# SLO v1 (stub)

- **Service:** hello-web  
- **SLI:** success_rate = 1 - (5xx_requests / total_requests)  
- **SLO:** success_rate ≥ 99.5% over 28d  
- **Error budget:** 0.5%

### Prometheus expression (placeholder)
```promql
sum(rate(nginx_ingress_controller_requests{status=~"5.."}[5m]))
/
sum(rate(nginx_ingress_controller_requests[5m]))
```