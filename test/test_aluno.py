import pytest
import requests

BASE_URL = "http://localhost:5000"

def test_register_student():
    response = requests.post(f"{BASE_URL}/register", json={"name": "Teste", "ra": "123456"})
    assert response.status_code == 201