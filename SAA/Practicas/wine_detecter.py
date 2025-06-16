import requests

URL = 'http://127.0.0.1:5000/calcular-calidad'

headers = {"Content-Type": "application/json"}

wine_cols = ['fixed_acidity', 'volatile_acidity', 'citric_acid', 'residual_sugar', 'chlorides',
             'free_sulfur_dioxide', 'total_sulfur_dioxide', 'density', 'pH', 'sulphates', 'alcohol']

try:
    features = {}
    # Solicita los valores de los atributos del vino al usuario
    for feature in wine_cols:
        value = float(input(f"Ingrese el valor de {feature}: "))
        features.update({feature: value})  # Agregar el valor al diccionario de características

    print("="*35)

    response = requests.post(URL, json=features, headers=headers)

    predicctions = response.json()

    for key, value in predicctions.items():
        print(f"{key}: {value}")

except Exception as e:
    print(f"Ocurrió un error durante la predicción: {e}")
