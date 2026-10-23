Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792780965;
	b=z9x+exk5smkrbLF13HHKKrlzGV6/W5JGE3UAoFRykk+TSEtMGj/GN5rs+rSxcdG0H8zo
	 kWc/DnsPgqvXPyUwXeNXtEQhHe3dDkZdDIH0uv7sxxBvaU7EzydPrA65AATmLT5o34kbp
	 /fAXahpiRFDGULcsToOfJ/ircPpsDWcn0seofQTHXfP7lEOT1Ut7s8kUrtWDCUYNqxV0S
	 parqlbKShOwGPN2aA16yxHFw59A7+00Ia7FiWAx2MLCbgKj/DOY4yiJpUPJQTEhrtgOox
	 YvxkpDCbDkL6x2QebqJJfcdXwAYOlhOveEQOpSG92+Iu8P7TJN9o/Ud37RqrpSFHITw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792780965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Yi+Mby52IcSMxw6Bb+wKdKUkb+i4YW8eVg++kxowvr0=;
	b=UaNgtQCXMCpf4tqGIcDN6815Vd1avMdokOvvvi8y07BQBapAg7319gvgAmxVMuu2Zmc4
	 bkbhLBATELBRRglVvcntq7pKr6gmt9fdmzOs1UFopEqDd1ruSjoyYBg3W4f+XUUuwfAeI
	 aq6ysna45ev63CLvoWTKpDLlLDzdINWq47kiCn30MsCmZptI0E+TIDgFH1sA7W+M1tLs2
	 PO3vG8EpEzZfNMnDPHzOR2HCv4a+RvqxItpVdCXsIPl2w1oFVBUp1IFdw1dx+zde5CIlM
	 ssVwhzbQVCOWngEYqyggW6WTCGnUZGeQ8tkTtC4/STAGkr3exipTbcGoLnhBeCUNAWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lxuKGAZj;
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DC6606A325
	for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 18:42:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5DC6606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lxuKGAZj
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-847ac7ccd85so736859a34.3
        for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 11:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792780964; x=1793385764; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yi+Mby52IcSMxw6Bb+wKdKUkb+i4YW8eVg++kxowvr0=;
        b=lxuKGAZjzNzYQNOTUDNSscESM1RYZ6xzs6V6opZcchEptyyNBUWX3/wXMUP4EWUybb
         UYadYjUzok5TQnfVnQfvDQ02W0kLXU64Hsvmt1VSyTiY8Le8uBw1986JmNaEO5WYT1Uq
         VwNu85rtnPNUjj/eoMgZqg6nse0kTcOtD1gI5az7zktrRctesGYkeUueHoIR9Ql5FTDb
         JMYunq5v5R92y7oawKisCMIHo2lhctU5iUu8xpSHh6axjTZX1DchEtAaECXcNcAyFnOY
         Bj1wmKCOsjP5dbOV7JytSwL9CvshE/wHjFDOM1v17hpmDeZ5w64I1nxYiFADAlIImw4d
         IUUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792780964; x=1793385764;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yi+Mby52IcSMxw6Bb+wKdKUkb+i4YW8eVg++kxowvr0=;
        b=qoXgfTzb9PEx2+izy00AyzJvUoXsqF0DxuG3VXFOTLY/GdHyC2e4ZLRzkm3FRKF98U
         bIY7zp0nKWbR/k9CpshwnV0yfIm7PMypzIWxmJzRFhmz1NzO2zDb+YDgiehXsSHTV3Aj
         iXzdfZZbxAbMtrW6lzWC5LlRzyn4pfEPdTgHL532j3l8WtuuFf6+avOPAncnmbJnpDeZ
         cC9nJveEPHDrP8DCqF93hiyPV/p+oLGI6r+SycohxXXKEsRb3O5YThD2S8+VQzllY4aW
         9P7yoMM2sUyXMAxOH7wRXDpEVfX2X5P7FkXbt/s/P4Qy2wcxL3tIalZyQq+ygmKe9Jrx
         W1gA==
X-Forwarded-Encrypted: i=1; AKwUvBydpiEVVCLX/+CSImLWycsRHNMAhq2Rp+z23FbUQ+TUSlrTdAER3qWMrBPa/6REEo7o6TB41aSXY2D1GQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYJeekEpI2y9OC37GH+jNf/9vpBFYFP0/1f0IZhwqhB+0sgjZqf0
	2pSydhHGGSf8sNHumeMTRIwxTZnsh7wdvEkHDaHKZrH/STlsork2MLmA
X-Gm-Gg: AYBFou3docYRaOTUPWLjLEjfq46eMMr2qvDtl548UtaU7hsDHKQvEmEFOKVkaiwDGuf
	uVIV73OPZ8B49uObxf0VYBmd8AKhQMnnXSXsgEXpZSpL5ZUCDPVlIuES5BPtSzO035Wa3Rpm8vZ
	ob5Iqy+UkHuvoyISnvMJ6WM+TA5i2brGiAljd1U2emzTOT9TakZx9WoPpj1vonTtQGHah4SNNa7
	Q1q4rPHViIGV0tVMmG+A0Dfc0QC3tjSSs0PILKj9lmHrQ2ebtAvEB2hp+8rPnufIP+l0cmSaEHR
	ynme2haZC0heuKYUGqaHMcZxvvfvzdipNo7W/3jMY94NFwGXX9LIx5XaUBX+WsQyAFSHNhSkMqs
	kEDW7LSwG8m6y1KMsyqQR6nCi5DjUtqdXNPFYVy+bFHwYIwrOr8lMpInE869/MCbe9TtEwsjWmn
	EdG1tWje8F6ymKdWMSzVp8cIRnAZGx9tkvaj9ki5O/R3EkERWpwdSgsDSCdXhJ6HhwdugNhdD0p
	7NY+8UeTG7c5urTKswfEtkWIAM1BifMRZFVA9c+W+polvydTTC6iQciMWRlCuby7WW7bRo5LY7I
	MEHXk5eaI6cyrYutn5dcwzQokCGYGjNWpIL5qmYHFAuHcuMAWGjGKfAe4+pUM3FlQWKwJ349SvA
	uYitkIMD29C/U8bS55NU0XKs48p1HwSDY4v0ItuZIcoNWh292f7Ec1+8atQXsolqw0N/rHwkS7f
	h36Q==
X-Received: by 2002:a05:6808:30a3:b0:4cb:818f:d56e with SMTP id 5614622812f47-55c0020ff8amr68675b6e.22.1792780963715;
        Fri, 23 Oct 2026 11:42:43 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55bfe199544sm336682b6e.13.2026.10.23.11.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 11:42:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 12:42:35 -0600
Subject: [PATCH v2 1/6] dmaengine: sun6i: fix physical channel index in
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
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-1-c9e07cc44bf8@gmail.com>
References: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com>
In-Reply-To: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com>
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

