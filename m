Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49E9279DDD
	for <linux-sunxi@lists.linux.dev>; Mon, 15 Sep 2025 20:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757967751; cv=none; b=QcxusSd3oxORV5CWJr0/12/JdZLmeRxFeHmpqF5trTDJ0lmMrxBOYlNlpXHAQB5nQttaOMulFHQlDEsJaVEoj9GVY5ywAuDvWwsVMVaXi6cj0+H4Y9pv2HfInujEkw3RGm/429E/ES44DdQtdLdhklJO7aQOJfhN3QE3/x2kzSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757967751; c=relaxed/simple;
	bh=oVwi+mbQpYWSKVQlWd+b0tgEPpwt7oZxLcKopBsofVc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sR4aUokuX8lW0qJ+lSZJlVCpZCv5kjqq9GXov2M+GCpbnUgbGnj1gz3Tli9/ptB5FmqLhAWRyIZn3sJfCu1Hus+D4WDFQV7dqGQC5xPJ4dFMomhv346+/JFPGj8DaTCFn7Bu6ElEB25MUPpylD2Iht0j68l+axz7Pg6BS7A+D3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=n/hETOn+; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="n/hETOn+"
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding;
	bh=r6O786YnJzgKi/SldcaS2upZCuvArpBIs6KpvxR7CM8=;
	b=n/hETOn+SaXv2ahfzeUno6EltPlnvV+DAREerDICVwUV7SsGbV3N6EZe3UgM5sa8ctueAGEwy3w0DvmXyvUQVc7NM+Q4yEvcx+aUtvGpk9RQD3nYBQDg2ehcV+lsp3Nxe8DqCN/XCi0V72AwwV9LxB5MYaQeYHHjntGe29wxvzk=
Received: from lukas-hpz440workstation.lan.sk100508.local (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPA
	; Mon, 15 Sep 2025 21:22:03 +0200
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Tom Rini <trini@konsulko.com>
Cc: linux-sunxi@lists.linux.dev,
	Lukas Schmid <lukas.schmid@netcube.li>,
	John Watts <contact@jookia.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	u-boot@lists.denx.de
Subject: [PATCH v2] sunxi: extend R528/T113-s3/D1(s) DRAM initialisation
Date: Mon, 15 Sep 2025 21:20:35 +0200
Message-Id: <20250915192036.323741-1-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the DRAM initialisation code to add support for the T113-S4 aka
T113M4020DC0 by checking the SoC's CHIPID.

The list of Chip-IDs came from
https://github.com/ua1arn/hftrx/blob/25d8cb9e4cfe1d7d0e4a2f641025c88a9ec5e758/inc/clocks.h#L250

And the chipid register address was something I heard through apritzel
altough it seems that, according to Jookia, the Tina Device Tree seems
to agree:

sid@3006000 {
	compatible = "allwinner,sun20iw1p1-sid", "allwinner,sunxi-sid";
	reg = <0x0 0x03006000 0 0x1000>;
	#address-cells = <1>;
	#size-cells = <1>;

	chipid {
		reg = <0x0 0>;
		offset = <0x200>;
		size = <0x10>;
	};
	...
};

Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
Tested-by: John Watts <contact@jookia.org>
Reviewed-by: John Watts <contact@jookia.org>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Changes in v2:
  - Use uint32_t instead of u32 for sid_read_soc_chipid return type
  - Add descriptive comment about source of Chip-ID list and register

 drivers/ram/sunxi/dram_sun20i_d1.c | 13 ++++++++++++-
 drivers/ram/sunxi/dram_sun20i_d1.h |  7 +++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/ram/sunxi/dram_sun20i_d1.c b/drivers/ram/sunxi/dram_sun20i_d1.c
index a1794032f3b..381eeb87e2e 100644
--- a/drivers/ram/sunxi/dram_sun20i_d1.c
+++ b/drivers/ram/sunxi/dram_sun20i_d1.c
@@ -54,6 +54,11 @@ static void sid_read_ldoB_cal(const dram_para_t *para)
 	clrsetbits_le32(0x3000150, 0xff00, reg << 8);
 }
 
+static uint32_t sid_read_soc_chipid(void)
+{
+	return readl(SUNXI_SID_BASE + 0x00) & 0xffff;
+}
+
 static void dram_voltage_set(const dram_para_t *para)
 {
 	int vol;
@@ -663,6 +668,7 @@ static void mctl_phy_ac_remapping(const dram_para_t *para,
 
 	fuse = (readl(SUNXI_SID_BASE + 0x28) & 0xf00) >> 8;
 	debug("DDR efuse: 0x%x\n", fuse);
+	debug("SoC Chip ID: 0x%08x\n", sid_read_soc_chipid());
 
 	if (para->dram_type == SUNXI_DRAM_TYPE_DDR2) {
 		if (fuse == 15)
@@ -675,7 +681,12 @@ static void mctl_phy_ac_remapping(const dram_para_t *para,
 			switch (fuse) {
 			case 8: cfg = ac_remapping_tables[2]; break;
 			case 9: cfg = ac_remapping_tables[3]; break;
-			case 10: cfg = ac_remapping_tables[5]; break;
+			case 10:
+				if (sid_read_soc_chipid() == SUNXI_CHIPID_T113M4020DC0)
+					cfg = ac_remapping_tables[0];
+				else
+					cfg = ac_remapping_tables[5];
+				break;
 			case 11: cfg = ac_remapping_tables[4]; break;
 			default:
 			case 12: cfg = ac_remapping_tables[1]; break;
diff --git a/drivers/ram/sunxi/dram_sun20i_d1.h b/drivers/ram/sunxi/dram_sun20i_d1.h
index 91383f6cf10..7bd8f67a77a 100644
--- a/drivers/ram/sunxi/dram_sun20i_d1.h
+++ b/drivers/ram/sunxi/dram_sun20i_d1.h
@@ -19,6 +19,13 @@ enum sunxi_dram_type {
 	SUNXI_DRAM_TYPE_LPDDR3 = 7,
 };
 
+enum sunxi_soc_chipid {
+	SUNXI_CHIPID_F133A = 0x5C00,
+	SUNXI_CHIPID_D1S = 0x5E00,
+	SUNXI_CHIPID_T113S3 = 0x6000,
+	SUNXI_CHIPID_T113M4020DC0 = 0x7200,
+};
+
 /*
  * This structure contains a mixture of fixed configuration settings,
  * variables that are used at runtime to communicate settings between
-- 
2.39.5


