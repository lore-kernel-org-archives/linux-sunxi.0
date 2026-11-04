Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793825803;
	b=ouOVnO/VStlKpXG2MPIgaiDNzkta8C0FHC3rTt9iBorgHhSP1HQu2clYrYmGNy9V7/e3
	 ai97+SUi1dG5UQGuPeaXukNor91CURilHRrSp8nKCGet8hSjR9HKlZ4As+OGtaMxWzGb+
	 38OXV1FCNBmgstSMOeBD6L3Bg/iECo0HCDMk272mTbXmXqT4PPLmjYexm3XZjyYTxz9lL
	 0/4haPl2MV7kcC5Ch8JBxE3pAcKPNF4sDNgLXsseCO7qDscdCjOPMB3vci/kV2u+vJUwS
	 iDpRIlT4+GeZbC2L4CVyaqFaGegCyiZCmOmx0rPOqqSdGfGIiyWcnM9rYvyxiyH9WdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793825803;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vyp9Xg+NZWPDImO3yojecGwxOV8bju04kpo6ObDJXdY=;
	b=QDZCc6wP3A8gVhEcVHwN7/+ASNZ5/rlOgwH2743SHP4idoCM+boRXoVWaWVW+B4e313e
	 WblJKmBOjPO4FrUt8IdJ+t1urH7hXXFnFS6djCoZFps2A37yMPpcgNYEwPfditAIK7WrQ
	 efWT31iu+zOp5KTaqdW2zgPM+1pS4d6RbirWodbTr5HKXPz60H5e5lHzL3VzaanA2uirI
	 jZc/FX3gip3xp0kfeJ0+R9WxTSb8ade7wm2V+aDFSIafm3T7pp5rhuzTtzvNDhLbryOWT
	 R2q8cFCSwukdIbUOrf2Ubnvw2iEypE1p7NpjVeMVb+1zE0XKyRlMFvxCKX2P1XykA6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kkEqNvXR;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BA0609C071
	for <linux-sunxi@lists.linux.dev>; Wed,  4 Nov 2026 20:56:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0BA0609C071
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kkEqNvXR
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-70b875f6f1fso1076593eaf.2
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Nov 2026 12:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793825802; x=1794430602; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vyp9Xg+NZWPDImO3yojecGwxOV8bju04kpo6ObDJXdY=;
        b=kkEqNvXRJcONyFtSPysGsXpX1EzG6Ew95uYM+pINhLxUFWQK75ihEXpOQ4NtGCoMUm
         ObpUy4BWwtllMJYO4lrpJkjCZKP5hq0HO9b4oeY4ZCZGhCuoJwrW/77zWwQbaZXX8ZI+
         sI1UY0yovHqYl6u9LHEsCp9CyhwtkRrmocRjes53zZ12uWj2oCaElQFyHrp1Y7E1yPTV
         q/GvjFru26PE13fjJMwhfl19zh/J8gfw0iZD6WOIo9d1GF/qA407lWDnfum3z5cVydBw
         b2z5Z3/F6GigBgF2WQcl56Gl35R07FQXCk43LADUR/On1fq7X+Pnu0B4VMaSS4tQ7u5U
         IlgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793825802; x=1794430602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vyp9Xg+NZWPDImO3yojecGwxOV8bju04kpo6ObDJXdY=;
        b=fhhyZ86AYGp2/t5oAQM9FYeIhO817lfxgCg803XzFNOMisBU/9w3U9FrQG/No7CBF9
         WqncvNQGzQqEuYUywwFB5rNQKrvfPOkQPWm5DEjj//p7baE7JvWgSw1p5gKLbnEpX41k
         kXpBTg9Zurh3bb9OPSt2KlktHpyYXNTsOfBmM7O0ZsVot9fHfFOAFxoH1lbmHda3yX4C
         606RZ6qRtVga8/OC0z5gcjPu62lDyd9fZOOFRrN2+YHs7lPwr9JRtUg+hq45uSjX4BU5
         94qLXpBlZC2jLdXG4mTchyBOtdxRy2ldmJlDNMnulmKj5Lz4AmgNwac4DJOKCIBkKMuX
         ziKw==
X-Forwarded-Encrypted: i=1; AKwUvBwdb3BMsk+QQtpcWogNQm/pEFIv/yQCoLfYSmZdKhcSzqAB8nutOuBdQK0kTanAXA+sadd7P3xDpHt7UA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9zkcZZJPt+jcAlghWRZz/eznalhbITup0uXr+sybb5ODBruplD
	zZvNLdn2Zek2RsYgLJiSIAqCrhgTFOv4uWSgMpRUq5V0LwYfvXzNODdV
X-Gm-Gg: AYBFou3VUsv/ZAe4yc18NtNDPVc+7Ocdn9H1qgH1befqbF0+FHNP3FMSIkuOYjfiz3I
	ImIEHZ5VlcWTSl5XWGW/Y6LbJYggsuWGwqAn8czcBj2TSq2yCwZOMaM44Tql3HRMctaR//iMRfQ
	McK/qgqp8OHHa5J3Rjv6lKGMmkO/OA7/hRt7yxO1dMG8tDIoi88Sl9ZnJUFZ5kjWKkxAwI+5XXY
	Ub0Rb6BVZnLExsB1PHxh7o2zJvhQ/oN/hgytBi3b883nCpiUa/Qf/G3kylZ3GBKQpKiVYZ4Yoly
	lOeVf438EFWmpC2JCZt6yBL6HqdNTJOFqSLsnP7/ptzRf79NQSID/W04jG9v9NHGUSTJlIHb+uO
	5b8UHTWhbmstBeXPqo7XEt9IzCzIxV4+UWVs/b3OXB4mYWpT0+PT+hzSHVmuiLgv24lgQ+sq27s
	qqMU3W4oLhzT4+n3DESCpCSI1yrNfB98U73MPD023WfipnzKveo6MLuxTp62buIOnaG6EbHljPz
	RN6cfWMRZpcVZbDCvKjlsU7tOJ0NbTU5ibCyp63PWH7z4Ecp8ff7/PGuAOAIX212PxBvqfUYKiB
	GeQGzwnyuBprGWXFE22bKbffRpQFVNeIzgc64b+T3l33Q++eDF2tSvJoqIzHGbq394NNCzZU3N+
	FAFE=
X-Received: by 2002:a05:6820:4082:b0:70a:c89b:d12d with SMTP id 006d021491bc7-714f24f9d20mr8969903eaf.11.1793825801586;
        Wed, 04 Nov 2026 12:56:41 -0800 (PST)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716c12529a1sm2620150eaf.5.2026.11.04.12.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 12:56:40 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: linusw@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: Andre Przywara <andre.przywara@arm.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] pinctrl: sunxi: preserve A733 firmware voltage modes
Date: Wed,  4 Nov 2026 15:56:39 -0500
Message-ID: <20261104-a733-pinctrl-v2@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The A733 GPIO_POW_MOD_SEL voltage-mode fields are two bits wide on
both controllers (A733 User Manual v1.00, sections 18.14.6.1 and
18.14.7.20). On the main controller, the one-bit
BIAS_VOLTAGE_PIO_POW_MODE_SEL handler writes bit N for bank N, which
is reserved or half of another bank's field.

Starting from the vendor firmware value 0x01155550, a request for PF
with a 1.8 V supply sets bit 5, changing PC from auto (01) to 1.8 V
(11). A request for PK with a 3.3 V supply clears bit 10, changing PF
from auto to 3.3 V. PB is supplied from VCC-IO (A733 Datasheet v1.01,
table 4-5), whose field is at bits 25:24, but a PB request writes
reserved bit 1 instead.

A733 R-PIO has SEL at 0x340 and VAL at 0x348 and nothing at 0x344
(section 18.14.5.2), where the BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV
handler it shares with A523-R writes the A523 control register. That
handler also writes bit N of SEL inverted: for PL with a 3.3 V supply
it sets bit 0, changing PL from 3.3 V (10) to 1.8 V (11).

v7.4-rc1 added A733 support with these handlers, so the writes happen
on the first request of a pin in a bank with a vcc-pX-supply in the
devicetree.

Select BIAS_VOLTAGE_NONE for both A733 controllers and give A733-R its
own descriptor, keeping the A523-R descriptor and behaviour. This
leaves the firmware voltage modes in place, including any that do not
match their supplies. It does not implement voltage switching.

Fixes: 0535bfbfa97b ("pinctrl: sunxi: add support for the Allwinner A733")
Fixes: 31d68e10381c ("pinctrl: sunxi: a523-r: add a733-r compatible string")
Link: https://lore.kernel.org/all/20261014183516.172060-1-vinicius.eduardo.pedrosa@gmail.com/
Suggested-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Tested-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com> # Cubie A7Z
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
Changes in v2:
- Rebased on v7.4-rc1, which added the A733 pinctrl driver. Only the
  context of the A733 hunk changed.
- Dropped the old base and its prerequisite-patch-id lines.
- Dropped the AI assistance and Assisted-by lines.
- Added Vinicius' Tested-by, from a Cubie A7Z on Linux 7.3-rc6 with his
  local A733 patches, applied with a context adjustment: warm boots
  only, no cold boot, 1.8 V switching or A523.
- Added Fixes tags, manual references and examples of the bits the old
  handlers write.

Andre's RFT [1] fixes the same bug with a two-bit handler and changes
the same A733 line, so only one of the two can be applied. This patch
uses BIAS_VOLTAGE_NONE, as Vinicius recommended in that thread, rather
than an AUTO variant: manual section 18.14.4.6 gives auto as 01, but
as 10 for PC/PE/PK, which the 18.14.6.1 table lists as 3.3 V, and
there is no evidence that 01 is right on every silicon revision. The
cost is that firmware modes that do not match a bank's supply stay as
they are. Andre, if you prefer the AUTO variant, I can rework it.

[1] https://lore.kernel.org/r/20261013142351.771229-1-andre.przywara@arm.com

Tested on v7.4-rc1 on a Cubie A7S with vendor boot firmware (one RAM
boot from cold, then a warm reboot), with A733 CCU v6, AXP318W PMIC v8,
the sunxi IRQ-bank v3 series, the 8250_dw changes, my A733
firmware-clock patch and A7S DT v2 on top. The main and R-PIO
GPIO_POW_MOD_SEL registers (0x02000040, 0x07025340) read 0x01155550
and 0x000aaaaa in both U-Boot and Linux, and the PF selector
(0x02000070) read 1. The PMIC regulators registered over R-I2C0 and
MMC0 reads worked. The readback was taken before the unused-regulator
cleanup.

The main-controller value distinguishes the handlers: MMC0 requests
PF, and this DT gives PF a 1.8 V supply, so the old handler would have
set bit 5 (0x01155570). An unpatched kernel was not booted. The R-PIO
value does not: PL has no vcc-pl-supply in this DT, because PL carries
the PMIC bus, so the R-I2C0 request returns before writing, and the
old handler's write for PM (3.3 V) would set bit 1, which is already
set. Vinicius' test covers R-PIO: he added 3.3 V vcc-pl and vcc-pm
supplies, and also read the registers after the unused-regulator
cleanup.

Also built arm64 defconfig with W=1 (GCC) and the changed objects with
Clang. Not tested: 1.8 V switching, A523.

v1: https://lore.kernel.org/r/20261031020640-263f7b05-a7s-pinctrl@gmail.com

 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c | 20 +++++++++++++++----
 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c   |  3 ++-
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
index cffc1e53eef1..1cfd81184350 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
@@ -30,17 +30,29 @@ static struct sunxi_pinctrl_desc a523_r_pinctrl_data = {
 	.pin_base = PL_BASE,
 };
 
+static struct sunxi_pinctrl_desc a733_r_pinctrl_data = {
+	.irq_banks = ARRAY_SIZE(a523_r_irq_bank_map),
+	.irq_bank_map = a523_r_irq_bank_map,
+	/* A733 has two-bit voltage modes, without the A523 control register. */
+	.io_bias_cfg_variant = BIAS_VOLTAGE_NONE,
+	.pin_base = PL_BASE,
+};
+
 static int a523_r_pinctrl_probe(struct platform_device *pdev)
 {
+	struct sunxi_pinctrl_desc *desc;
+
+	desc = (struct sunxi_pinctrl_desc *)of_device_get_match_data(&pdev->dev);
 	return sunxi_pinctrl_dt_table_init(pdev, a523_r_nr_bank_pins,
-					   a523_r_irq_bank_muxes,
-					   &a523_r_pinctrl_data,
+					   a523_r_irq_bank_muxes, desc,
 					   SUNXI_PINCTRL_NCAT2_REG_LAYOUT);
 }
 
 static const struct of_device_id a523_r_pinctrl_match[] = {
-	{ .compatible = "allwinner,sun55i-a523-r-pinctrl", },
-	{ .compatible = "allwinner,sun60i-a733-r-pinctrl", },
+	{ .compatible = "allwinner,sun55i-a523-r-pinctrl",
+	  .data = &a523_r_pinctrl_data },
+	{ .compatible = "allwinner,sun60i-a733-r-pinctrl",
+	  .data = &a733_r_pinctrl_data },
 	{}
 };
 
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
index ca82f08a3a65..d4b0a40525f9 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
@@ -24,7 +24,8 @@ static const u8 a733_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
 static struct sunxi_pinctrl_desc a733_pinctrl_data = {
 	.irq_banks = 10,
 	.irq_read_needs_mux = true,
-	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
+	/* Preserve the firmware-configured two-bit voltage modes. */
+	.io_bias_cfg_variant = BIAS_VOLTAGE_NONE,
 };
 
 static int a733_pinctrl_probe(struct platform_device *pdev)

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.53.0

