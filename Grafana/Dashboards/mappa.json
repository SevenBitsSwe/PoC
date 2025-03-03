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
  "id": 1,
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
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          }
        },
        "overrides": [
          {
            "matcher": {
              "id": "byName",
              "options": "C id"
            },
            "properties": [
              {
                "id": "links",
                "value": [
                  {
                    "targetBlank": true,
                    "title": "dettagli",
                    "url": "http://localhost:3000/d/cec5m2txm1fr4a/new-dashboard?orgId=1&from=now-6h&to=now&timezone=browser&editPanel=1&var-location_id=${__data.fields.id}"
                  }
                ]
              }
            ]
          }
        ]
      },
      "gridPos": {
        "h": 23,
        "w": 24,
        "x": 0,
        "y": 0
      },
      "id": 1,
      "options": {
        "basemap": {
          "config": {},
          "name": "Layer 0",
          "type": "osm-standard"
        },
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
                  "fixed": "dark-blue"
                },
                "opacity": 0.8,
                "rotation": {
                  "fixed": 0,
                  "max": 360,
                  "min": -360,
                  "mode": "mod"
                },
                "size": {
                  "fixed": 19,
                  "max": 15,
                  "min": 2
                },
                "symbol": {
                  "fixed": "img/icons/marker/square.svg",
                  "mode": "fixed"
                },
                "symbolAlign": {
                  "horizontal": "center",
                  "vertical": "center"
                },
                "text": {
                  "field": "B message",
                  "fixed": "",
                  "mode": "field"
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
            "filterData": {
              "id": "byRefId",
              "options": "B"
            },
            "location": {
              "latitude": "latitude",
              "longitude": "longitude",
              "mode": "coords"
            },
            "name": "Messaggio",
            "tooltip": true,
            "type": "markers"
          },
          {
            "config": {
              "showLegend": true,
              "style": {
                "color": {
                  "fixed": "dark-green"
                },
                "opacity": 1,
                "rotation": {
                  "fixed": 0,
                  "max": 360,
                  "min": -360,
                  "mode": "mod"
                },
                "size": {
                  "fixed": 6,
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
            "filterData": {
              "id": "byRefId",
              "options": "A"
            },
            "location": {
              "latitude": "latitude",
              "longitude": "longitude",
              "mode": "coords"
            },
            "name": "Posizioni utente",
            "tooltip": true,
            "type": "markers"
          },
          {
            "config": {
              "showLegend": true,
              "style": {
                "color": {
                  "fixed": "dark-red"
                },
                "opacity": 1,
                "rotation": {
                  "fixed": 0,
                  "max": 360,
                  "min": -360,
                  "mode": "mod"
                },
                "size": {
                  "fixed": 3,
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
            "filterData": {
              "id": "byRefId",
              "options": "C"
            },
            "location": {
              "mode": "auto"
            },
            "name": "Attività",
            "tooltip": true,
            "type": "markers"
          }
        ],
        "tooltip": {
          "mode": "details"
        },
        "view": {
          "allLayers": true,
          "id": "fit",
          "lat": 45.402748,
          "lon": 11.86733,
          "zoom": 15
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
            "filters": [],
            "groupBy": [],
            "limit": 2,
            "meta": {},
            "mode": "list",
            "orderBy": [
              {
                "dir": "DESC",
                "name": "received_at"
              }
            ],
            "queryType": "table",
            "table": "positions"
          },
          "datasource": {
            "type": "grafana-clickhouse-datasource",
            "uid": "ee5wustcp8zr4b"
          },
          "editorType": "builder",
          "format": 1,
          "pluginVersion": "4.5.1",
          "rawSql": "SELECT * FROM \"nearyou\".\"positions\" ORDER BY received_at DESC LIMIT 2",
          "refId": "A"
        },
        {
          "builderOptions": {
            "aggregates": [],
            "columns": [
              {
                "alias": "longitude",
                "custom": false,
                "name": "longitude",
                "type": "Float64"
              },
              {
                "alias": "latitude",
                "custom": false,
                "name": "latitude",
                "type": "Float64"
              },
              {
                "alias": "message",
                "custom": false,
                "name": "message",
                "type": "String"
              }
            ],
            "database": "nearyou",
            "filters": [],
            "groupBy": [],
            "limit": 1,
            "meta": {},
            "mode": "list",
            "orderBy": [
              {
                "dir": "DESC",
                "name": "creationTime"
              }
            ],
            "queryType": "table",
            "table": "messageTable"
          },
          "datasource": {
            "type": "grafana-clickhouse-datasource",
            "uid": "ee5wustcp8zr4b"
          },
          "editorType": "builder",
          "format": 1,
          "hide": false,
          "pluginVersion": "4.5.1",
          "rawSql": "SELECT longitude, latitude, message FROM \"nearyou\".\"messageTable\" ORDER BY creationTime DESC LIMIT 1",
          "refId": "B"
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
            "filters": [],
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
          "editorType": "builder",
          "format": 1,
          "hide": false,
          "pluginVersion": "4.7.0",
          "rawSql": "SELECT * FROM \"nearyou\".\"attivita\" LIMIT 1000",
          "refId": "C"
        }
      ],
      "title": "Mappa",
      "type": "geomap"
    }
  ],
  "preload": false,
  "schemaVersion": 40,
  "tags": [],
  "templating": {
    "list": []
  },
  "time": {
    "from": "now-6h",
    "to": "now"
  },
  "timepicker": {},
  "timezone": "browser",
  "title": "Mappa",
  "uid": "be606rc2xx1q8d",
  "version": 1,
  "weekStart": ""
}