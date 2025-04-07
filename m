Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27AEEB665
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Apr 2025 22:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744066169; cv=none; b=J8QRAuEdnq5texxcCNAXRMyP0N1i3YCBojCSfwFZz1dlRUWPEGl0fg4nVc5BA3r78IxITGgGDK4W3+ZF/wPPEdctVDmGlM3xAftMgV5e1sfen+o+AyFhpakzjhaDaq9YFNXPjKN4d2PswtFGceEm7xsgIKK3XDLBIaWjIWRGaM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744066169; c=relaxed/simple;
	bh=QBNZkq9u49qQMTh0zqg3WTKone2oRQBsNLOoMMEBBu4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uQi1Uq6Vmr1Sr+9kc3nN9OAmJpLUAUk5VBJht9jJ6OZ/oc+r8CRxq5Pvl3R4WQUPdlsdcj9oqDAh958ppAuu8qaTt3LahOg65MppjW2YQ9SbA/50iQUJIqDXEegPgQabliiKiZl2ApYly9Mb7S6qQR1y01RwsdmTnqMmBrEJAnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF0B3169E;
	Mon,  7 Apr 2025 15:49:26 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EAFAB3F694;
	Mon,  7 Apr 2025 15:49:24 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: u-boot@lists.denx.de,
	Hans de Goede <hdegoede@redhat.com>
Cc: Tom Rini <trini@konsulko.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] sunxi: Use existing serial number for MAC address generation
Date: Mon,  7 Apr 2025 23:48:36 +0100
Message-ID: <20250407224836.8825-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Allwinner boards we use the first few words of the SID efuse storage
to generate a serial number, and also MAC addresses for Ethernet and
WiFi interfaces.
On some SoCs (A64, at least), when they are using Secure Boot, the SID
device contains all zeroes when read from U-Boot, because we are running
in non-secure state. In this case the MAC address would either be random
or would have to be assigned manually.

Now Trusted-Firmware, which runs in (always) secure EL3, can read the
SID storage, and has the ability to generate the serial number using the
same algorithm as U-Boot. It will write this serial number into the DTB,
from where U-Boot can easily retrieve it.

Add a function that reads the "serial-number" property from the DTB, and
re-generates the SID fields it has been derived from. This will then be
used by the existing MAC address generation code to assign addresses to
Ethernet, WiFi, and Bluetooth devices. This code will trigger when an
MMIO read from the SID returns zeroes.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
Hi,

the corresponding TF-A patch is here:
https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/13229

Cheers,
Andre

 board/sunxi/board.c | 33 +++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/board/sunxi/board.c b/board/sunxi/board.c
index ac9cefc6eac..6225e7d4b10 100644
--- a/board/sunxi/board.c
+++ b/board/sunxi/board.c
@@ -726,13 +726,38 @@ static void parse_spl_header(const uint32_t spl_addr)
 	env_set_hex("fel_scriptaddr", spl->fel_script_address);
 }
 
-static bool get_unique_sid(unsigned int *sid)
+/*
+ * On a secure device the SID MMIO region reads all zeroes, when accessed
+ * from non-secure world, which U-Boot proper runs in.
+ * Hopefully TF-A has read the SID content and dumped a serial number,
+ * compatible with the U-Boot algorithm, into the DTB for us.
+ */
+static bool get_sid_from_serial_number(const void *fdt, unsigned int *sid)
+{
+	const struct fdt_property *prop;
+	unsigned char buffer[9] = { 0 };
+	int len;
+
+	prop = fdt_get_property(fdt, 0, "serial-number", &len);
+	if (!prop || len != 17)
+		return false;
+
+	sid[3] = hextoul(prop->data + 8, NULL);
+	memcpy(buffer, prop->data, 8);
+	sid[0] = hextoul(buffer, NULL);
+	sid[1] = 0;
+	sid[2] = 0;
+
+	return true;
+}
+
+static bool get_unique_sid(const void *fdt, unsigned int *sid)
 {
 	if (sunxi_get_sid(sid) != 0)
 		return false;
 
 	if (!sid[0])
-		return false;
+		return get_sid_from_serial_number(fdt, sid);
 
 	/*
 	 * The single words 1 - 3 of the SID have quite a few bits
@@ -770,7 +795,7 @@ static void setup_environment(const void *fdt)
 	char ethaddr[16];
 	int i;
 
-	if (!get_unique_sid(sid))
+	if (!get_unique_sid(fdt, sid))
 		return;
 
 	for (i = 0; i < 4; i++) {
@@ -867,7 +892,7 @@ static void bluetooth_dt_fixup(void *blob)
 		for (i = 0; i < ETH_ALEN; ++i)
 			bdaddr[i] = tmp[ETH_ALEN - i - 1];
 	} else {
-		if (!get_unique_sid(sid))
+		if (!get_unique_sid(blob, sid))
 			return;
 
 		bdaddr[0] = ((sid[3] >>  0) & 0xff) ^ 1;
-- 
2.46.3

