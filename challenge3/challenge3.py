"""
    The method gey_key_value fetches the value of the nested dictionary.
    Args:
        object: dict
        key : str
    output:
        str

    Example: 
        object= {"x":{"y":{"z":"a"}}}
        key = 'x/y/z'
        Value = a
"""


def get_key_value(data: dict, key: str):
    try:
        key = key.split('/')
        for i in key:
            data = data[i]
        return f"Value={data}"
    except Exception as e:
        return f"Unable to get data due to {str(e)}"



if __name__ == "__main__":
    object= {"x":{"y":{"z":"a"}}}
    print(get_key_value(object,key='x/y/z'))

