Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793730656;
	b=GPSTF6rqUjy73I5E+xUK4vl5gyXDnJ9runZ5t8PAAMWTUpr+mbDCcEslHyeIItRtbzmp
	 yoRCk3Clq5Y9MQ/iJcG3b8fbxDTEamyosYLzYZBl3k0c3+qZF23E7ZeVnI9HnzJ4zkMFY
	 j7D6Dywe9K7i0DIwyuef87iXDUpCN6+RJ99f3ISv+5fEDylDG0B6F0a0FxLqBbKMi8nMe
	 IfK+nryM31bKmt7leajMp2tJQ01M9+TZ1kIEr8+3WsbAcH977aRHeNPqYUfrrUUOt+ApN
	 +/NNAKWitqnto1UE3odH72QvffS6ZoY96+WkTxMQ9SWYIcfAcdEE4uSoHBfOFgFwIhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793730656;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rYT7p8+zm03NFYU5ZsNb8qxdeF22ftPPPmoAm+D/1Kk=;
	b=nhzVeCrTdSm8ps/L9Ghrt5Py6gfU9eNlUaAT90z30cj/Bqc9Era9itliP74g3kQ36Q2t
	 0dnEWG8ms1zwkXDjnVktbg/YlOChqgogIrTdNcUAWvgj7i34oS6zjHnGwdsA5TEChCJOZ
	 5P6vCIOqF3ZmREaXy7RFB2G4ZATlyrh0MmehvLR0jH4dqG8MT7YUQfMjsM+LEaS6NFmfp
	 J0/Y5ZgFp0W88PvSc/C7EEvjazrSGdVYOe0N5mWXQuproV/NYFmqvQQ+2Bxgw+tRA3pUD
	 PjE4Vp78SzTk5yfWI9GD52s+ld+kNZqtNCF/OFYeIBdCREFhEIiGBGwDzdSTly8+5hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a7U58Aof;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4B5606A33C
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Nov 2026 18:30:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED4B5606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a7U58Aof
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so38672265e9.2
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Nov 2026 10:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793730654; x=1794335454; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rYT7p8+zm03NFYU5ZsNb8qxdeF22ftPPPmoAm+D/1Kk=;
        b=a7U58AofeEIsYvw46QoVmsT5/dC6EENKQj0N50SU6gAwzQjQIyNVfYDrZ1VbdJC1jM
         mZiyoDB9+MYr0jUEzetBN0kZXcr7R81Uv4swP2Gy9aDtAk3dwW4slPDahO2y7v9rDmbF
         Ys+DdWNzI6Ktu39tX/PNRmqTWIdthEw1n+VOPuzyXiuMFoEDlqw9wXXKsBYilAcm5Hz3
         rDvaSpdJn5BxIdLV0B+NpdMHUuwkJCAjp2Ack7INEW2hpn6eIHq/7w5hPKm3ir645fwH
         X44w0qZEIcj4uieOEfbnjOlvGM6hIaRXybEWkNwhHJi4lThvBaq6nS5rVXbLEKs56h6G
         UESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793730654; x=1794335454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rYT7p8+zm03NFYU5ZsNb8qxdeF22ftPPPmoAm+D/1Kk=;
        b=nYV2YMiZkz8PJP2AzuKQM2cg4SuZ7aWWRmQt57BCtIc9WOVMoiOdYWlADcbBzgxOpf
         SlRzz3qEoEyLcYG3ic6m0EClol2A0lGPTixEEvA1zo8pHjQPTw/Hex5LhgcjrQ65hNrD
         H7jIG6+ERq2qN9NqfjItmBFnCRwUdl5ITrzPZoYTCeNpyn8yiL34Ko6Pw7xld1QzJbGI
         X1cxOxKw962n+s1AnHc74r1vkZCxg99ELIa1oMLf0pwP7Zh+9PbWB4GE1nhfRa6XvGvc
         47tb941NUDkJyhJxNcAuc9/PsQWJsqMYhLaaSqsL2mxIqFvIGMOb+u+QzSn7NJfRDLB9
         54Kg==
X-Forwarded-Encrypted: i=1; AKwUvBxVkAoizxBTV6rLcScjuAccw33qK03SDHCeVX6vs7TNWZTe/j89iOjC1UzMntRVdzxYi8KkvbpjdtPzJw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+xfDqwi4E1zVrwsljSoWH5Ix7vHQafG0uViTBdhmNYXS3EH9fI
	H1XfGAPRtBBZHB9AbuJOHWVxN009IukC4G0rq0JC+lD0QY8cc0QpMGuaMam48A==
X-Gm-Gg: AYBFou1UBGQsveDxgEns47GeEZxcCMnEGoqGNobHiy0shYMDM3jxn3JvHE/GboIvPqd
	/l66YsVKZCcdzG712jLUuZ7az7WDGYg7SNmvjXuNoZgK1QO3jBiTGlHt9/1yE8+A9jPTGi6hYbI
	zgeiWRPBLDxXrzKtllWwQUaVSMmLw0UouB0JL1uYUx/ybzBN4y7qOnsKZ9vhqCsddJb8wxPMFP3
	Ys2eDqqI0CuLEIVRv40JkabE6GbfbmuAd4/LG7CsjbuV0UG8PUX7/wbOK3TcSHdyoF6MozZwLzm
	wWJuMX1LNu86VJOVgz3gfp6yhpCKfS+JHMYlCmAgEcZSgZ/Rs2YSCkaoYW9jUUyxrhhun+ibFIA
	82fyRMyqr9LTylcuQ3YmNLKpgh1C+V/s1KpLA+PXgeX18uT3vcCWWU7pC+TIO14ffv/Yr5ea3QW
	bptuD2Rxk39GFyyKlk90bOXJz8aeBppGJWp5ZF0w+cySaRnQ90dYwlv1bl9guK/Rxh+va7Up9B+
	+zjL0idhcYnYsAM4yZqxKus5KB69oAgxcdko1/Sk3Y/l3j2Skyxa5jF03Z13aN3HS3XsR8zlJIZ
	VZi+YE8CfzBPDrnlKiTlfeZe7FCFwI5hEftbaEesO+rmd9imW57nTonzuHTn0cpYCoD5CIxbbnx
	nCmWiDuyaM7PlWzc7xRqDTDDPu7I7pD5HwB5cVmI85pN19T9t86RajLkdPlYPGuWINUX1d4fKHr
	8NM58Vw9GxnXR/3IpMdhVYVaGOYDP+n8B9CM/hp658T1V1wMq54YCLidMaAizhusEyFPqaBrvnZ
	C+5ZzrPlPjLkHw8j5HezEmgWgk5Sg3QSdhDpIg9rj2yVLEMUA==
X-Received: by 2002:a05:600c:19c9:b0:4a1:7c7d:8881 with SMTP id 5b1f17b1804b1-4ac182dcb6fmr314872025e9.13.1793730654277;
        Tue, 03 Nov 2026 10:30:54 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab00ff3dsm146339785e9.14.2026.11.03.10.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:30:53 -0800 (PST)
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
Subject: [PATCH 3/4] mmc: sunxi: Build IDMA descriptors from mapped SG list
Date: Tue,  3 Nov 2026 19:30:29 +0100
Message-ID: <20261103183030.81078-4-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103183030.81078-1-jernej.skrabec@gmail.com>
References: <20261103183030.81078-1-jernej.skrabec@gmail.com>
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
index 479420071c2d..b875ef4c2b79 100644
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

