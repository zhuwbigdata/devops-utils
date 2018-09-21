Sys.setenv("AWS_ACCESS_KEY_ID" = '',
           "AWS_SECRET_ACCESS_KEY" = '',
           "AWS_DEFAULT_REGION" = "us-east-1",
           "AWS_SESSION_TOKEN" = "")
library("aws.kms")
library("aws.signature")
library("base64enc") 
#list_kms_keys()

key_id <- 'arn:aws:kms:us-east-1:660830477239:key/4d91528b-629c-43be-a0b8-40a32d5c57d0'
print(key_id)
key <- get_kms_key(key_id)

tmp <- tempfile()
cat('myP@assw0rdA10NE', file = tmp)

passwd_blob <-  encrypt(tmp,  key) 
print("Encrypted password:")
print(passwd_blob)

passwd_plaintext <- decrypt(passwd_blob, key, encode = FALSE)

print("Derypted password:")
print(rawToChar(base64enc::base64decode(passwd_plaintext)))
