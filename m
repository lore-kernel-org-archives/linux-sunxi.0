Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725300;
	b=sEgQcTNeErCA88zXdTPGaZQmIoPLISvyPvkA/83jbgG2hKcKXN0N8pWpXT9IHzZX9erA
	 eKUQXh5e+4ptXpoc5mjL7/Y/PDLQjbpwO6V3sgY5F5VMFz1sx+vx+7IlRaG8qIl+t014M
	 EfUOm7RRuFd8eCviLVCYW/XZUtnA2M2kwYRz0tnI5ITxJWUEAcULXFvhDLcVu/z4wg1P2
	 l97G0ohfJg5XNnT/bEn0DMeh7bHC6LO2+IQJjc2j2AKhlgp9fPeWYRvX91pcZfRy6dv/o
	 aqwdI3DeaTFvY0R5+FRhUe8iBWXk67Pg3TkYYqbEpW3+mr/lmAS2cvA0c96qpiIkI/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725300;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Yi+Mby52IcSMxw6Bb+wKdKUkb+i4YW8eVg++kxowvr0=;
	b=umEi8RkmlRDBUAj9Uy40OPkn7wLiBPbiYtJ5vdeMwU1MY61YRDJOnwMfja0NGRq4PRIq
	 n/ifL/8euO6Qra6diVRpCZDsTfX4mwoXcvccO0fVjYiiJXCWNqQmO7e2j53/Osq18036+
	 Wsi1tFLezIq5Hlmm5QIJoLq/jsA/P7awAvcUStJCesJeqSWUhK3aVVLQ+YvowONK7R3U/
	 k/jmk/WsDRevzM/N7+mGNFjDINIbKemxgpLdAZCnUzgZbB3tYIWEF3h4478SI5CjfLR+y
	 egk6xeP3LpHYuq2kii/GCse28dq5PxHsoiXaHnuphljiQFUbw38Vi/DmBsvS7uaWUpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GrICQroD;
	arc=none smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B6A606A329
	for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 03:14:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6B6A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GrICQroD
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6f5a0893610so300059eaf.1
        for <linux-sunxi@lists.linux.dev>; Thu, 22 Oct 2026 20:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792725299; x=1793330099; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yi+Mby52IcSMxw6Bb+wKdKUkb+i4YW8eVg++kxowvr0=;
        b=GrICQroD7U7YTT0gv+D+LKbHtU/RXTeTDCppM/RdhglLvw1Pa0WcjMkl5aRMnWaGsp
         I1nnFKJRoENCmDVE5UOxIpK0+jTabLr1JjKI5xFPMqBd5BKulllX2jS7NgIf3Hf7W4Nw
         O3dxDDI2Q/svTRFxlwuE/sIL5H1XIqte2T7LVxFMvqOAgtG9DY49bWq3K6+RyU/38O7d
         4tJwtXjBIOEcpkKjTuFS0PAUx1qxcj78QChDIeE9gbeS7bDg2udMMBFbk/cymH/jhBPN
         iMbpVhaLUjrSX3V/KwxR4XI0LQs8qAfAx1JbEu925rXu6criUND1W5PlJzE4qk3B8X2/
         9JSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792725299; x=1793330099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yi+Mby52IcSMxw6Bb+wKdKUkb+i4YW8eVg++kxowvr0=;
        b=ZZEVeJYpO7CcnUBOPHRkYxHymcl7uQyCSB30r5nIp9BLKSpP5DuMDbtz7YsAdcJYHt
         oBWxGgORD1sMX9VwgdqL0WnL6Is1veK1HR87jlRAsHzSgONnZ0Q92TQlU+zlH4Fyuduz
         suDUK/d3wPUW88fc7AtmCuyxJITgUe1BnB/DJhyU2Lg2Gm3rE9ElBkvZqdZjyX+Vhevm
         D0oe7ctPII1/+yQ8RXBi1WZpazITirSdYVnT0KS3w3+PSoG770QOxX1nWjg9pSK54ixb
         QQJJKY0CSGAK3Z1/aOuzdVeNS0ljVY+aIr+FV/JHKsbC0Qe1VdirTpENVGkTB9ACf1FC
         YGvA==
X-Forwarded-Encrypted: i=1; AKwUvBxS/rIvNXiWvMdhCcIB+7nX7kP0/WG7nksrCvVPqlB1bBrGchwNW5I/Gafscl+5/5qDjJlfHeUEow8qrg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJQK+mfv7ZUXsV5qXA+6uDV3vdS11xOxPOZUMHaZPvx3wfId5jm
	dQRMIZixDmlJGIAgRAzBDPJvkwK22rwXfOlrCChtJBTVJsCQmmaGJSzy
X-Gm-Gg: AYBFou1/+9dVqyqIon7SMcYoX4WTYXIlWNt3KBfJQp7q5IM4dHjYnfeBCaOZnLCTasP
	ByaaYzBTylDJDOBXE0/Kf+Lg1pLzrB+YGcRZhey3v+DDp3cA009Z2z3R5RboppzPoLAij4iaL+F
	bWd25qxVkPWxFnp1D35rAY2ji7D/cWo3IbDm9TjbnvO3A8JdM/zUx7yGlaQOM7w1Efc8iz7qfOH
	n9ulsX80StpjTK9BSqQ0VMEi98VF28KTG9SdG4lz/TzPfUgkx4VwSlGwvfV5nWtRxESUpVUTteQ
	aoc2cnNmajGCxJaC9tiAreROwgJoAtMhBXwJRSuf00+7MUFLMvgaNXqTcJea+cc/U2bIvqnWnu6
	b9BzhyHoTZdlI4M8j8Yaes5fGvuXzDTOlOxogVfqrLf41yZQVx6kwaeQ6WXaDVTfoliMQAQEquc
	AFOJmiDZ4Anoo2VxUrNmb4eIgWYRfHbPJuO2gRXabwAejmn4dqEHt6F4qsFzKCRHc0S6mlOkgBM
	xrGoFgQIVQ0w1M2OOPzR1iFkPmnbxIeyDOkuMsu6FIpFXruDiU1KIUSIzbsSolQ8+BHhpfUiavf
	zVG+PoiMLxSQDYaPof7274RldD/f7/6RfqB0r3VV0RSEquEbqcpNJuGR8u65AC6NHqWWZmgDSuQ
	PYAVgErOR1e4NhR1JSA81DTlpHdj4oVQYhHtGZNUTaOmOFfjDgCwys3ntQH0kKNyciFBJbR54Lg
	UnqtMr
X-Received: by 2002:a05:6820:a013:b0:6c1:f38e:7053 with SMTP id 006d021491bc7-70b8880e70cmr711138eaf.3.1792725298780;
        Thu, 22 Oct 2026 20:14:58 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84fbda584d9sm938638a34.13.2026.10.22.20.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 20:14:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 21:14:52 -0600
Subject: [PATCH 1/6] dmaengine: sun6i: fix physical channel index in
 interrupt handler
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
Message-Id: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-1-01085f684c9f@gmail.com>
References: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-0-01085f684c9f@gmail.com>
In-Reply-To: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-0-01085f684c9f@gmail.com>
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
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2

From: Hongling Zeng <zenghongling@kylinos.cn>

The interrupt handler iterates over register banks in the outer loop,
but the physical channel lookup uses only the inner loop index. It
therefore handles every bank as if it belonged to the first channels.

For controllers with eight channels per bank, interrupts from channels
8 and above are routed to channels 0-7. On A733, each bank covers one
channel, so every interrupt is routed to channel 0. This can falsely
complete descriptors for unrelated channels and corrupt their data.

Use the absolute channel index, calculated from the bank number and the
controller's configured number of channels per bank.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Cc: stable@vger.kernel.org
Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
[james: use the configured bank size and describe the A733 case]
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 8752969366ff..9d94a37fcf10 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -603,7 +603,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 		sun6i_write_irq_stat(sdev, i, status);
 
 		for (j = 0; (j < sdev->cfg->num_channels_per_reg) && status; j++) {
-			pchan = sdev->pchans + j;
+			pchan = sdev->pchans + i * sdev->cfg->num_channels_per_reg + j;
 			vchan = pchan->vchan;
 			if (vchan && (status & vchan->irq_type)) {
 				if (vchan->cyclic) {

-- 
2.53.0

