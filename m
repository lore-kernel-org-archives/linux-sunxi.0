Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7FA472F60
	for <linux-sunxi@lists.linux.dev>; Wed,  9 Sep 2026 08:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942673; cv=none; b=q08W93wY9a1oPCSIIS1WugeyR2DTKauDQ/53R7d//vhjzIKPYxOfbr112s4LBkPRZDJ7cplph/GUoeVqRH9DzOUwLxYmIni7GFED/4VCcpskD3q714zoSk7ly676JJOVPrpSF7GI5WrnbrNPObjVOUM9bj4KHXp1oIGjPyEN+OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942673; c=relaxed/simple;
	bh=RUHviMp2AdO1fknBD6KbHrx/oNzHzFuAjPBWy7z+Mks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LOIkbNL9wyn73okkScj+pRkasWqb27syG/e9s/rcf1uaWorNLyR0ZKRzfbu8/TawaCJP8i1rIsCVtfjeJVCLQK46l+/RTP+uHfspTPQAO1/1LzFYgTgMDW9xjkUXR5ElnTVKj9vi3YnLR4llzM5yYdBVPB42l4uySnShYL0vvmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C1rcHwm8; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C1rcHwm8"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7f4cc6797b7so3006853a34.0
        for <linux-sunxi@lists.linux.dev>; Wed, 09 Sep 2026 01:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942669; x=1789547469; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ykqLTK8+NebOH/B0kSjt8n6Khfc9TP9alLqheTq5PmQ=;
        b=C1rcHwm8YYoD3v1lrbCwlRAnITXzgydrqd2Gyw7NahlA8rgmGXFuDnvO7rsWEjkESy
         w1Vb4mxAgwoLH4FyHSA1Tg74FOL1uCmxU71GGIsyDIiPiISzZedpPlL86hYQvz7zISn4
         noXUL3kdy6B7UOocWYDYJgGIvjVcXbbnxkLl/oOZFRpbgPjwnHY1X4IQtGpKRJL/lwQV
         lnSwzwO8XQYXMMn0XTpjPOVw4hfJFS8K3MalYf8E4oTSDQd8lgFsEoNnMllSFMItKfBq
         VdQXFcueC1dpXvn84dpP7oXcTFiWvLPNkuh5Zy7q1KtGMbUi9l3axxHKChUxVS/Twt+7
         UP6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942669; x=1789547469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ykqLTK8+NebOH/B0kSjt8n6Khfc9TP9alLqheTq5PmQ=;
        b=i8GU1X7gopsImOJ/WP5Ti2hPaUVHVs/zcrh8U9gDNSenW0rj7T0f4VoNAtwRrX0SSZ
         uzEjGb1dVCRhtbNl/ySrz7yK3dYr2ic4AHBAwKSCrQfNVxPRDOuAluVhMslkJUPBd+EV
         2k+mnYux3fSljqdcf+IbDuhjqt8yf5wLfCgoG9uc03jB3zU6U8UcekquYhD2WIJ1Mecm
         zuJJj27SMCQt+9BJkjq4yEWYWRYLyvN3A3pS8ZfYA22TkOrXEkuDI3mL9+IV/TXkrebT
         p5puCxxDdgvVYi1bGhowvcT0xsI0quIO0e9LZqLyq/IYDjL3WlbEV3LWWqH2UJlydymY
         NA+Q==
X-Forwarded-Encrypted: i=1; AKwUvByS6qc5XJzPcMrY9m16bGiCIRgTkgiQGQ97NHjdTx6XIBwBkJ5oV6gxi/ze6w20cuMAjE0KvPHO8TJMkA==@lists.linux.dev
X-Gm-Message-State: AFuF++kAcXpPi9mwqTFS8gsICLYlp7WZK/ZEVzx3s60QjXkbYLbklc6z
	vrlx+ey1wxs9mqqdR6l0/jn52p6GZ36FxPOSeDk01oD9L5laYFNzAfwk
X-Gm-Gg: AYBFou0GXwMxebMFeaFcv6fMXda3RlFOxT5ws1neaJkZq2Iato1VA1n/knpYwaMGhpb
	Yo2YxUo34pvhUa/eCkecaIF0l68FWR8520YKWogSsSIZFZQ7aGnk/nOHRVpmc8Y+91qXmbU+QSw
	pnCvHW8xWnY5/7QMI4Pr6jOiwBox/cLjHMdp5FIBM5fXAvnkzpmdM12Sc2zgdZk1fdHtepgF7CJ
	fgDrasQu+0UPI7zQYeJBGbLb0NAeUNOk4IcvsUyvqaKBHIjgUyn24wzVkHpfL3hhbIWn5P0GV8V
	UmX18c++SFuSNIIhTpBZTJPA2eppDCgu07OEd/YgoGn6eFbUJFWifgrZ2LLrXaD9PqWZgGD3eCf
	yE3lTrwnZjWuGYrZr9bCuv5mUNjoU7d483HAbrBl9X7dSwCRm//qGwssY5h6kFMPsHZnIXQQeeI
	V/iIZBbqUs/nRd0WmqnnwaICtWSJeLarzfafpAS0oPJYxyqQkQ0wKqnD27RUk3nKu1hXNG/nFYw
	aFcEjqjni0CQRQ12t5tfDvcalWMN0b/n/t4PolKfsdPwK/Uxh+BI8V976vjKP8/Kp8XlDVbJyDA
	pXQzjHb0egQLxbbP/gBYGYjNZbS1kSc0isPhixGJ9I8ly+xtfET/3Q06zCdl5mszDkTO2/BgsZg
	3IAlkY2N0rdRNuUvM8NF1FlDdAU4W
X-Received: by 2002:a4a:e909:0:b0:6b6:87cf:d1dc with SMTP id 006d021491bc7-6b6fcfd90e3mr19776294eaf.24.1788942668737;
        Wed, 09 Sep 2026 01:31:08 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6a0sm19031004eaf.5.2026.09.09.01.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:31:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 09 Sep 2026 02:30:44 -0600
Subject: [PATCH v3 11/15] mtd: rawnand: sunxi: select the packed H6/H616
 OOB layout
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-11-838cb0ba1547@gmail.com>
References: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
In-Reply-To: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The H6/H616 controller can configure a separate protected user-data
length for every ECC step. Mainline fills all space left after ECC with
user data. This changes the physical ECC offsets from those used by
Allwinner NAND firmware, so pages written by one layout cannot be
decoded with the other.

The allwinner,randomized-oob property selects the firmware's normal-page
format for the configured controller hardware-ECC geometry. Use four
protected user-data bytes per 1 KiB ECC step, cap the total at 16 bytes,
and assign the entire total to ECC step zero. Reserve the same total before
maximizing ECC strength so the selected strength leaves enough room.

Keep the existing maximized mainline user-data layout when the property
is absent. Older controllers have fixed four-byte user-data registers
whose placement already matches the firmware and need no additional
change.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 75515ad276e7..6e54d3a92219 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -224,6 +224,9 @@
 #define USER_DATA_SZ 4
 #define SUNXI_NFC_MAX_USER_DATA_SZ 32
 
+/* The randomized H6/H616 layout packs at most 16 bytes before ECC step 0. */
+#define SUNXI_NFC_H6_MAX_USER_DATA_SZ 16
+
 /**
  * struct sunxi_nand_chip_sel - stores information related to NAND Chip Select
  *
@@ -2348,8 +2351,14 @@ static void sunxi_nand_detach_chip(struct nand_chip *nand)
 	sunxi_nand->user_data_bytes = NULL;
 }
 
-static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize,
-					int ecc_bytes, int nsectors)
+static unsigned int sunxi_nfc_h6_user_data_sz(int nsectors)
+{
+	return min(nsectors * USER_DATA_SZ,
+		   SUNXI_NFC_H6_MAX_USER_DATA_SZ);
+}
+
+static int sunxi_nfc_init_user_data(struct nand_chip *nand, uint32_t oobsize,
+				    int ecc_bytes, int nsectors)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
@@ -2365,6 +2374,12 @@ static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize
 	if (!sunxi_nand->user_data_bytes)
 		return -ENOMEM;
 
+	if (sunxi_nand->randomized_oob) {
+		sunxi_nand->user_data_bytes[0] =
+			sunxi_nfc_h6_user_data_sz(nsectors);
+		return 0;
+	}
+
 	for (step = 0; (step < nsectors) && (remaining_bytes > 0); step++) {
 		for (i = 0; i < c->nuser_data_tab; i++) {
 			if (c->user_data_len_tab[i] > remaining_bytes)
@@ -2425,6 +2440,10 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 				bytes -= 2;
 
 			bytes -= total_user_data_sz;
+		} else if (sunxi_nand->randomized_oob) {
+			total_user_data_sz =
+				sunxi_nfc_h6_user_data_sz(nsectors);
+			bytes -= total_user_data_sz;
 		} else {
 			/*
 			 * User-data lengths are encoded in four-byte units. Reserve
@@ -2495,12 +2514,12 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	nsectors = mtd->writesize / ecc->size;
 
 	/*
-	 * The rationale for variable data length is to prioritize maximum ECC
-	 * strength, and then use the remaining space for user data.
+	 * The default variable-length layout prioritizes maximum ECC strength,
+	 * then uses the remaining space for user data.
 	 */
 	if (nfc->caps->reg_user_data_len) {
-		ret = sunxi_nfc_maximize_user_data(nand, mtd->oobsize,
-						   ecc->bytes, nsectors);
+		ret = sunxi_nfc_init_user_data(nand, mtd->oobsize,
+					       ecc->bytes, nsectors);
 		if (ret)
 			return ret;
 	}

-- 
2.53.0

