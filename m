Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794449995;
	b=raeIZX3BI6fQN2ucXH1lFpnGnaT1yvXK9fcc6S6lSTC7FzYvWdbaIcpOTXLoF5pGC+Dh
	 73zYLjtpKjVfBd6tRHXw/Xmag8EDRjcvkhxjJ7f1rvLFXxY2OFYE5heNUuVNqABVS8kBj
	 R44+oUg98e4nFWu+jDv3/a0TzbecgnqoCbNsFwiGCdDezJZrismbvbSTLWx0yetPTR1k2
	 t+DzQKYTm5DWcfFQ6UnSioqSweuyiBT7GDiLjhUQ9Wit3Kwyp+BZ83MiFaFOrnX4yX/Uh
	 vuVOt6v4vEV2JcusQOCyOT6o2cmgNxTctUZfaY8Si+UOJegcC4G+Mvid7Bjw7kfO0Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794449995;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=BhERCUB5Z9hn5dC7czbGCa9749yvWElRD1ogv09yAVU=;
	b=RzROqFL/N8KkaXD+HlV/m2wTPyuSzDBLiegp3Q1EQQ4JZQsaXdW23qfkzMWhEaAiUOUJ
	 G8v6v4RQ5Tr1B5zF9PtoNm3NrUsmI09DRmhaBetjzvGNfjtydV5f5aaoQsOalsS04z023
	 mFxefQgluOoKGRjg8ITVz6eDDYrXgxGDjcQ27pZjxwn30ieMDeAkBOcbRrhFmyGONH0gr
	 L8azSrQQ0dKy9LiL/Xe2C7L2LvJnoeT868CTGTNa744BERUjHLQM3nxfgxNISvII7ubxM
	 YgL0mnqM2FIMSb9xfRMdsHvD7pEGyZzmpztXPo1d7sc9k/lWcVN0ccB498u3oDjqOlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=edm.sh;
	spf=pass smtp.mailfrom=edm.sh;
	dkim=pass header.d=edm.sh header.i=@edm.sh header.a=rsa-sha256 header.s=protonmail header.b=KJ7aoWjd;
	arc=none smtp.remote-ip=185.70.43.170
Received: from mail-43170.protonmail.ch (mail-43170.protonmail.ch [185.70.43.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D274D606A32D
	for <linux-sunxi@lists.linux.dev>; Thu, 12 Nov 2026 02:19:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D274D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=edm.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=edm.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=edm.sh header.i=@edm.sh header.a=rsa-sha256 header.s=protonmail header.b=KJ7aoWjd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=edm.sh;
	s=protonmail; t=1794449992; x=1794709192;
	bh=BhERCUB5Z9hn5dC7czbGCa9749yvWElRD1ogv09yAVU=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=KJ7aoWjdn7ruCdcEFpQn/zNsKSG2tqFK5EcfTZH0za04kcEO0TbZQ0Dq5Tg3F3Of1
	 Unr1mSn7wlyAQjX8SfuUGLGkiUPOQGyl4c5mxgcqzaFC0raE9cF6fFqC3ev2qan9Gk
	 zVICFYp4H9lOUOPVIn7acQMtEM768koBl0Y0ukRMc+AhQHBMNZhO+Wenh1jWAG8MfZ
	 Iq/g5JU0PJuv9gxh3wkuah7cIxbezp4bCqXl7VFSRhMWpgkUfFZJg6sJFJCGwHY3iL
	 l17bevsBZDOaYitQeJpo/tXv6/L3h/+hQ9u6mJuXnuyOlZGjb1MHg3+J+dPtnKWTB5
	 ANJqn/9ku+uQA==
X-Pm-Submission-Id: 4jQ3xc6wrBz2Scml
From: Eduardo Moreno Adanez <me@edm.sh>
To: Andre Przywara <andre.przywara@arm.com>,
	u-boot@lists.u-boot-project.org
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Cody Eksal <masterr3c0rd@epochal.quest>,
	Paul Kocialkowski <contact@paulk.fr>,
	Tom Rini <trini@konsulko.com>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] sunxi: a133: dram: fix DDR4 MR0 to match the controller timings
Date: Wed, 11 Nov 2026 18:19:45 -0800
Message-ID: <20261112021945.71942-1-me@edm.sh>
X-Mailer: git-send-email 2.55.0
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

MR0 is set to 0x840 (CL 18, WR 18), but the DRAMTMG values in
a133_ddr4.c are for CL 13, CWL 10, WR 14:

  DRAMTMG0.wr2pre        = 14 = (10 + 4 + 14) / 2
  DRAMTMG2.read_latency  =  7 = 13 / 2, rounded up
  DRAMTMG2.write_latency =  5 = 10 / 2

Use 0x520 (CL 13, WR 14, DLL reset), as boot0 does with the same
timings.

Write-then-read tests pass with the wrong value, but copies corrupt
about 300 64-bit words per MiB, so U-Boot hangs in memcpy() and TF-A
takes undefined instruction exceptions.

Tested on an Aqara Panel Hub S1 Plus (A133, 2 GiB DDR4 at 792 MHz):
without this patch U-Boot hangs before fastboot; with it, 16 MiB
copied 12 times with cp.q all match.

Fixes: 7a337270c076 ("sunxi: A133: add DRAM init code")
Signed-off-by: Eduardo Moreno Adanez <me@edm.sh>
---
boot0 also differs in MSTR geardown, INIT7 (MR6), DRAMTMG6, ADDRMAP1/8
and SCHED. Changing those without this patch still hangs, and with it
they make no difference here, so they are left out.

 arch/arm/mach-sunxi/dram_sun50i_a133.c       | 2 +-
 arch/arm/mach-sunxi/dram_timings/a133_ddr4.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-sunxi/dram_sun50i_a133.c b/arch/arm/mach-sunxi/dram_sun50i_a133.c
index ca3e2513c69..b5ff6707571 100644
--- a/arch/arm/mach-sunxi/dram_sun50i_a133.c
+++ b/arch/arm/mach-sunxi/dram_sun50i_a133.c
@@ -754,7 +754,7 @@ static void mctl_dfi_init(const struct dram_para *para)
 		mctl_mr_write(MRCTRL0_MR_ADDR(3), 0);		/* MR3 */
 		break;
 	case SUNXI_DRAM_TYPE_DDR4:
-		mctl_mr_write(MRCTRL0_MR_ADDR(0), 0x840);
+		mctl_mr_write(MRCTRL0_MR_ADDR(0), 0x520);	/* CL 13, WR 14 */
 		mctl_mr_write(MRCTRL0_MR_ADDR(1), 0x601);
 		mctl_mr_write(MRCTRL0_MR_ADDR(2), 0x8);
 		mctl_mr_write(MRCTRL0_MR_ADDR(3), 0);
diff --git a/arch/arm/mach-sunxi/dram_timings/a133_ddr4.c b/arch/arm/mach-sunxi/dram_timings/a133_ddr4.c
index dec208e22df..359b11aa42d 100644
--- a/arch/arm/mach-sunxi/dram_timings/a133_ddr4.c
+++ b/arch/arm/mach-sunxi/dram_timings/a133_ddr4.c
@@ -67,7 +67,7 @@ void mctl_set_timing_params(const struct dram_para *para)
 	clrsetbits_le32(&mctl_ctl->init[2], 0xff0f, 0xd05);
 	writel(0, &mctl_ctl->dfimisc);
 
-	writel(0x840 << 16 | 0x601, &mctl_ctl->init[3]);	/* MR0 / MR1 */
+	writel(0x520 << 16 | 0x601, &mctl_ctl->init[3]);	/* MR0 / MR1 */
 	writel(0x8 << 16 | 0x0, &mctl_ctl->init[4]);		/* MR2 / MR3 */
 	writel(0x0 << 16 | 0x400, &mctl_ctl->init[6]);		/* MR4 / MR5 */
 	writel(0x826, &mctl_ctl->init[7]);			/* MR6 */

base-commit: 8c1ea2aa66386fa3c8ea829531f581847814a569
-- 
2.55.0

