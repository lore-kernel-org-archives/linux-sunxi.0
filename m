Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B1349362C
	for <linux-sunxi@lists.linux.dev>; Wed, 26 Aug 2026 01:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787707828; cv=none; b=cnctFtnw41XVEveaYhyoTXJ6feGo5h6erTp+naJ7jtW+YN3u44K5YRtfBcafFXLo14/gxM2DzlxCFA1JxldRIkQIMaCR1yaMniwdxFq6uI5Sx8KneqVthqNFq5FUlN0bxTI2Z/i48rP8bwt12fO2fqCbuAv4u5xndkLztKxZckw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787707828; c=relaxed/simple;
	bh=myemN6DX3lABoRKkmvbT35GB34tCZcAmQ8zO26JtQqM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dh/CFZ2COx2seqOJ2lHVD7bjd7mk1Uy60+ZKHCyCud2Wl3T0HwXsXhO6oE+NI4q2O3lPYd42bTEvqW0YHr1YaLjXhrE9a817SWlzk3O5VKXYvTLpWwWmUZfJNhpCQzca4E6LwIyqLxnJiDmgP1Ca+hIMGsIhNFIYhMoXdjFNyAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UfssK4oI; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UfssK4oI"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-92e7c6ec9dbso19364785a.0
        for <linux-sunxi@lists.linux.dev>; Tue, 25 Aug 2026 18:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787707826; x=1788312626; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r8xxhXLXwBvZGQ89s3NtLyGdJ91KtYqy6L+FbcUge9s=;
        b=UfssK4oI/9Xe5Ol8SOiy8ku6o6eK4I9bs14UaHak0Nf2nC/TZ+iSFpVAdesq8qoYy1
         AhQvFyHOzZ1TSfYJg/LpeJzgPAd5vtlFTERLPfZiWriXUQz0LgUzfJmtBfuCXxGCGzgv
         gWSGRyoj51kMoXv+/KchKc+uvreg7wZKg7Z/5FPJXRIWv5+J4GbrgkbLZHq6Lh2DeYR0
         feGLOvOs+n1VxUhkLsfY6cTl67ZqC8E3aQtV6/C4NNPIj0ceEOkaHugCpW41t3nVDW+n
         f78nLe4sX1RJm4ZtWrrM7yhsIuVWWE5Tfnzdh24twZRKKOauQK+qYhVu2NyVi981ftVR
         N98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787707826; x=1788312626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r8xxhXLXwBvZGQ89s3NtLyGdJ91KtYqy6L+FbcUge9s=;
        b=EvZ3WyFJ5Bjasil+4zZ/tOvO0keJiu7Ct6KQBITiep0Oefupwg9L62MLoVpuGgcenx
         4Ax1es86yH9tnOTVRSzttlSbxZgV6y9Kl63FVzdnSC0fS9+xjmXJh2g2IPSKqeuh9Fyi
         RtfcxZKmVtH4xgg70NkpEaYaEIcWWDyZpOoksyYSJwYlb1BB2MUhmuBZ6D0cpDC2RPhF
         Oek/iiX8iOdt6BoUKZ4y+grN5/Fs7dVRK3FlyMIMfJR8+0XKr8ZnLu9rrd1WjWCnPIfH
         j+Nm7OlD1pej/FYhqk7LRJBOqyBy7URwka0kThmKEU4dqdkki2ChQMRslZ8gEEceNagL
         3ALw==
X-Forwarded-Encrypted: i=1; AHgh+RqrZdRlf7s/CdAd6Pevq6MfLM3KZEKTlt84jBsGufx9K/oNbkpfqmP4IcEshYIGnaJd+PFMImeg9fCxGA==@lists.linux.dev
X-Gm-Message-State: AFuF++nMZ+zTDWut9+IjNXFJFKoZglLBp902psVqtAEacZbgR9JbQWy1
	Okq4Q8w9FxJ3A/OTdlj4Gp3u4GRRunCD+SVdwKviC/3tJJm67Q6M/XtU
X-Gm-Gg: AR+sD128Li7bBSpfOVsetJgQPahIJD7nibZLOsngfL7a8D8lZEd4iwUb00ccuyLpCQa
	JRzz/BHnXvYabwpTOhdztf2z4i9VQEpUqD3DiejUVVpDyrx8s9+O9h5TGhCN9cvPJ8p2cI4/OK9
	d6gsYxsFPLJvE72u7PtzKZ5nCzOOL3I9vVFKkUD7z8W1sKCXot0aVObHqvfZ/KOKZZZrJa/RRJ7
	WHQ1WtLoo0a98cx71hO+vTiUhck62CBuOsgAfm9k0Ji6VISFmW9frtvClTJ/dFtd/5qVmLmx1g2
	ksyCubJxlpoi6pWv7xZH/kcOsOoU9DsLG+scxNw6U4IUkolyMbEYFdyVlC9iXqJdo6hlef5HCPp
	Z3EEhJc+uICzTtMTf1wgXxQ7zqpWplB4y3K5ZzvJdemkNWGEVkQTMEieDddH1N+Ztw8Ndj41dEX
	XaipXVm9+9cN4r1EBL1dHlGlBYiEO9V5QnJiREZDwpUzSxWDPJ4qstpD0sXvGxuw==
X-Received: by 2002:a05:620a:72c1:10b0:936:e71a:db90 with SMTP id af79cd13be357-937803e0e3dmr234920985a.29.1787707825690;
        Tue, 25 Aug 2026 18:30:25 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377e67c52csm102398585a.38.2026.08.25.18.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 18:30:25 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Wed, 26 Aug 2026 01:30:04 +0000
Subject: [PATCH v4 2/5] dmaengine: sun6i-dma: Support variable address
 widths using masks
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-sun60i-a733-dma-v4-2-dc2f745f40dc@gmail.com>
References: <20260826-sun60i-a733-dma-v4-0-dc2f745f40dc@gmail.com>
In-Reply-To: <20260826-sun60i-a733-dma-v4-0-dc2f745f40dc@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: Yuanshen Cao <alex.caoys@gmail.com>, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0

The Allwinner A733 DMA controller supports higher addresses (up to
32G) compared to previous generations. The existing `sun6i_dma_set_addr`
function uses hardcoded logic for setting the high-address bits in the
LLI parameters.

Add `src_high_addr_mask` and `dst_high_addr_mask` to `struct
sun6i_dma_config` to handle different high-address bitfield mappings.
Update `sun6i_dma_set_addr` to use these masks via `field_prep()`,
allowing the driver to support variable address widths.

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
 drivers/dma/sun6i-dma.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index f305fbfb3545..53c54161e32a 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -24,6 +24,10 @@
 
 #include "virt-dma.h"
 
+/* Non-constant mask variant of FIELD_GET() and FIELD_PREP() */
+#define field_get(_mask, _reg)	(((_reg) & (_mask)) >> (ffs(_mask) - 1))
+#define field_prep(_mask, _val)	(((_val) << (ffs(_mask) - 1)) & (_mask))
+
 /*
  * Common registers
  */
@@ -103,8 +107,8 @@
  * The LLI link physical address is also mangled, but we avoid dealing
  * with that by allocating LLIs from the DMA32 zone.
  */
-#define SRC_HIGH_ADDR(x)		(((x) & 0x3U) << 16)
-#define DST_HIGH_ADDR(x)		(((x) & 0x3U) << 18)
+#define SRC_HIGH_ADDR_MASK	GENMASK(17, 16)
+#define DST_HIGH_ADDR_MASK	GENMASK(19, 18)
 
 /*
  * Various hardware related defines
@@ -147,7 +151,8 @@ struct sun6i_dma_config {
 	u32 dst_burst_lengths;
 	u32 src_addr_widths;
 	u32 dst_addr_widths;
-	bool has_high_addr;
+	u32 src_high_addr_mask;
+	u32 dst_high_addr_mask;
 	bool has_mbus_clk;
 	u32 irq_stride;
 	u32 irq_en_offset;
@@ -687,9 +692,10 @@ static inline void sun6i_dma_set_addr(struct sun6i_dma_dev *sdev,
 	v_lli->src = lower_32_bits(src);
 	v_lli->dst = lower_32_bits(dst);
 
-	if (sdev->cfg->has_high_addr)
-		v_lli->para |= SRC_HIGH_ADDR(upper_32_bits(src)) |
-			       DST_HIGH_ADDR(upper_32_bits(dst));
+	if (sdev->cfg->src_high_addr_mask)
+		v_lli->para |=
+			field_prep(sdev->cfg->src_high_addr_mask, upper_32_bits(src)) |
+			field_prep(sdev->cfg->dst_high_addr_mask, upper_32_bits(dst));
 }
 
 static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_memcpy(
@@ -1283,7 +1289,8 @@ static struct sun6i_dma_config sun50i_a100_dma_cfg = {
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES),
-	.has_high_addr = true,
+	.src_high_addr_mask = SRC_HIGH_ADDR_MASK,
+	.dst_high_addr_mask = DST_HIGH_ADDR_MASK,
 	.has_mbus_clk = true,
 	SUN6I_DMA_IRQ_A31_COMMON_CFG
 };

-- 
2.55.0

