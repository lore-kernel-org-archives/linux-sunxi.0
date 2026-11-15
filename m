Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794735196;
	b=pUC1Ou2/6HFvUqxrtbQohcrgkJ3M6xVSbeZEkBFLPBpY1R5L0trwQQdRRFd1Evn0rJWr
	 FW0e7dX8tSnxdvkTRBM2JPpEc6xtf5Gmtuyb7eE12WRH6BS8dzc69Y28wpxb2RFFWxIVa
	 3HCY7z9D6jfhnrXvGqsqLNUDH6gmA7V79YFEB5Gc87ZnShAuZJZqIfTXPuHyTSig1HgsL
	 YgrqiMaEH1T/7EF+Wz7paVy1JcnkcouRFdJlkKwQ3zy00OJxmwKgv70G5DD+Mkik5Eh+Y
	 yRVZFKFRVN3LzD8WSH3KnPf9YW1FCQwSaGVhCsqIR0gSe4pTfu/jCKjfHMnY3cGRMww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794735196;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=w8G8ifHYAKfhALD5ae+dZe67OgXfj22iPEwtf7Dbt0k=;
	b=RMhAKmXI5ohz0TsqltheIQUis35qIEE+aD+nJIlD5xQdjOfci01l8whos1abIAYkMO35
	 yBCDMN1/2pP/bE06oyzAA95coem7OXZe+LKOpe18h5b3qJCVc05uSK8bTdKj7UDMYzpMH
	 H8GMtVObwaXEl77pt/L4pDbZt0sIH5b4nYzlf5qLPDzNtX6+i6+l/5+jie0OOTHjEKEtH
	 qQK/xm3yKxrGSCk+rikPmTDnL5tXaEWMLN+7f2mMe2dbG29CoYpWxlpNgH7ru6A8weRLo
	 Y3OtUdBW6O7+oul8vzMDg5Bvcmhv2kAkZS2t1E/QaEdBeGsJkvMLcq6T0PbgIKnUtFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S131ZIaZ;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DAE606A337
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 09:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26DAE606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S131ZIaZ
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-70b875f6f1fso2980225eaf.2
        for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 01:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794735195; x=1795339995; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w8G8ifHYAKfhALD5ae+dZe67OgXfj22iPEwtf7Dbt0k=;
        b=S131ZIaZ6mMQnADaKxWtZOqwPvRDBs7+NptMmrpTVyLOnbWVTXRJXvoEnPxCmHPTwz
         yYxYRsW103LEX/30F54l6T8dKj3nzyyPF+7uWa2I3XT8PU57qQIbgXP480M040mEshSj
         uVAcQAPumClQIUH4xXXCnW6tkDVQ+0Er0fW1PqkB+ZchOUF6+KJncMXf3nnppdtIjiBx
         7rE5UsfjtpRIgayukAw7zfhpnxIg6Q4vgW2vRUlL53Y4I6Vv0sl05mg9hYtxaSrZAMNJ
         7WXvbr8axeC0XF5350U5rhwrxFeiaopFD7ZK3WEQqackzzp8/68qb0LrkeDF/0Az3Xd7
         Zpfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794735195; x=1795339995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w8G8ifHYAKfhALD5ae+dZe67OgXfj22iPEwtf7Dbt0k=;
        b=sguCx3Ud3uzAMgNgiBbpULIcA8o/vASulBnFHW4qaFzPNBTisOVWj43B0Ftj5BxdVk
         ixbKoTeUetDF1OdZyENJe4dDMs4T4od3qtK/ItJp+eOQfWcanJKVdzYfikniHsnDD0An
         KKDRFMq7mj8CkJcZu/ft6OYe1SR/fYf5eSktYAzsFc6X56PTQa0EIkC/VuDU54MFBMCK
         4YhwqdFcfTwfqYmJ091FBL98HOQFNBwb0blK3wzaO47UisPw/5/qQOEX7hz7Thl3V8a7
         Mbbhn8vQ3Ue5zhdmUpALyfa4/cPX5jck0r0rOZ1NmruGtXmHamwMpSGocUBez21lpMoM
         Epsw==
X-Forwarded-Encrypted: i=1; AL+hErHRtCJNzLWIIbmEaxF3UJR/fAekHcuCLVM/DlEYEimAQVTCvAq/y8rJy15FeYomcGo/4Wu2OLpUSwgWcw==@lists.linux.dev
X-Gm-Message-State: APuU4Z96fDTthXThgIocdccEX/3QHm2yaRr4ajZ6RSROgeJ8cBwh+lhu
	jTSHVdKkD6qKXYPURIv+NM57gl4be8eRva0tHjaAecv0PSgddFjlsVUy
X-Gm-Gg: AYBFou2xkN0CWIvRnkeibapYa+lQa5BuTt9c9VYZTRe8op654wLd/KiQcxL7bn3w8Q3
	WGGbD9LXjOL5Mpchpk05K30mGI3fQorf/QU8YEMmw6NKHH2a+e9nv/cMSSrzo9ysaUMRD6ena4N
	FmoK7C3SL5ghdPNaLwvyP0a5o8FQvy7ptkJ/vr0dUiHQ71BVaEcG3TLEU1wVIcA3zFQKelM75BB
	+I3WLQ6mee6DRUPE9SSBv474mpUC+FgSISguzuX1ZVnVL45qfjUkxuxlnY4vbdqG4HmRLiP8hxW
	FUGsGjkEAT93eWllGbz3psx/bT/NSJsA60OHvT5kI4Mb0MDJqNDFeXhoeC64lx0IBfghtql3FVK
	3RcrHMx93N3HaRS67YwIj6AxrnFkPfplU2uR9Om8nwNtxIYDD6Nkv2BuwxUrVmQrhPH8jcHqF5Z
	teSCXlhtZlYVt7rGjoI182ybk9dvoMJGyOzNZE1lQ2Fa+oDagSyQYC6pfxg3P2khfx1IP0QX9dJ
	AeRFyAzH4g7x/s6H/uDyX/6bkbNkaqzNbDnw4WkvvqP2Bi+6cuEUvHhcinyY0BF9/ojAztBDqDH
	9Eh0QG3OQqTt8mrXGxBYHNWdTBRL/vks9tbpYZKHuOn49HyN+XjSvMF/VrXoM2HBQ4eUjdV8fzT
	N+42ba3S5e1y7FMSkOmcdCjamesZZCelo1bteY9Kzj05b2Gs0Ny2wbBHwYNfc2/M6ZzgFDnnXlM
	0HP6ZUW+vsQUVCPWXBRlVcONpuwHS234CS3GJuNtCq1OkZrQ1S78o=
X-Received: by 2002:a05:6820:4a8e:b0:71a:ecfc:4434 with SMTP id 006d021491bc7-71aecfc5888mr297943eaf.61.1794735195084;
        Sun, 15 Nov 2026 01:33:15 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab43347b9sm5933617eaf.12.2026.11.15.01.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:33:14 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 02:32:50 -0700
Subject: [PATCH v4 2/9] dmaengine: sun6i: handle the last partial interrupt
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
Message-Id: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-2-043cd476a45f@gmail.com>
References: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-0-043cd476a45f@gmail.com>
In-Reply-To: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-0-043cd476a45f@gmail.com>
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
 Sashiko <sashiko-bot@kernel.org>, Frank Li <Frank.Li@nxp.com>
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/sun6i-dma.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 885cb237b2b9..9533f3bdb949 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -589,12 +589,13 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
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
@@ -604,8 +605,9 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 
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

