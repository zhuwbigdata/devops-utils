from __future__ import print_function
import base64
import boto3
region_name = 'us-east-1'
kms_client = boto3.client('kms',region_name=region_name)
# Generate a data key

# Replace the following fictitious CMK ARN with a valid CMK ID or ARN
key_id = 'arn:aws:kms:us-east-1:660830477239:key/4d91528b-629c-43be-a0b8-40a32d5c57d0'

passwd_plaintext = 'myP@assw0rdA10NE'

response = kms_client.encrypt(
    KeyId=key_id,
    Plaintext=passwd_plaintext
)

passwd_blob = response['CiphertextBlob']
print('Encrypted ciphertext:', base64.b64encode(passwd_blob))

response = kms_client.decrypt(
    CiphertextBlob=passwd_blob
)

print('Decrypted plaintext:', response['Plaintext'])
