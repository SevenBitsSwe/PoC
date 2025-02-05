{
  "annotations": {
    "list": [
      {
        "builtIn": 1,
        "datasource": {
          "type": "grafana",
          "uid": "-- Grafana --"
        },
        "enable": true,
        "hide": true,
        "iconColor": "rgba(0, 211, 255, 1)",
        "name": "Annotations & Alerts",
        "type": "dashboard"
      }
    ]
  },
  "editable": true,
  "fiscalYearStartMonth": 0,
  "graphTooltip": 0,
  "id": 2,
  "links": [],
  "panels": [
    {
      "datasource": {
        "type": "grafana-clickhouse-datasource",
        "uid": "ee5wustcp8zr4b"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "custom": {
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            }
          },
          "mappings": [
            {
              "options": {
                "locationID": {
                  "index": 0
                }
              },
              "type": "value"
            }
          ],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green"
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 23,
        "w": 24,
        "x": 0,
        "y": 0
      },
      "id": 1,
      "options": {
        "controls": {
          "mouseWheelZoom": true,
          "showAttribution": true,
          "showDebug": false,
          "showMeasure": false,
          "showScale": false,
          "showZoom": true
        },
        "layers": [
          {
            "config": {
              "showLegend": true,
              "style": {
                "color": {
                  "fixed": "dark-green"
                },
                "opacity": 0.4,
                "rotation": {
                  "fixed": 0,
                  "max": 360,
                  "min": -360,
                  "mode": "mod"
                },
                "size": {
                  "fixed": 5,
                  "max": 15,
                  "min": 2
                },
                "symbol": {
                  "fixed": "img/icons/marker/circle.svg",
                  "mode": "fixed"
                },
                "symbolAlign": {
                  "horizontal": "center",
                  "vertical": "center"
                },
                "textConfig": {
                  "fontSize": 12,
                  "offsetX": 0,
                  "offsetY": 0,
                  "textAlign": "center",
                  "textBaseline": "middle"
                }
              }
            },
            "location": {
              "mode": "auto"
            },
            "name": "Layer 1",
            "tooltip": true,
            "type": "markers"
          }
        ],
        "tooltip": {
          "mode": "details"
        },
        "view": {
          "allLayers": true,
          "id": "coords",
          "lat": 45.407713,
          "lon": 11.875896,
          "zoom": 13.88
        }
      },
      "pluginVersion": "11.5.1",
      "targets": [
        {
          "builderOptions": {
            "aggregates": [],
            "columns": [
              {
                "alias": "*",
                "custom": false,
                "name": "*",
                "type": "String"
              }
            ],
            "database": "nearyou",
            "filters": [
              {
                "condition": "AND",
                "filterType": "custom",
                "key": "id",
                "label": "id",
                "operator": "=",
                "type": "UInt32",
                "value": 0
              }
            ],
            "groupBy": [],
            "limit": 1000,
            "meta": {},
            "mode": "list",
            "orderBy": [],
            "queryType": "table",
            "table": "attivita"
          },
          "datasource": {
            "type": "grafana-clickhouse-datasource",
            "uid": "ee5wustcp8zr4b"
          },
          "editorType": "sql",
          "format": 1,
          "meta": {
            "builderOptions": {
              "aggregates": [],
              "columns": [
                {
                  "alias": "*",
                  "custom": false,
                  "name": "*",
                  "type": "String"
                }
              ],
              "database": "nearyou",
              "filters": [
                {
                  "condition": "AND",
                  "filterType": "custom",
                  "key": "id",
                  "label": "id",
                  "operator": "=",
                  "type": "UInt32",
                  "value": 0
                }
              ],
              "groupBy": [],
              "limit": 1000,
              "meta": {},
              "mode": "list",
              "orderBy": [],
              "queryType": "table",
              "table": "attivita"
            }
          },
          "pluginVersion": "4.7.0",
          "queryType": "table",
          "rawSql": "SELECT * FROM \"nearyou\".\"attivita\" WHERE ( id = ${location_id} ) LIMIT 1000",
          "refId": "A"
        },
        {
          "builderOptions": {
            "aggregates": [],
            "columns": [
              {
                "alias": "*",
                "custom": false,
                "name": "*",
                "type": "String"
              }
            ],
            "database": "nearyou",
            "filters": [
              {
                "condition": "AND",
                "filterType": "custom",
                "key": "id",
                "label": "id",
                "operator": "=",
                "type": "Int16",
                "value": 1
              }
            ],
            "groupBy": [],
            "limit": 1000,
            "meta": {},
            "mode": "list",
            "orderBy": [],
            "queryType": "table",
            "table": "positions"
          },
          "datasource": {
            "type": "grafana-clickhouse-datasource",
            "uid": "ee5wustcp8zr4b"
          },
          "editorType": "builder",
          "format": 1,
          "hide": false,
          "pluginVersion": "4.7.0",
          "rawSql": "SELECT * FROM \"nearyou\".\"positions\" WHERE ( id = 1 ) LIMIT 1000",
          "refId": "B"
        }
      ],
      "title": "Panel Title",
      "type": "geomap"
    }
  ],
  "preload": false,
  "refresh": "",
  "schemaVersion": 40,
  "tags": [],
  "templating": {
    "list": [
      {
        "current": {
          "text": "1",
          "value": "1"
        },
        "hide": 2,
        "label": "location_id",
        "name": "location_id",
        "options": [
          {
            "selected": true,
            "text": "1",
            "value": "1"
          }
        ],
        "query": "1",
        "type": "textbox"
      }
    ]
  },
  "time": {
    "from": "now-6h",
    "to": "now"
  },
  "timepicker": {},
  "timezone": "browser",
  "title": "mappa specifica",
  "uid": "cec5m2txm1fr4a",
  "version": 11,
  "weekStart": ""
}

