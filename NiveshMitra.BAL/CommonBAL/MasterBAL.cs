using NiveshMitra.Common;
using NiveshMitra.DAL.CommonDAL;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace NiveshMitra.BAL.CommonBAL
{
    public class MasterBAL
    {
        public MasterDAL objMasterDAL { get; } = new MasterDAL();
        public List<MasterConstType> GetConstitutionType()
        {
            return objMasterDAL.GetConstitutionType();
        }
        public List<MasterIndustryType> GetIndustryTypeMaster()
        { return objMasterDAL.GetIndustryTypeMaster(); }
        public List<MasterSector> GetSectors()
        {
            return objMasterDAL.GetSectors();
        }
        public List<MasterLineOfActivity> GetLineOfActivity(string Sector)
        {
            return objMasterDAL.GetLineOfActivity(Sector);
        }
        public string GetPCBCategory(string LineofActivityID)
        {
            return objMasterDAL.GetPCBCategory(LineofActivityID);
        }
        public List<MasterPowerReq> GetPowerKW()
        {
            return objMasterDAL.GetPowerKW();
        }
        public List<MasterElecRegulations> GetElectricRegulations()
        { return objMasterDAL.GetElectricRegulations(); }
        public List<MasterVoltages> GetVoltages()
        { return objMasterDAL.GetVoltageMaster(); }
        public List<MasterPowerPlants> GetPowerPlantsMaster()
        { return objMasterDAL.GetPowerPlantsMaster(); }
        public List<MasterWATERMUNICIPAL> GetMunicipalareaMaster()
        { return objMasterDAL.GetMunicipalareaMaster(); }

        public List<MasterDistrcits> GetDistrcits()
        {
            return objMasterDAL.GetDistrcits();
        }
        public List<MasterTehsil> GetTehsil(string DistrictId)
        {
            return objMasterDAL.GetTehsil(DistrictId);
        }
        public List<MasterBlockPanchayat> GetBlockPanchayat(string TehsilCode)
        {
            return objMasterDAL.GetBlockPanchayat(TehsilCode);
        }
        public List<MasterGramPanchayat> GetGramPanchayat(string BlockPanchayatCode)
        {
            return objMasterDAL.GetGramPanchayat(BlockPanchayatCode);
        }

        //public List<MasterVillages> GetVillages(string GramPanchayatCode)
        //{
        //    return objMasterDAL.GetVillages(GramPanchayatCode);
        //}
        public List<MasterVillages> GetVillages(string TehsilCode)
        {
            return objMasterDAL.GetVillages(TehsilCode);
        }
        public List<MasterState> GetState()
        {
            return objMasterDAL.GetState();
        }

        /// encryption and decryption code///
        public string EncryptFilePath(string filePath)
        {
            string encryptionKey = "SYSTIMEMIPASS";
            // Convert the file path into bytes
            byte[] plainBytes = System.Text.Encoding.UTF8.GetBytes(filePath);

            // Generate the key and IV (use a secure derivation method)
            byte[] key = GenerateKey(encryptionKey, 256); // AES-256 key (32 bytes)
            byte[] iv = GenerateIV();

            // Perform AES encryption
            byte[] encryptedBytes;
            using (Aes aes = Aes.Create())
            {
                aes.Key = key;
                aes.IV = iv;
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, aes.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(plainBytes, 0, plainBytes.Length);
                        cs.FlushFinalBlock();
                        encryptedBytes = ms.ToArray();
                    }
                }
            }

            // Combine IV and encrypted data (IV is needed for decryption)
            byte[] combined = new byte[iv.Length + encryptedBytes.Length];
            Buffer.BlockCopy(iv, 0, combined, 0, iv.Length);
            Buffer.BlockCopy(encryptedBytes, 0, combined, iv.Length, encryptedBytes.Length);

            // Convert to hexadecimal string for URL-safe representation
            return BitConverter.ToString(combined).Replace("-", "");
        }

        // Generate a random IV (Initialization Vector)
        private byte[] GenerateIV()
        {
            using (Aes aes = Aes.Create())
            {
                aes.GenerateIV();
                return aes.IV;
            }
        }

        // Key generation from password
        private byte[] GenerateKey(string password, int keySize)
        {
            byte[] salt = new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 }; // Example salt
            using (var pdb = new Rfc2898DeriveBytes(password, salt, 10000))
            {
                return pdb.GetBytes(keySize / 8);
            }
        }
    }
}
