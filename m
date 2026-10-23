Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792798723;
	b=Xjm5a06ThLwjH/qps+U91dhmuyryURczxfT6rlPJA3RupQjHUfpugVX799c/aA8R3lyE
	 0BQmQeX2R39d8s8JGdRZWhaXln3UD35ri0r534vWBkFM3UCdsTMEzU+yekW7sZxHJklf0
	 FREriWOFdwpOzp0I2yOX4bIloX+51H1vaT8/h/IztkR8tuDaqiDVtN5D8g1dJd5nqw9EN
	 KCpqz4BvgxkIC4s3fAF9a2XrDp4HftGqWqVAImVGleH1BqOnXKl9cuBihWkTqrnbv6LSg
	 sGTAeFcKLu3DQY4zdGuzTHNG2QW6XQuuCV//S6tuagGAcOyX34O/DgY8OFuhkQOqKIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792798723;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=F1ArQRepK8gqW1fEvOkHLMAfG1V96lqFmDa0NrMk7WU=;
	b=iwOLVPSqDGY3Sb0j25ZhRNHLTgzYqGWPempcjrRpmtcb+PqbnLZLKJ9CSs7T2T/6k/Mn
	 SYdemNjf+GUrcLm3eoaENyFgt7OSIZgXqulUASsLzPYr13pf9qcNymXldDS6hsmoVewLc
	 BUQm8Rwj0AC8N1x0bh1aSQTBpDMyZSaT88PByYZnQCDmvKbasH1+J97+x9E7hVCbeTS1O
	 Hnq31d6nFEhskHIPsZiWNVHLOFQ85LSPVNYYF+Ulf8frx/aAMWWOLaXFOqPdN4Ndud9Ty
	 yn3HSUMqeh90/IpllbI6nAdL24G61fcvdQmYL5E5pNdQ7QlMbQ+oFqXDf3Ylo4AERPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HIwvbhrw;
	arc=none smtp.remote-ip=209.85.160.49
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D93606A32C
	for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 23:38:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72D93606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HIwvbhrw
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-46556b9e02cso877509fac.1
        for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 16:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792798714; x=1793403514; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F1ArQRepK8gqW1fEvOkHLMAfG1V96lqFmDa0NrMk7WU=;
        b=HIwvbhrwRcJzO8lzeSaCboJIvWF8YGz0OHcdxf3sbRBAwpXSr9ekRHU4jl3QaqSIAg
         VNUYcEON1hAg94PvIHcUAJmIanhdik6bWNBtqYgtuN0YrKDDQB6csLhdQ1HDpKTjcidV
         j5E71oV8QULfsRMYviZif0kLLajNIcuTwUYZjFwVOXTfvtrEKr3izSPqpjRvB1ViQrOH
         gA2aRHr/JFtT+XCUND6WrYbEZGF08UIIojm8DJiSGPNGi3JKwuIT1/4DjecfpKJa2TP6
         Xy6A2OxL9VEnAgapDApA5hZe1uitGHrz0hnN1EBuJq/rdsd2/UFOmC8Ed7D5qapaGF48
         9Vvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792798714; x=1793403514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F1ArQRepK8gqW1fEvOkHLMAfG1V96lqFmDa0NrMk7WU=;
        b=ITpldfG5ShvzsSWtJOWH8Qbg621dHsl/8zuBfEzpwE1dR5HCxBVUAwVXassKXaboBL
         sQMj6Oa6HCVNTP2DUgD5YMIrGns2G0u9Y6p28VtQt/U6F8QvjzKHlX+5ub/J4Nwm6s3X
         sV2aMo3CE3q7u2eKHrXkz95q+OvTvXDRrJayGedyEFdiZvcvZkltFOWPXA/O4ep9MhmO
         9mgufSZrvl4ai0/pfHI9OajVPoVmYTUPCjPPEPFW0Vl0KaC6dULchtHfJ7D/GoiMQJ6E
         srY1QVYDeSw8qr8KtJdpI/SAxXfAJbQhk20eaKdxRjcFl3HEGda6dIjiyYZXfMEVL504
         iGJw==
X-Forwarded-Encrypted: i=1; AKwUvBwJAqdpO1bTz6QiWt6r1C2/kjWcuz8ILUTLNEA5sz7NxzRhCq7DDHW7kAQ/KdVxY+Scq4T+9bh11bf7yw==@lists.linux.dev
X-Gm-Message-State: AFq9FYLrF8pSxCeUIVMW3/PGda66uc4neC9WwJOaEjBJW5T/TkyCRv+M
	DTtnFAlgJqopOOC5/NwJtXtPEAaz3S56xvLZ+tzxCSZzYfZ3PGkfkd7A
X-Gm-Gg: AYBFou3Md+yrquoZDyXCAji/in3jv93LTWTGTqs4RQf5tHmg9XOfh37kDxsBJk7Ugz5
	7RZ3XunU/b70jpY6XBDX0N0xVjIuZNALFtBvnXK4qeregmb5EKu+QoUQmRkLNmGmI3XteHGP/83
	TpL+a8AR+XHeehKvQyfxv5iGv3b3WrNltr9VgSeqfJ5Ds5DAq1e9tkmAXq80Jg2qEXxaR5IBxf3
	41+aoJNL3xFNTgjpj1L5uQhSMNKqLd1S8H3QZQms8buT6nmWIMDpb/0YWacRj5fF/Ra4xgy8YfU
	fOHwkoRWvp7xTSNkU/7KmKgWH0otImzO6C80SSHRPixilLe1kQizVLQ8ab7BlU5wKwO3Y14wPcB
	l5LWRMdsUi5n1E3aTfCc8as3h1x52JqeVqkbXxDO7pjoYCXdSso+0RwSk47Qm7Z+QgR5/3LgJ37
	BJOsP3rVJrSuw+nWhxe0pAfpvVfYkl+wFSmiMd4JT0saB03CYSn13Lrk9Y5ABHWEKY8mhRuSBh9
	M1eeaDH/l3whnfw9LovB498M6AlIbQfuy7uFNxKXPtDXc2CN72GX3iMlXcSpKi6LgcXsbclHhuI
	06XrK+1ADg1q/XBLQmCqQhyEU/1OkG+bVi4m5oyt3yFvtqMF8ypBGnURSXcfL0qikPD4twnljnf
	KvJmNZutDjSiKpaKjtersSu0h29uXMk1Ve3vlhQV4RBAcMA3eBfr8NbqiCopRb2bQVy02DUaYca
	wqUMU=
X-Received: by 2002:a05:6870:af4b:b0:467:e082:b93c with SMTP id 586e51a60fabf-4a83f053a93mr469646fac.2.1792798714477;
        Fri, 23 Oct 2026 16:38:34 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a843225d69sm284345fac.15.2026.10.23.16.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:38:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 17:38:21 -0600
Subject: [PATCH v3 2/9] dmaengine: sun6i: handle the last partial interrupt
 bank
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-2-ef1acb0be768@gmail.com>
References: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-0-ef1acb0be768@gmail.com>
In-Reply-To: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-0-ef1acb0be768@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, 
 Maxime Ripard <mripard@kernel.org>, Jens Kuske <jenskuske@gmail.com>, 
 Jean-Francois Moine <moinejf@free.fr>
Cc: Hongling Zeng <zenghongling@kylinos.cn>, 
 Chengfeng Ye <cyeaa@connect.ust.hk>, 
 Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, 
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

The number of physical channels need not be a multiple of the number
covered by an interrupt-status register. H3 has twelve channels and
eight channels per bank. Rounding down the number of banks leaves its
channels 8 through 11 without completion handling.

Round up the number of banks to visit, and stop processing the last bank
at num_pchans so unused status bits cannot index past the physical-channel
array. Use the controller's configured bank size for both limits and
the physical-channel index.

Fixes: f008db8c00c1 ("dmaengine: sun6i: Add support for Allwinner H3 (sun8i) variant")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260706065650.34B131F00A3A@smtp.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 9d94a37fcf10..3a6525dd3d32 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -587,12 +587,13 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 {
 	struct sun6i_dma_dev *sdev = dev_id;
+	u32 channels_per_reg = sdev->cfg->num_channels_per_reg;
 	struct sun6i_vchan *vchan;
 	struct sun6i_pchan *pchan;
 	int i, j, ret = IRQ_NONE;
 	u32 status;
 
-	for (i = 0; i < sdev->num_pchans / sdev->cfg->num_channels_per_reg; i++) {
+	for (i = 0; i < DIV_ROUND_UP(sdev->num_pchans, channels_per_reg); i++) {
 		status = sun6i_read_irq_stat(sdev, i);
 		if (!status)
 			continue;
@@ -602,8 +603,9 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 
 		sun6i_write_irq_stat(sdev, i, status);
 
-		for (j = 0; (j < sdev->cfg->num_channels_per_reg) && status; j++) {
-			pchan = sdev->pchans + i * sdev->cfg->num_channels_per_reg + j;
+		for (j = 0; status && j < channels_per_reg &&
+		     i * channels_per_reg + j < sdev->num_pchans; j++) {
+			pchan = sdev->pchans + i * channels_per_reg + j;
 			vchan = pchan->vchan;
 			if (vchan && (status & vchan->irq_type)) {
 				if (vchan->cyclic) {

-- 
2.53.0

