Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AAF43E097
	for <linux-sunxi@lists.linux.dev>; Fri, 14 Aug 2026 14:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786717662; cv=none; b=XYjlPSxNRjxcRKMLwuAmo3D7OvP36S56ntK0tTTPY2mPOxeqkvGNPTQDTBNmkPT5lVdVXEjLJb5BHDTRGeNC+62jR+v4NqLYKBNFuh7on02htEslZaT6r4Xqg1feQzQ9I8P1eZ8nRPbUOVgizBV2axdzcOeKWRYgT3WXWATTfSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786717662; c=relaxed/simple;
	bh=bAEWJXpWzPUhQYzyuDT8PPZLPevp6bNC7oyuUisHQ4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ur6gQeVFXbO8G7gaRAnc2jLYrrbXBsEO/8JZdZL6oYIiCav4OmJ26ezCBKb5qsRKB9uSnW7CJOeHsCfOO/cVHY8GERy1VsUg42N7j8S1zkCyX3ZjKutOMuUZJcXMtOkOjSrQ3QM6umUZG0UzReqMEbKNO3LGchYt8GBRqmM97OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=soundtrack.io; spf=pass smtp.mailfrom=soundtrack.io; dkim=pass (2048-bit key) header.d=soundtrack.io header.i=@soundtrack.io header.b=mfrczNnO; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=soundtrack.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soundtrack.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soundtrack.io header.i=@soundtrack.io header.b="mfrczNnO"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a1f56768baso164979a12.0
        for <linux-sunxi@lists.linux.dev>; Fri, 14 Aug 2026 07:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soundtrack.io; s=google; t=1786717654; x=1787322454; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7YukWWHI9wYIN19FTJID+eUyg7sERpWkqr51k3rjwMM=;
        b=mfrczNnOSDlcJEGIzKTqO2RbAkPmFNx226wbryIipPRHilC5tZz9HM7NKhK2GEYD+E
         9GFN///s8GwNM3TVQ+4BcZ82Bx65BQvJi8QSpt6RMgAj/569XthoJ53KJTz9P16oaWs7
         f8EWTtb19sixhUcwOl6NQMIKsnYE8w5caqAq3ungtTilGq9n3FB4Y+j/gvU5Xz7kcn7M
         BIlN5fTv0Vl5E0zbdvAnqXuH4fCgtN2sGM/Mq9EfioLd4KmWJw8AFUNqM3VmV7vcIgta
         heYp8woRFVEHkA3o/sqSYKY9z13JByUGxPeC5QfCds45wxoWk9h9tM7lWXjxL21c1uzE
         uvCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786717654; x=1787322454;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7YukWWHI9wYIN19FTJID+eUyg7sERpWkqr51k3rjwMM=;
        b=DdXlPpm18xQvAJzDRk8MPmllB4Tikv+q4ZxC5d+Pb6qDqwr0hDfJlueKWYCLKWCKK+
         O/tXxL9mZq7REFaiRq4xMWe5J6MqiLsDuxaBnguH1z7ek9xK82vceeCesXnuU3vtFLbk
         naerCf3vzCI39d+iGjIsGcmCWjanBF5h+SLOPXCo+O46YBBBYk/X5uX3CshPLyGc5KIp
         Q4vqiN5LZbxkc3tYyN9onpvWBobs8paVt22icE5YJzjax+vpxgnZoWtlUq6AiWlkMVEL
         JVtkS+nSjjySJhBJpErayDyU9hi0IiJQP7YfF5DJId4pc9tdLqSAT7oj14Li8KTMtqgT
         4G6Q==
X-Forwarded-Encrypted: i=1; AHgh+RqctoUKoL0b8mSt5g9/959dIh+8Mi84/RX2i2Kcs1dnL1MGkEYXa+V5KsNhDA+mGXzVrNizb5ixk+UKmA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwA1zYNR8HTqUYgPigafgQFwLhoKHIFxrlqoWO216P6n+zLNGw5
	EMlT84x6KIDYrDVd3oxPI05Lw5OlfZf9jIba9h8qjeZxt+sWopDOonOkZp6+Ij4urSk=
X-Gm-Gg: AR+sD12JFHZXBcvrdmIR1EeA8EVIGck6Rl8ejGGGkbe3EdQSWhz4q6/slP071MmriEr
	aQUQgejnY2RIJx8YvWhhHuuvUQyYqdevLdr8uNN6Xu5gxPyDWmZVcYDRsj83wWkBztauC2RD+eI
	tUt8iLpnvMSObLzfh54/tQ1QYUWPCaa3xm6ZX00cL7prXnyulGP0eLfB1adY8l1wtzyJs0sbUi9
	QFfvmlZRmhB1fkG0ePvUd6zTrbuJjsjy3H8+cmq+ztPux3h4NA5ZgoLXz4yWrBxUHQKXMjx+nnY
	1d/H3N1zwMMVDyNY3Guhdd6QjWJaxVyV70OfSaGY+kXnGt0cL/I6kOWTYalkCCVdwerKhOsWO/R
	BC2bp3E+R8KdQ+ynfQ69sO6/Yn+oBf288UXBXJw8Thkh2adEQiVZxJ4tM42aPMQetUo6poPPGUr
	AU/y4orykLI4kxfUcren4IgqG46N5EbOCsI3ekehHz6yiWKLvojkkzwMrOZa2NXUq0/5eY7tfAl
	9TdZxDsSZ1fkKCqcz6fRwW4BigOyw+PKxxxlOhHMQCCnp8FPMfj/XznAA==
X-Received: by 2002:a05:6402:548d:b0:6a0:f1d5:deb8 with SMTP id 4fb4d7f45d1cf-6a38a83c619mr1585118a12.0.1786717653700;
        Fri, 14 Aug 2026 07:27:33 -0700 (PDT)
Received: from Christians-MBP (31-209-40-223.cust.bredband2.com. [31.209.40.223])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c21234c45ffsm106308866b.19.2026.08.14.07.27.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 14 Aug 2026 07:27:33 -0700 (PDT)
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
Subject: [PATCH v2 1/2] dmaengine: sun6i: fix non-atomic read of DMA position registers
Date: Fri, 14 Aug 2026 16:21:10 +0200
Message-ID: <20260814142708.79120-2-christian.lugnberg@soundtrack.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260814142708.79120-1-christian.lugnberg@soundtrack.io>
References: <20260814142708.79120-1-christian.lugnberg@soundtrack.io>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

For ALSA cyclic buffers the over-counted residue can reach the full buffer
size, causing the computed playback position to appear to jump backward to
near zero. The ALSA PCM core treats such a backward discontinuity in hw_ptr
as evidence that the buffer has underrun and declares an xrun.

On the Barix IPAM400 (Allwinner H3, kernel 6.12) this manifests as audible
glitches accompanied by spurious xrun log entries, confirmed by two
independent observations:

First, the ALSA buffer in the affected configuration is 2 seconds deep with
a 500 ms refill period (the interval at which the player software wakes up
to top up the buffer). For a real underrun to occur the player would have
to stall for the full 2 seconds without writing any audio — effectively
impossible under normal scheduling conditions. Yet xruns are observed
regularly.

Second, the underrun duration reported by the kernel at xrun time is
~30 µs, roughly one audio sample at 44100 Hz. A genuine drain of a 2
second buffer cannot resolve in 30 µs; only a phantom position jump
caused by a register read race can produce such a number.

Observed on a 44100 Hz stereo S16_LE stream:

  $ cat /proc/asound/Codec/pcm0p/sub0/status
  state: XRUN
  delay: 0
  avail: 88200
  avail_max: 22514

The avail_max of 22514 frames (511 ms) matches exactly one ALSA period —
the amount added by starting the LLI chain walk one entry too early.

The race window itself is narrow. Each DMA descriptor covers approximately
88 samples (~2 ms at 44100 Hz), so the engine advances to a new descriptor
roughly every 2 ms. The two readl() calls must straddle that exact boundary
for the corruption to occur, which explains why the bug is intermittent.

The bug is further confirmed by the xrun_debug bit 2 toggle (jiffies
position validation). With it enabled xruns cease immediately and do not
return; clearing it causes xruns to reappear within minutes. This on/off
reproducibility isolates the fault to the hw_ptr position reporting path;
the DMA engine itself is functioning correctly, as evidenced by hw_ptr
advancing at a steady 44100 frames/sec between events:

  $ echo 4 > /proc/asound/Codec/pcm0p/xrun_debug  # xruns stop
  $ echo 0 > /proc/asound/Codec/pcm0p/xrun_debug  # xruns return

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

