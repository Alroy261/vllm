curl --location 'https://yoxserve.tenant-centml-dev.ord1.ingress.coreweave.cloud/api/start_model_serving' \
--header 'Content-Type: application/json' \
--data '{
    "model_id": "echo-server",
    "deployment_spec": {
        "pod_spec": {
            "container_spec": {
                "registry": "ealen",
                "name": "echo-server",
                "tag": "latest",
                "ports": [
                    {
                        "name": "http",
                        "port": 80
                    }
                ],
                "env_params": [
                    {
                        "name": "ENV_SAMPLE_KEY",
                        "value": "sample_value"
                    }
                ],
                "status_probe": {
                    "liveness": {
                        "path": "/",
                        "port": 80
                    },
                    "readiness": {
                        "path": "/",
                        "port": 80
                    }
                }
            },
            "resource": {
                "requests": {
                    "cpu": "100m",
                    "memory": "200Mi"
                },
                "limits": {
                    "cpu": "500m",
                    "memory": "500Mi"
                }
            },
            "node_affinity": {
                "required": {
                    "node_selector_terms": [
                        {
                            "match_expressions": [
                                {
                                    "key": "node.coreweave.cloud/cpu",
                                    "operator": "In",
                                    "values": [
                                        "amd-epyc-rome",
                                        "amd-epyc-milan"
                                    ]
                                }
                            ]
                        }
                    ]
                }
            }
        }
    },
    "service_spec": {
        "ports": [
            {
                "name": "default",
                "port": 80,
                "target_port": "http"
            }
        ]
    },
    "hpa_spec": {
        "min_replicas": 2,
        "max_replicas": 5,
        "target_cpu_utilization": 50
    },
    "password_spec": {
        "data": {
            "admin": "admin:$2b$12$19xbxJEhWn/WVteEyF0qieO3r9xaSc0WrLBN2voNS8IEko0.c00pu"
        }
    }
}'
