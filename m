Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795717793;
	b=H58IG4mFTalMrTpHX0ANQKX2K1WF0cdGLg7muPyn4fA4LKLBSY3HTwAwcZsyVH1/5DLJ
	 pOj+SYZXVi7qiZig8CSTDhat4erRipVxSbtd2tmUupv2aQQSaenpuytJYtELSZNyq8pwZ
	 h1xaE1a9ggQvlNsaMl2WL06JW3GWmDfdASQTSILiRZWH9MyBkVg02PgKfCxaW+j77i+VY
	 WF99jt6qOKf4MDX5jS8cox8+b/hQiVa18QysC8frhQPJeHSEQ9wUycsscmWf7KaEaArjh
	 xz6XhPkijeGyL+BTmLd+x1dpmUqSZySyJflKKLYa0tBfLNpNL+9B+OGu6BfaaFPaPbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795717793;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZrWA6yqDQTNdq5FypmDdUcpaE1Yb8zNzb3Pr1N6ZV4Y=;
	b=K8eBwUhKPAyuByo5sGqfLOX+1VQIP3/FbxJNpK4jgb0Bvh2ztW92snwbzdncHYxSRcQO
	 3LvVvySHwIL1fAzX1TdF3BF5wCBN+0LUNnUOva4srKmgkGxXH2myJiK8USRkk5Wk+xZfY
	 liZuvoS0Iu1nBZNFnjz9S5oEYPF1Zo51njhG2XUP94kuDUbcGH83jHErF5H+5JWLzu5nw
	 jQbPAj9XxlvidErmaGaVWQ1581bbs4LWMCdYcaCjpNZMEL+mJwzKLqnRNtsBCY05a96oO
	 333RFQq/rDy1MPt0r5JlxDk+s2obcwedeA7/4SRQCzyWTAbUbFpkhAlyqynatkHvOAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YLBVhoni;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE673606A32C
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 18:29:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE673606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YLBVhoni
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso72804305e9.0
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 10:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795717791; x=1796322591; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZrWA6yqDQTNdq5FypmDdUcpaE1Yb8zNzb3Pr1N6ZV4Y=;
        b=YLBVhonid/ukY8Hm48mdVIYKBQIkpIm0epKCj/5yuTap04se9huvqgbmJX+8laZvck
         Gz0JfRirtEJUHipFeT3CVAupY3cayDeC5HI/eKVU1XtFr0plvg3zoh0qQx1yTlkZ1jQY
         O6iDqnGQxsmOoYFXNtrdFl61hEhXyN6opW++MX1i3J4QdY4XdgslertymBUwQ20EZ6J2
         kYoK00jUGy1KgYksRD/WF49cv0aJyXqvRWjsPgPN/hJvnLKZll0tdBb7vR7QWdx+z+IZ
         MANSk/tTAaToJkAs7IYrAXly8RnOT0+9Idx5KC4YmvksTj4FE8wga0ImJeppSaNQAbI7
         9elA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795717791; x=1796322591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZrWA6yqDQTNdq5FypmDdUcpaE1Yb8zNzb3Pr1N6ZV4Y=;
        b=Dzfhe93Y/xrs6rRyAccoJdy/Iw2vcaeiGN/A7uIYNldhOaDTanyWMvOLicInh87guh
         qaZ+Oatz5Hnrb1P9vKLeCGrlrME2o40C46zYEtJs/GiuXwkp/pv9ZutchXAvmzNMdUBw
         Q4EC4RNqjEOpc3+4tf+tUImrO1hdqBlnucXUwHxmln75wN8V32V2rNwTIa/TVO4va5e9
         i5sGkaJ51cz0hOvlty7AT3g54FRW26IPIBZ/8cL00lepG6vy6JjJ5k9m3aTugaKc0VDX
         b8b2k/MHHlDP5xE+VgiDz1UoNdJ5go+M0PrxdglQb+DrtF7NuHLs4TQg1IPCAilJ6vaJ
         Y25g==
X-Forwarded-Encrypted: i=1; AL+hErEJEkUIVO55q9NapyrHAQFjORq8yzo66t5k70qhLilyLAdn3BT+MF6T2eTzAcbNfer/ZvEkIJ7pXM9UeA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8fbKUDaBIMDEqt0tjPgD+BVJ1fHWgSqmOfFievdMjRn5tUydR4
	aTn0Zefl+6VBvQWtS/2okhaDXZBaJkYpjbd7WQ7aF4+y4TSJKjbrvGhS
X-Gm-Gg: AZFdTZembCD6xifcJ5egohjIi9zrrXyXVkWf8PjwNleeD+cHZS9V8dZ7J2oJn2Qxncj
	RUU2oblqgR6tmA1BHJPlBc5FPQzp3HbtNYecQeMv7p3xcBSSWRpqhImyT6kK/5i4S3pgeihLsqz
	8LcRGGIs9h2BAjd94zlOqsB2b0RAwn0oO+7+95v2zPnVDdIb1VF6cE4NewTZq9C9pEzBA7d2xzq
	GySxnrf3zq3lJ0tMwC2VUTIdY5uMnbZ+/NADX1EtLiPAB8klkPvy2ftFQtXZ1RuAjhyL7SGJZrv
	qeNnl1nKG7hNfhDonyBkaifa6FSa/VM6dZfqczRroZijn8OY9xa0wH51gjJRhhH8g3SvD7zMdHL
	6McBM4blWLoe4zrtHBwmwTvFY6SRs/LUHYn7b7av5R69US9F1g/4voU1qu4qUMEbp2lV6r+IPNN
	Vlv7eLiGdkjf4mJxZWEiYlmfEgIjBqPhgPirjfiZUv3QqkkUAwtFF89T+7MyvScZGlY8i4EM8cc
	d0x9DLsbgxyzxUYvd7B/H+ijMFHJ4YkgAV7Jc/SiGnZD28cz7Qm7kMFls2yjnvaRm9OJa7JuzBA
	TG9JGSUhrhx8Ym3klRgm+yqVYZ4IIh3IPPtP3MQ3ccpIYL8NvsVB8sCQVzwbTJ3WRgROq7u5LC5
	sOFKbL4/tYDHt+da3CeGxubArarbf8BHZGaJYS5ZCNVeGUN4sLmP/qVb+ATqzp/rRRX1xRtrRSu
	uBmxt9HklDpRlxV2e2Tomio1Lq4D7msG0YSGTcwMO9DZOeKnz5fw8WPLuoa6jUqqLTTZyKYDR+p
	5BYYPp87zgb6UPqDvnIuFPXmy0T6H7BtnYGgGKhKA==
X-Received: by 2002:a7b:c4d2:0:b0:4a1:d291:d863 with SMTP id 5b1f17b1804b1-4bb861394f1mr376407895e9.4.1795717791236;
        Thu, 26 Nov 2026 10:29:51 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2052c8sm42382159f8f.41.2026.11.26.10.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:29:50 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Anfernee Cao <anferneemelokc5@gmail.com>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 2/3] mmc: sunxi: Build IDMA descriptors from mapped SG list
Date: Thu, 26 Nov 2026 19:29:43 +0100
Message-ID: <20261126182944.3136900-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126182944.3136900-1-jernej.skrabec@gmail.com>
References: <20261126182944.3136900-1-jernej.skrabec@gmail.com>
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

dma_map_sg() may merge scatterlist entries and returns the number of
resulting DMA segments. The DMA API requires using only that many
segments, with sg_dma_address() and sg_dma_len() (see
Documentation/core-api/dma-api.rst).

The driver instead builds one descriptor per original entry and uses
its CPU side length. Build the descriptors from the mapped segments
instead, and split segments longer than one descriptor can handle.
This can't overflow the descriptor table, as each original entry fits
into a single descriptor.

Also check the alignment of the mapped segments, and unmap the
scatterlist when it is misaligned instead of leaking the mapping.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/mmc/host/sunxi-mmc.c | 91 +++++++++++++++++++++---------------
 1 file changed, 54 insertions(+), 37 deletions(-)

diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
index c53d47576864..b862df26e192 100644
--- a/drivers/mmc/host/sunxi-mmc.c
+++ b/drivers/mmc/host/sunxi-mmc.c
@@ -356,36 +356,49 @@ static int sunxi_mmc_init_host(struct sunxi_mmc_host *host)
 }
 
 static void sunxi_mmc_init_idma_des(struct sunxi_mmc_host *host,
-				    struct mmc_data *data)
+				     struct mmc_data *data, int nents)
 {
 	struct sunxi_idma_des *pdes = (struct sunxi_idma_des *)host->sg_cpu;
 	dma_addr_t next_desc = host->sg_dma;
-	int i, max_len = (1 << host->cfg->idma_des_size_bits);
-
-	for (i = 0; i < data->sg_len; i++) {
-		pdes[i].config = cpu_to_le32(SDXC_IDMAC_DES0_CH |
-					     SDXC_IDMAC_DES0_OWN |
-					     SDXC_IDMAC_DES0_DIC);
-
-		if (data->sg[i].length == max_len)
-			pdes[i].buf_size = 0; /* 0 == max_len */
-		else
-			pdes[i].buf_size = cpu_to_le32(data->sg[i].length);
-
-		next_desc += sizeof(struct sunxi_idma_des);
-		pdes[i].buf_addr_ptr1 =
-			cpu_to_le32(sg_dma_address(&data->sg[i]) >>
-				    host->cfg->idma_des_shift);
-		pdes[i].buf_addr_ptr2 =
-			cpu_to_le32(next_desc >>
-				    host->cfg->idma_des_shift);
+	unsigned int max_len = 1 << host->cfg->idma_des_size_bits;
+	unsigned int i, d = 0;
+	struct scatterlist *sg;
+
+	/* dma_map_sg() may merge entries beyond the descriptor size. */
+	for_each_sg(data->sg, sg, nents, i) {
+		dma_addr_t addr = sg_dma_address(sg);
+		unsigned int len = sg_dma_len(sg);
+
+		while (len) {
+			unsigned int chunk = min(len, max_len);
+
+			pdes[d].config = cpu_to_le32(SDXC_IDMAC_DES0_CH |
+						     SDXC_IDMAC_DES0_OWN |
+						     SDXC_IDMAC_DES0_DIC);
+
+			if (chunk == max_len)
+				pdes[d].buf_size = 0; /* 0 == max_len */
+			else
+				pdes[d].buf_size = cpu_to_le32(chunk);
+
+			next_desc += sizeof(struct sunxi_idma_des);
+			pdes[d].buf_addr_ptr1 =
+				cpu_to_le32(addr >> host->cfg->idma_des_shift);
+			pdes[d].buf_addr_ptr2 =
+				cpu_to_le32(next_desc >>
+					    host->cfg->idma_des_shift);
+
+			addr += chunk;
+			len -= chunk;
+			d++;
+		}
 	}
 
 	pdes[0].config |= cpu_to_le32(SDXC_IDMAC_DES0_FD);
-	pdes[i - 1].config |= cpu_to_le32(SDXC_IDMAC_DES0_LD |
+	pdes[d - 1].config |= cpu_to_le32(SDXC_IDMAC_DES0_LD |
 					  SDXC_IDMAC_DES0_ER);
-	pdes[i - 1].config &= cpu_to_le32(~SDXC_IDMAC_DES0_DIC);
-	pdes[i - 1].buf_addr_ptr2 = 0;
+	pdes[d - 1].config &= cpu_to_le32(~SDXC_IDMAC_DES0_DIC);
+	pdes[d - 1].buf_addr_ptr2 = 0;
 
 	/*
 	 * Avoid the io-store starting the idmac hitting io-mem before the
@@ -397,7 +410,7 @@ static void sunxi_mmc_init_idma_des(struct sunxi_mmc_host *host,
 static int sunxi_mmc_map_dma(struct sunxi_mmc_host *host,
 			     struct mmc_data *data)
 {
-	u32 i, dma_len;
+	int i, dma_len;
 	struct scatterlist *sg;
 
 	dma_len = dma_map_sg(mmc_dev(host->mmc), data->sg, data->sg_len,
@@ -407,24 +420,28 @@ static int sunxi_mmc_map_dma(struct sunxi_mmc_host *host,
 		return -ENOMEM;
 	}
 
-	for_each_sg(data->sg, sg, data->sg_len, i) {
-		if (sg->offset & 3 || sg->length & 3) {
+	for_each_sg(data->sg, sg, dma_len, i) {
+		dma_addr_t addr = sg_dma_address(sg);
+
+		if (addr & 3 || sg_dma_len(sg) & 3) {
 			dev_err(mmc_dev(host->mmc),
-				"unaligned scatterlist: os %x length %d\n",
-				sg->offset, sg->length);
+				"unaligned DMA segment: address %pad length %u\n",
+				&addr, sg_dma_len(sg));
+			dma_unmap_sg(mmc_dev(host->mmc), data->sg,
+				     data->sg_len, mmc_get_dma_dir(data));
 			return -EINVAL;
 		}
 	}
 
-	return 0;
+	return dma_len;
 }
 
 static void sunxi_mmc_start_dma(struct sunxi_mmc_host *host,
-				struct mmc_data *data)
+				struct mmc_data *data, int nents)
 {
 	u32 rval;
 
-	sunxi_mmc_init_idma_des(host, data);
+	sunxi_mmc_init_idma_des(host, data, nents);
 
 	rval = mmc_readl(host, REG_GCTRL);
 	rval |= SDXC_DMA_ENABLE_BIT;
@@ -1016,7 +1033,7 @@ static void sunxi_mmc_request(struct mmc_host *mmc, struct mmc_request *mrq)
 	u32 imask = SDXC_INTERRUPT_ERROR_BIT;
 	u32 cmd_val = SDXC_START | (cmd->opcode & 0x3f);
 	bool wait_dma = host->wait_dma;
-	int ret;
+	int nents = 0;
 
 	/* Check for set_ios errors (should never happen) */
 	if (host->ferror) {
@@ -1026,11 +1043,11 @@ static void sunxi_mmc_request(struct mmc_host *mmc, struct mmc_request *mrq)
 	}
 
 	if (data) {
-		ret = sunxi_mmc_map_dma(host, data);
-		if (ret < 0) {
+		nents = sunxi_mmc_map_dma(host, data);
+		if (nents < 0) {
 			dev_err(mmc_dev(mmc), "map DMA failed\n");
-			cmd->error = ret;
-			data->error = ret;
+			cmd->error = nents;
+			data->error = nents;
 			mmc_request_done(mmc, mrq);
 			return;
 		}
@@ -1091,7 +1108,7 @@ static void sunxi_mmc_request(struct mmc_host *mmc, struct mmc_request *mrq)
 	if (data) {
 		mmc_writel(host, REG_BLKSZ, data->blksz);
 		mmc_writel(host, REG_BCNTR, data->blksz * data->blocks);
-		sunxi_mmc_start_dma(host, data);
+		sunxi_mmc_start_dma(host, data, nents);
 	}
 
 	host->mrq = mrq;
-- 
2.43.0

