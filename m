Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793730657;
	b=X+cVQE/YeU77FNe8eTTfenZfayOIVH2+eUKK7wTnfIBXPCbZoJQRWVDmvqKi2nrrkGqN
	 LLJCspnVR94zlRGYC4YXdsDk+T6evBDlMQbQejCeYgQrjGfLoT2WpUz8O1D1DEwCtTOUB
	 Xn6bAz0od3SwrIymbIYBFPLudpsm0gFGJ/6cBxgE9ETxNB9WZD4tTrfCNYq224vhHj0dP
	 kj2kdpxdvGcYd6OVZ8gvDFO2cLprGVhFX5VGvnyAl8Uq1wGlrHiMZuy/Lk6TojkKivNhJ
	 JY3ip2T4dxrvghmSY66TS2QnF07ZO+2rCkIyLby9VdRtk868ArREl+aVV0IrzAtm+7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793730657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ub0WZcvYrfsAg+1QngeRQr7bchPe1sdav2r3oWVP5WQ=;
	b=eG1lpdCTxmLfU9URPHw1RRlvUsauEHY1EF56gv87LHeMkOoNZhs/5k6uL1orKY8uNwK5
	 6DK8FA6e+2J8KWZj0rt8t4OQXymVG0Z7ULBA2bi3bmtfzPd+WN6s61AzBF1MA+Y2CzeQR
	 x8ubwRNrrbGaEOpmADghGyrmWiCUC0QDl2K3biiGGYhr2mDo097fB6Lqi5pHwouxfPSiD
	 I4AKYb4mSC8IQKFaaZ7jXNCm/hauzKgNsJIjVlKCrXrlZ/2NKjea3xu1q/EPgBZi1OG4G
	 /4QLOK+Ncq+Hto4MR5F8iNfo6ztC7fvVqmD8stbNsUR7C/hVkmYtTrZyOc+55g5EUvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MRZ5sZ6E;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6E2606A33D
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Nov 2026 18:30:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A6E2606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MRZ5sZ6E
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49d05d51553so29962255e9.2
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Nov 2026 10:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793730656; x=1794335456; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ub0WZcvYrfsAg+1QngeRQr7bchPe1sdav2r3oWVP5WQ=;
        b=MRZ5sZ6ErQJ3bwNCcioKDwwqRtW72Jbx0Vp9cu3qeIaiECFvNYXZdOPjhpuHLl1EL/
         qaq2QDijlr5QGzy0bAV/wjn4r2DQD0VsL7LPY0vrutVGr5fUr+N6fAacWtArsB3WM7yv
         hpXmwB/4M8waSUD6B5COjtbtHy7TgGOmRIZYUFNawhXkjV30AdJ2AeTDBEuI9USR1rdB
         drslGApRPZF6GmgBBQyuoQj5bRY4cMW+V2P+D63+QvPnBKyCbpqc3aH+uMwtOOOCkC2B
         8IDKCABYeHIeRU07xQQxXIP/TwIcnBgSDaoppsbALK+le83B+F9BSewR+yXbeexmOI5m
         lISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793730656; x=1794335456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ub0WZcvYrfsAg+1QngeRQr7bchPe1sdav2r3oWVP5WQ=;
        b=zkiJkTdKxDlFGDK613Dqg05KikjG2i5qas4SlSKa16SNFj7OTyb8XoCLGoQPLJZzpK
         KkOlJmVP6d/FkvwuckZm2ScgUrNVmZ+s/UVXFOKejUESaTeUv3hMM/e08oHJ1rDLB2Dp
         9PAsGEUCnPh11QQL/JbDHxGZ+w/6Z7CAAK+DgTf8COPdUTR1eUVqXZTOcqbHSHy9FPkt
         S7NYt9TV8sMLqIq8HNDwZZ/7YDu3C9eCpVNfce5PM94eGWxTpvfyfEmvNjQkAnTtzc2O
         uBSk0RwJAVeyxrXzgYyShxbji1Li01x7foc0/uQI1EE8Zl3u9YVY1RkpM5A4ljXQ9mub
         NeIA==
X-Forwarded-Encrypted: i=1; AKwUvByCYBzsGPhSWwLojMvSncDxiiC8rVMXEtNngOD5C9+D1GRIE/tebkKT9Oe5XWS7A1J/n81G/26ebud1XA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/6OmwLPq/+cp7AesrcH7p9rhp6jEcN/Oqy/bi0+dcAjpQf9jRQ
	v1smYSBRRj1w8EXacXa66ULjApq8Wl6D/G7wZn3OwudrF6Ki2QAjIkMr
X-Gm-Gg: AYBFou3kNFIWFA9rZzvJ/ckSm0ABEGPZzPktR4XzJyJgPDccuC8OPKmsW81JQZc3WJn
	NR3RNtCM42aipHHRFAe1Tn1QljFGOnawUVt0asBNShMF1qzGRS0vpPqLcCDMigN4P8elTkNZ/6K
	DlJV4l+VIqFLmHnnvXi+7qzzvIhj5fl8tz0UamhDbwVBj/bUgeD9jowMOLE5EVRUw00IwXafmJX
	UmBQPe7sw/9qJYfshdesuWYQ26Jdy5jYeFjH+IKp7xzwNnSza9t5zxccfhJ9YcaTqn/4a8Gh1Wr
	DaTiMFPEk8K6QK6RAV4+janIdyooxS848lJpC9nI5o34ptBX/8Vbyv/SFK/d1a+yQd/VgUi4Qx5
	Wo3Y4jgwPE8V6qXFbHn5w7z6WD2qS1RMQjzd0EH4EgD+LVrfjQgnx14gHc6aeCYFa1aVJVnYpuO
	RyJAt8v4yBMTSDn9TGaKLkgCLiZ1XF0QaoWmMwAnaqYfuHXQs/3rP7RDCSlvya4sUA1BEqbPr5P
	UIg78Ss5COny3VgjzF/HRoSasK0SeBeC4zaObkCUp4dfWqRLUNU5njFRpguY8g1CtNKA7WVcdO1
	oFBpndKAOhjyr9ZSlrG+BBpftv2n3hGY7i9gom+iSTYlGHpP3PVK0btRXZdxS9pfTlft9yviR+S
	WkMsOg+7fif+SlNmm9sfNucr6WKIJKLxWzuhNTVgEIQUynWiPNmNX7KOfbU/JisyfcRz+Fo2Ya/
	QvrGN25bK1Shw1RoJFdlXJDv4/O+M4awIRjXj4B2WfD7XbEnbPnHvW11BFGvg6BK1dixXsH6c1n
	gW1/54RtsrajxD/wbt1clDgEh7keTrnXz+c3YSq+aN4Hk9ugQ==
X-Received: by 2002:a05:600c:4e14:b0:4a5:a5ca:de1d with SMTP id 5b1f17b1804b1-4ac187a80bfmr329609245e9.30.1793730655752;
        Tue, 03 Nov 2026 10:30:55 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab00ff3dsm146339785e9.14.2026.11.03.10.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:30:55 -0800 (PST)
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
Subject: [PATCH 4/4] mmc: sunxi: Distinguish CRC and timeout errors
Date: Tue,  3 Nov 2026 19:30:30 +0100
Message-ID: <20261103183030.81078-5-jernej.skrabec@gmail.com>
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

The driver reports every command and data error as -ETIMEDOUT. The MMC
core however relies on -EILSEQ to recognize CRC errors, which mean
that the sampling point drifted, and flags the host for retuning when
it sees one. With every error reported as a timeout, retuning is never
triggered.

Report response and data CRC, start bit and end bit errors as -EILSEQ
and keep reporting timeouts as -ETIMEDOUT, attributed to the command or
data phase that actually failed. Report any other error as -EIO.

Currently supported SoCs don't implement tuning, so this doesn't change
much for them, but it is needed for the upcoming A523 delay-chain
tuning support.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/mmc/host/sunxi-mmc.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
index b875ef4c2b79..eb1b7883a715 100644
--- a/drivers/mmc/host/sunxi-mmc.c
+++ b/drivers/mmc/host/sunxi-mmc.c
@@ -537,13 +537,29 @@ static irqreturn_t sunxi_mmc_finalize_request(struct sunxi_mmc_host *host)
 
 	if (host->int_sum & SDXC_INTERRUPT_ERROR_BIT) {
 		sunxi_mmc_dump_errinfo(host);
-		mrq->cmd->error = -ETIMEDOUT;
+
+		if (host->int_sum &
+		    (SDXC_RESP_ERROR | SDXC_RESP_CRC_ERROR))
+			mrq->cmd->error = -EILSEQ;
+		else if (host->int_sum & SDXC_RESP_TIMEOUT)
+			mrq->cmd->error = -ETIMEDOUT;
 
 		if (data) {
-			data->error = -ETIMEDOUT;
+			if (host->int_sum &
+			    (SDXC_DATA_CRC_ERROR | SDXC_START_BIT_ERROR |
+			     SDXC_END_BIT_ERROR))
+				data->error = -EILSEQ;
+			else if (host->int_sum &
+				 (SDXC_DATA_TIMEOUT | SDXC_FIFO_RUN_ERROR |
+				  SDXC_HARD_WARE_LOCKED))
+				data->error = -ETIMEDOUT;
+
 			host->manual_stop_mrq = mrq;
 		}
 
+		if (!mrq->cmd->error && (!data || !data->error))
+			mrq->cmd->error = -EIO;
+
 		if (mrq->stop)
 			mrq->stop->error = -ETIMEDOUT;
 	} else {
-- 
2.43.0

