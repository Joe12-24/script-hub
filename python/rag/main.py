from openai import OpenAI

def main():
    client = OpenAI(api_key="sk-2f0b420dc5f8484789a35db4f1d4bc3c", base_url="https://api.deepseek.com")
    response = client.chat.completions.create(
        model="deepseek-chat",
        messages=[
            {"role": "system", "content": "You are a helpful assistant"},
            {"role": "user", "content": "Hello"},
        ],
        stream=False
    )
    print(response.choices[0].message.content)

if __name__ == "__main__":
    main()