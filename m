Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9E9317174
	for <linux-sunxi@lists.linux.dev>; Sun, 10 May 2026 05:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778390763; cv=none; b=RNkTUW2f7XzuvxEtHRIZb/k4iS+sIZvnBqqV3WVz4V5sZcQAHJlXHRqeZMURdZMHURbj56nRYF7SvJL6uyesp5rP98Qt1HkGsSPa1b0JpGr4ql7YYi/F7lWEZbe/7iLAnMgrm/FmA9qSgBKMaQS+Oen6liV0RAJTVyjyVTGZvx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778390763; c=relaxed/simple;
	bh=JFu6cv4iACQGbV5egz2iEUE7xkHI96ahMgLFv5+XVWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MvIMQd7GJ+TEviqFEXgr6DrqoWB6iQku++78lt5wkTFcjQrSjZP4vLV92RUOTMK2AukXtkNczbc3cFPjyC+b9OWkI6aQT9zfLi+nQt1bo+jyM67+drtezpHfOIPO1wHdT1BNu2WK7m5ttzMeUt39Cu6vdhvr1CIrP4LSpskXOrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=acOKymbT; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="acOKymbT"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8cb5c9ba82bso486516585a.2
        for <linux-sunxi@lists.linux.dev>; Sat, 09 May 2026 22:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778390760; x=1778995560; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lkretJLhfB7+l1td9MLSNDIffxT6UR6I0FN9wkg9x/k=;
        b=acOKymbTvJOnw6mFJ8MWEpzr1RuYu44j5ueWkPYD9ubiRn1AkrG/WnWGvxQlwq3SB6
         +Hh0GcskTU5UbKf0G1xCAow6PkYfUYoxDCF7FS51H2Wh5l74lwqYjAt43YFQMfO/W62J
         wLUPShs/uqBYLdERUZ+qjONFz331C6FDwb42ckGnMiwTBcvVYEvR9Rc1olc1+iaj37I7
         WS/33ulTeVq6kSxCrkYlHTKQ2gFM0fNbMUd+uvUzw9ffG2fwz8tcEtACdt4sKoS41szU
         mTsI26eno1IZ6HnKHu5MhnCD98RZ8hSPaCCOBqhZRug3BuuK4m+n/t0KRHSs1efkPBdt
         ZnLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778390760; x=1778995560;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lkretJLhfB7+l1td9MLSNDIffxT6UR6I0FN9wkg9x/k=;
        b=Ez9uLnxKdIiQ2sHR6IiQuo/0t5Fcjz4K1sUuRkXiLpe+Ypgdg0rSoop2h2bkvviPVJ
         3Gp4A5PAGvTGhgH0nv2agm7d9yvPW/GbmiCdqPUi9E34NxOAZITBBgxaEMLGaM+4IJgG
         0lAYwMe4ipzzvwLdgyEUHSGqmRKLRXto/A6GDv7LPlyb2GxioJY+9f5wKWL97SGwwiP0
         FB/kcet09yXqfHn6/s6IutAi6R37kTCYNiu3WiOSvYPiSvXp3uOuRJfLXAZDy/oj3ev9
         TqzF4i0JC7Nclz/+/6pIJyOe3heOivx3dSozI3e/BHHqhAfoHPvJuBzk9bN6v9sKq9jj
         pHzw==
X-Forwarded-Encrypted: i=1; AFNElJ/Hy1qPHVX/TiStCqESYVTXMRVy5z+OHYlBexp92tWWthFRSNB6h6oUQSi4ihjU9CtS89qbIBOj1TYXIA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzsxNszDSBm99WbaOeh/t5WOE0dWXMuHE8TA9qDthdQ0VGDT3F0
	w07zNOJ5jaSvc59Zg+DGT46p5w5KfT2jXT2WXgn0380N5shH7KhSUpcx
X-Gm-Gg: Acq92OGtxnzrpns14jcr0w40UT5yZTEFQxzsHKS9ZsxWgMZChqjzAaxt6PDhtrP+KAP
	Q4rzbM+u7ahV2n21rPQAPImyBmOyIB/GWsupUmBXIU0WHLHD3BQNAc5uL7962ghedWe0LE1XNGD
	JmyhT1Sqv4e0sMb14Sx6ldXikpkMGOTeCBefMInD4iwZgV9KoLpKAZNs/IsotMdmYZLRO88xHKE
	s24OgqgHTohEl5mBnv0+FklYXygGtzN5isRCZd2gXMGh5zyt/N5hlRYc+FY9nYleD5VArLuOegU
	f18hpPShZUeADPo3txwznTYEfVwgsjRNkd8kPSSK1rDYIYi44RUR4FOj4Trrb298yMWKr2kLM2F
	z6+KFcYtBlEMFFnJj0oQ9JjlzyXMzbPWSa6OHAMlmj5JrZM9aVJjXA1E+0aRpyH8WZVQmZfnPRa
	szFF/bWWcY7Uopl267a60HbQFpxAg=
X-Received: by 2002:a05:620a:28d3:b0:8f0:b0cb:190f with SMTP id af79cd13be357-904d60f695amr2567465085a.39.1778390760497;
        Sat, 09 May 2026 22:26:00 -0700 (PDT)
Received: from [172.17.0.2] ([134.128.219.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b9286f22sm689689085a.13.2026.05.09.22.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 22:26:00 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Sun, 10 May 2026 05:25:35 +0000
Subject: [PATCH] pmdomain: sunxi: support power domain flags for pck600
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260510-pck600-a733-gpu-v1-1-d6393646d714@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MMQqAMAxA0auUzAZiRaVeRRw0Rg2ClhZFKN7d4
 viG/xNECSoROpMgyK1RzyOjLAzwNh6roM7ZYMk2VJeEnveGCMe2qnD1F848LUzcsjgHufJBFn3
 +Yz+87wdJjmRzYQAAAA==
X-Change-ID: 20260510-pck600-a733-gpu-dcbfc0c7ce99
To: Ulf Hansson <ulfh@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Icenowy Zheng <uwu@icenowy.me>, Mikhail Kalashnikov <iuncuim@gmail.com>, 
 Yuanshen Cao <alex.caoys@gmail.com>
X-Mailer: b4 0.14.3

Hi everyone,

This patch refactors the sunxi pck600 power domain implementation to
support individual power domain flags.

While bringing up the PowerVR GPU on the A733 (Radxa Cubie A7Z), we
found that one of the GPU power domains must be configured as "always
on." While the Radxa BSP device tree leaves the GPU power domain nodes
commented out, the GPU driver code contains traces indicating an "always
on" requirement [1].

Currently, sunxi_pck600_desc only supports specifying pd_names. This
patch introduces sunxi_pck600_pd_desc, which stores both the name and
its associated flags. This also (more or less) aligns the implementation
with the existing sun50i PPU handling of always-on domains.

With this change, individual power domains can now be configured more
granularly. In particular, the GPU_CORE domain in sun60i_a733_pck600_pds
can now be explicitly marked with GENPD_FLAG_ALWAYS_ON.

The patch was tested on the Radxa Cubie A7Z, where the GPU now functions
as expected.

Thanks to Icenowy for her support and expertise on sunxi and PowerVR,
and thanks to Mikhail for identifying this exact cause of the GPU
bring-up issue.

[1] https://github.com/radxa/allwinner-bsp/blob/cubie-aiot-v1.4.6/modules/gpu/img-bxm/linux/rogue_km/services/system/rogue/rgx_sunxi/sunxi_platform.c#L62

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
 drivers/pmdomain/sunxi/sun55i-pck600.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/pmdomain/sunxi/sun55i-pck600.c b/drivers/pmdomain/sunxi/sun55i-pck600.c
index 1d47bbd35ced..8a37d11b65a2 100644
--- a/drivers/pmdomain/sunxi/sun55i-pck600.c
+++ b/drivers/pmdomain/sunxi/sun55i-pck600.c
@@ -41,8 +41,13 @@
 
 #define PPU_REG_SIZE	0x1000
 
+struct sunxi_pck600_pd_desc {
+	const char *name;
+	unsigned int flags;
+};
+
 struct sunxi_pck600_desc {
-	const char * const *pd_names;
+	const struct sunxi_pck600_pd_desc *pd_descs;
 	unsigned int num_domains;
 	u32 logic_power_switch0_delay_offset;
 	u32 logic_power_switch1_delay_offset;
@@ -164,10 +169,12 @@ static int sunxi_pck600_probe(struct platform_device *pdev)
 
 	for (i = 0; i < desc->num_domains; i++) {
 		struct sunxi_pck600_pd *pd = &pck->pds[i];
+		const struct sunxi_pck600_pd_desc *pd_desc = &desc->pd_descs[i];
 
-		pd->genpd.name = desc->pd_names[i];
+		pd->genpd.name = pd_desc->name;
 		pd->genpd.power_off = sunxi_pck600_power_off;
 		pd->genpd.power_on = sunxi_pck600_power_on;
+		pd->genpd.flags = pd_desc->flags;
 		pd->base = base + PPU_REG_SIZE * i;
 
 		sunxi_pck600_pd_setup(pd, desc);
@@ -195,13 +202,14 @@ static int sunxi_pck600_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static const char * const sun55i_a523_pck600_pd_names[] = {
-	"VE", "GPU", "VI", "VO0", "VO1", "DE", "NAND", "PCIE"
+static const struct sunxi_pck600_pd_desc sun55i_a523_pck600_pds[] = {
+	{ "VE", }, { "GPU", }, { "VI", }, { "VO0", }, { "VO1", },
+	{ "DE", }, { "NAND", }, { "PCIE", },
 };
 
 static const struct sunxi_pck600_desc sun55i_a523_pck600_desc = {
-	.pd_names = sun55i_a523_pck600_pd_names,
-	.num_domains = ARRAY_SIZE(sun55i_a523_pck600_pd_names),
+	.pd_descs = sun55i_a523_pck600_pds,
+	.num_domains = ARRAY_SIZE(sun55i_a523_pck600_pds),
 	.logic_power_switch0_delay_offset = 0xc00,
 	.logic_power_switch1_delay_offset = 0xc04,
 	.off2on_delay_offset = 0xc10,
@@ -213,14 +221,15 @@ static const struct sunxi_pck600_desc sun55i_a523_pck600_desc = {
 	.has_rst_clk = true,
 };
 
-static const char * const sun60i_a733_pck600_pd_names[] = {
-	"VI", "DE_SYS", "VE_DEC", "VE_ENC", "NPU",
-	"GPU_TOP", "GPU_CORE", "PCIE", "USB2", "VO", "VO1"
+static const struct sunxi_pck600_pd_desc sun60i_a733_pck600_pds[] = {
+	{ "VI", }, { "DE_SYS", }, { "VE_DEC", }, { "VE_ENC", }, { "NPU", },
+	{ "GPU_TOP", }, { "GPU_CORE", GENPD_FLAG_ALWAYS_ON },
+	{ "PCIE", }, { "USB2", }, { "VO", }, { "VO1", },
 };
 
 static const struct sunxi_pck600_desc sun60i_a733_pck600_desc = {
-	.pd_names = sun60i_a733_pck600_pd_names,
-	.num_domains = ARRAY_SIZE(sun60i_a733_pck600_pd_names),
+	.pd_descs = sun60i_a733_pck600_pds,
+	.num_domains = ARRAY_SIZE(sun60i_a733_pck600_pds),
 	.logic_power_switch0_delay_offset = 0xc00,
 	.logic_power_switch1_delay_offset = 0xc04,
 	.off2on_delay_offset = 0xc10,

---
base-commit: 1bfaee9d3351b9b32a99766bbfb1f5baed60ddef
change-id: 20260510-pck600-a733-gpu-dcbfc0c7ce99

Best regards,
-- 
Yuanshen Cao <alex.caoys@gmail.com>

