salt= Digest::SHA1.hexdigest("# We add {email} as unique value and #{Time.now} as random value")
encrypted_password= Digest::SHA1.hexdigest("Adding #{salt} to {password}")