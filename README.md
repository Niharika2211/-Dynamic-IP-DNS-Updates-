# 🚀 Automating Dynamic IP DNS Updates and Mobaxterm Configuration

## 🔄 Step 1: Update DNS with New Instance IP
✍️ Write a script that automatically updates the DNS record with the new public IP of an instance.

- 📂 The script is located in the Git repository.
- 📜 The script file is `docker-machine.sh`.
- 🔍 Modify or review the script starting from **line 88**.

## 🌐 Step 2: Create a Hostname and A Record
1. 🏷️ Create a new hostname.
2. ➕ Add an A record with the following details:
   - 🏷️ **Record Name**: `<your-dns-name>`
   - 🌍 **Public IP**: `<instance-public-ip>`
   - ⏳ **TTL**: `30` or `60` seconds
3. ✅ Save and create the DNS entry.

## 🖥️ Step 3: Configure Mobaxterm Session
1. 🔧 Open **Mobaxterm**.
2. ➕ Create a **new session**.
3. ⚙️ Configure the following settings:
   - 🏷️ **Record Name**: Add the DNS name created in Step 2.
   - 👤 **User Name**: Specify the username for SSH access.
   - 🔐 **Advanced SSH Settings**:
     - 🗝️ Add the `.pem` key file path for authentication.
   - 📑 **Bookmark Settings**:
     - 🏷️ Add a **Session Name**.
     - 🎨 Optionally, assign a **Session Icon**.
4. 💾 Save the session.

✅ Now you can connect to the instance using the configured session in **Mobaxterm**! 🚀

