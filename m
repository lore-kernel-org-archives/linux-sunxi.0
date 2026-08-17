Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AF944236B
	for <linux-sunxi@lists.linux.dev>; Mon, 17 Aug 2026 13:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786975057; cv=none; b=e+N4rHLM4QFaOSilPDJhfX7gpvjKRQRRzHx6WWJCSWzwpI3hoTkJI7/rMYPGr9wl5D0qjGV27V0/GfMuTNyCEbt7380CD4izYbvPJyf165qQ6JCFn1KdQO5TKz8KmwArcgP0vWqZDIrn8yfMNKBH4Y8/omIOXHJSEGabxQo2qC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786975057; c=relaxed/simple;
	bh=PZI7MMxmJVNzbmV5bnrz48F2Q3n5UxIGaRjcpiHxuHk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SmLgN4f7pzybew1P0xgeuMAk5bA4WNZLyGHoz6qA2SaMCyEzUUPZjuP3M8++ISVSg925uQADcONqQx3ENQK1L5ekKrycwysiHjUkfWqq629SqUcPy3YAI1ujmRnRpphR075BOlRb96+WMQQyhsR3Xo2fNGgCNDxayAldMavpN+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=soundtrack.io; spf=pass smtp.mailfrom=soundtrack.io; dkim=pass (2048-bit key) header.d=soundtrack.io header.i=@soundtrack.io header.b=MVnR707J; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=soundtrack.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soundtrack.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soundtrack.io header.i=@soundtrack.io header.b="MVnR707J"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a09571dd5cso445568a12.2
        for <linux-sunxi@lists.linux.dev>; Mon, 17 Aug 2026 06:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soundtrack.io; s=google; t=1786975054; x=1787579854; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WLmqosVfHRUnCpTXG/vmgJdRPIFeEEdEr21ji49UgUg=;
        b=MVnR707J1aV3fWedcS/xpbQlw8YfPcFKjKBChCWdk3W3eiYUkxXgQ6454Yrdog0orV
         dotANgFsgiQT3PXOunUoyu+2Ji2MuThIVouVMyHvU8O2ftV/q1saD7WDu8uKrz7f4zz5
         4Gfi0ykQCtBzt6GGNBtKpLF39xfQYmpgpgSsWeaOLEsZc8OyXxDIj/WU6HXKxvynUM9O
         oSpu57mW5/hwjufKjXEWGi+dn1XeOXYxihAoY7XGuV0hTmhje+vcfRQ0AZw0G4Yg6U3/
         LPF2FkRo8HLnn8UlZG9DZ7GHgJ3/Z6PHToQEqkkPrw+kJ0Dq2PF/8u6/ez6IMMjvO4PP
         ST4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786975054; x=1787579854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WLmqosVfHRUnCpTXG/vmgJdRPIFeEEdEr21ji49UgUg=;
        b=eTMdhWvMdbQAa/+YQi+Pa7/Or0e5YvrjL5X/4pziX6iswzb6ph2fneJP+I4OZE6oSW
         i3MnwRvWRO+WF9zEICkdBcFH9yFdIb5VasoG8gFlKscWVTqPrmk7S/EOZMdHJ+fqngsf
         MPwaILOV0jgWo2PsIy4iBcTmnDFS88+cKA0uZnnloPPA9FsMa3Y2dY5E1qj03fIT4hB8
         SCLdMbt+3vW9JUmvMNCIf7tsT3w5lOVJ7de2X76g1m+p49b09CkIatLtd2eO7n1/OktE
         /yqyfrtnnnqSrB7V3XDPi5gYRAZ40Q4OwV/K70V1VXb3V41Hp3vQRPVIivqFX0Hr5wis
         bskg==
X-Forwarded-Encrypted: i=1; AHgh+RrKLKLKZBkuy68oIHxNybSZ0Ag4ytMRMYWzwRqorxc33lghCsTpHbknbwSnSMHFeMYb3hH/nvj5E0n/eQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxiLsnbzjoSkjFhJpFqK0iu2pY/lbbruY3m1JFzMhgJEl+DlGt9
	jVZXUs7sWsW1r8ugJzRm/mvSyPGvGbx8ridakITe9zBZefDhtlGF/Ja7L6nEIZjHnin5RQMWz7+
	3KpWU5Pw=
X-Gm-Gg: AR+sD13PqZbJw5uvi1uk0AhY8kDbMoKUzXwt7IpR8wiUkwaRZdDOCSAiwclyB0cMfRf
	7pNhgzf2LY5nZRCgnCrV1UPweJ0irx8dZ+QOBxtJ5sZMsH0tHYn1wMFZqGs7lkyjufOR5g1hf+i
	ar+XNNlZoHtGxqk60ZC128xm3dENF6W1tefjOXbzMm9EDgTYE7NuuneLKrLBmNTyA4OWhM+h5Mc
	yrJeH1Entd3GtF9atFQRTCiRNjHk3v3Waqn8Orpq3SVO00y33CPi3ZrEF9kSj/jJdyUQeZN9RFn
	mYRXfSU9cI8zxI9K//vQ0pdRH0yIPK25glGzlo+djdQ6xsI1Ypnlg4H2SnOPPTduWBBYXavKzcX
	t9if4Tk8spSGiLOSf6H189u7i9ump2Dx5UUODPsaF24Tm4Wdc6a0gIpEhhTds+4fp196Hq44kjv
	qTjMzSor+NaTI92MqfIQ8fE6JD3gA+Xy2g5zedNBhXwgy8N6C9WhDfSxWyeh0c63I6UxL9kK/kl
	daeCR3lwluCZy2FhY6+30F2uDKFV4OqoJctVGxd0M6ncGUmUbLJvGHNSY8=
X-Received: by 2002:a05:6402:234b:b0:6a3:68c2:9a9e with SMTP id 4fb4d7f45d1cf-6a38a845a42mr7135042a12.0.1786975054047;
        Mon, 17 Aug 2026 06:57:34 -0700 (PDT)
Received: from Mac.localdomain (31-209-40-223.cust.bredband2.com. [31.209.40.223])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d85319b1sm810238a12.13.2026.08.17.06.57.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 17 Aug 2026 06:57:33 -0700 (PDT)
From: Christian Lugnberg <christian.lugnberg@soundtrack.io>
To: vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Christian Lugnberg <christian.lugnberg@soundtrack.io>,
	stable@vger.kernel.org
Subject: [PATCH v3 1/2] dmaengine: sun6i: fix non-atomic read of DMA position registers
Date: Mon, 17 Aug 2026 15:51:22 +0200
Message-ID: <20260817135723.12807-2-christian.lugnberg@soundtrack.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260817135723.12807-1-christian.lugnberg@soundtrack.io>
References: <20260817135723.12807-1-christian.lugnberg@soundtrack.io>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sun6i_get_chan_size() reads DMA_CHAN_LLI_ADDR and DMA_CHAN_CUR_CNT in two
separate readl() calls with no synchronisation between them:

    pos   = readl(pchan->base + DMA_CHAN_LLI_ADDR);
    bytes = readl(pchan->base + DMA_CHAN_CUR_CNT);

DMA_CHAN_LLI_ADDR holds the physical address of the *next* descriptor the
engine will load once the current one completes. DMA_CHAN_CUR_CNT holds the
remaining byte count for the *current* descriptor. If the DMA engine
advances to the next LLI entry between the two reads, pos becomes stale: it
still points to what was the next descriptor at the time of the first read,
but that descriptor is now the current one and CUR_CNT reflects its initial
(full) byte count. The subsequent virtual-chain walk starts one entry too
early and accumulates an extra full period's worth of bytes into the
residue estimate.

Fix this by re-reading DMA_CHAN_LLI_ADDR after DMA_CHAN_CUR_CNT and
retrying if the value changed. This double-read pattern guarantees that
both registers were sampled during the same descriptor interval. The cost
is at most one extra readl() pair per call in the racy case, which occurs
only at descriptor boundaries (~every 2 ms) and is negligible.

Fixes: a90e173f3faf ("dmaengine: sun6i: Add cyclic capability")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Christian Lugnberg <christian.lugnberg@soundtrack.io>
---
 drivers/dma/sun6i-dma.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index f47a326dd7ff..04fe1f5042e9 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -354,8 +354,10 @@ static size_t sun6i_get_chan_size(struct sun6i_pchan *pchan)
 	size_t bytes;
 	dma_addr_t pos;
 
-	pos = readl(pchan->base + DMA_CHAN_LLI_ADDR);
-	bytes = readl(pchan->base + DMA_CHAN_CUR_CNT);
+	do {
+		pos = readl(pchan->base + DMA_CHAN_LLI_ADDR);
+		bytes = readl(pchan->base + DMA_CHAN_CUR_CNT);
+	} while (pos != readl(pchan->base + DMA_CHAN_LLI_ADDR));
 
 	if (pos == LLI_LAST_ITEM)
 		return bytes;
-- 
2.54.0 (Apple Git-156)

