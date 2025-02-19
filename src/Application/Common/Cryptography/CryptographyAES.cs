﻿using System.Security.Cryptography;

using System.Text;


namespace Application.Common.Cryptography
{
    public class CryptographyAES
    {
        #region Decrypt

        /// <summary>
        /// Decrypt the input string.
        /// </summary>
        /// <param name="input">Input string.</param>
        /// <param name="passphrase">Passphrase to use.</param>
        /// <param name="keySize">Key size to set.</param>
        /// <returns>Decrypted string.</returns>
        public static string Decrypt (
            string input,
            string passphrase,
            int? keySize = null )
        {
            var key = CreateMd5Hash(passphrase);
            var fullCipher = Convert.FromBase64String(input);
            var iv = new byte[16];
            var cipher = new byte[fullCipher.Length - iv.Length];

            Buffer.BlockCopy(fullCipher, 0, iv, 0, iv.Length);
            Buffer.BlockCopy(fullCipher, iv.Length, cipher, 0, fullCipher.Length - iv.Length);

            string result;

            using var aes = Aes.Create( );

            if (keySize.HasValue &&
                keySize.Value > 0)
            {
                aes.KeySize = keySize.Value;
            }
            else if (aes.LegalKeySizes?.Length > 0)
            {
                aes.KeySize = aes.LegalKeySizes
                    .Max(n => n.MaxSize);
            }

            using var decryptor = aes.CreateDecryptor(key, iv);
            using var memoryStream = new MemoryStream(cipher);
            using var cryptoStream = new CryptoStream(memoryStream, decryptor, CryptoStreamMode.Read);

            using (var streamReader = new StreamReader(cryptoStream))
            {
                result = streamReader.ReadToEnd( );
            }

            return result;
        }

        #endregion

        #region Encrypt

        /// <summary>
        /// Encrypt the input string.
        /// </summary>
        /// <param name="input">Input string.</param>
        /// <param name="passphrase">Passphrase to use.</param>
        /// <param name="keySize">Key size to set.</param>
        /// <returns>Encrypted string.</returns>
        public static string Encrypt (
            string input,
            string passphrase,
            int? keySize = null )
        {
            var key = CreateMd5Hash(passphrase);

            using var aes = Aes.Create( );

            if (keySize.HasValue &&
                keySize.Value > 0)
            {
                aes.KeySize = keySize.Value;
            }
            else if (aes.LegalKeySizes?.Length > 0)
            {
                aes.KeySize = aes.LegalKeySizes
                    .Max(n => n.MaxSize);
            }

            using var encryptor = aes.CreateEncryptor(key, aes.IV);
            using var memoryStream = new MemoryStream( );
            using var cryptoStream = new CryptoStream(memoryStream, encryptor, CryptoStreamMode.Write);

            using (var streamWriter = new StreamWriter(cryptoStream))
            {
                streamWriter.Write(input);
            }

            var iv = aes.IV;
            var bytes = memoryStream.ToArray( );
            var result = new byte[iv.Length + bytes.Length];

            Buffer.BlockCopy(iv, 0, result, 0, iv.Length);
            Buffer.BlockCopy(bytes, 0, result, iv.Length, bytes.Length);

            return Convert.ToBase64String(result);
        }

        #endregion

        #region Helper functions

        /// <summary>
        /// Create a MD5 hash of the input string.
        /// </summary>
        /// <param name="input">Input string.</param>
        /// <returns>Created MD5 hash.</returns>
        private static byte[] CreateMd5Hash ( string input )
        {
            using var md5 = MD5.Create( );

            var inputBytes = Encoding.ASCII.GetBytes(input);
            var hashBytes = md5.ComputeHash(inputBytes);
            var sb = new StringBuilder( );

            for (int i = 0; i < hashBytes.Length; i++)
            {
                sb.Append(hashBytes[i].ToString("X2"));
            }

            return Encoding.UTF8.GetBytes(sb.ToString( ));
        }

        #endregion
        public static string GenerarLlaveHexadecimal ( int int_longitud )
        {
            try
            {
                Random rnd = new ((int)DateTime.Now.Ticks);
                Byte[] b = new Byte[int_longitud];
                rnd.NextBytes(b);

                return ByteArrayToHex(b);
            }
            catch
            {
                throw;
            }
        }
        public static string ByteArrayToHex ( byte[] bData )
        {
            StringBuilder stringBuilder = new ( );
            int arg_0F_0 = 0;
            int upperBound = bData.GetUpperBound(0);
            checked
            {
                for (int i = arg_0F_0; i <= upperBound; i++)
                {
                    stringBuilder.AppendFormat("{0:X2}", bData[i]);
                }
                return stringBuilder.ToString( );
            }
        }
    }
}
