
import os
from dotenv import load_dotenv
from langchain_core.prompts import ChatPromptTemplate
from langchain_groq import ChatGroq

chat = ChatGroq(temperature=0, groq_api_key="take-api-from-env-file", model_name="mixtral-8x7b-32768")

variabile = 17.09
messages = [
        ("system", f"You are a helpful translator. Increment the number {variabile} by 5 and return only the result, no text."),        ]
response = chat.invoke(messages)
variabile = float(response.content.split("\n")[0])
print(variabile)
