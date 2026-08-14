Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A462A470433
	for <linux-sunxi@lists.linux.dev>; Fri, 14 Aug 2026 13:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786714185; cv=none; b=lfKlCNN8+WN/L5NK9bxVJi4XUQOl5HZ6crEFhZuE/exNxoCCkor5mBf1R1Gt7gCu/a3Qg4rZweooPhooPIaKpnXkNY9YNCrrgkfbwIaK5GgTEBBKXlad54sas86d9pNKk+ei0hzaSgx5Pger/s9mb8HNAscRdDIpSgIInrCxH2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786714185; c=relaxed/simple;
	bh=bAEWJXpWzPUhQYzyuDT8PPZLPevp6bNC7oyuUisHQ4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A98ozkWooj3ChWJRn2ctBGzdQ9p9XmiTaF0x5ozsqoYF1CbSv3iC7wcQ/Wo6xRYKPcnfZvABN64mGIbmcgDUW1x+a/dyj7Ab8KF6Q3TnReTlY5LR/mSVQCw37LT/eYEfVCTo6UlDEN0qLdyIqO5RWG+6ksQGYkV/sXryfrX5xMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=soundtrack.io; spf=pass smtp.mailfrom=soundtrack.io; dkim=pass (2048-bit key) header.d=soundtrack.io header.i=@soundtrack.io header.b=KNohES0o; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=soundtrack.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soundtrack.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soundtrack.io header.i=@soundtrack.io header.b="KNohES0o"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a18ef236ecso192401a12.2
        for <linux-sunxi@lists.linux.dev>; Fri, 14 Aug 2026 06:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soundtrack.io; s=google; t=1786714181; x=1787318981; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7YukWWHI9wYIN19FTJID+eUyg7sERpWkqr51k3rjwMM=;
        b=KNohES0oxsTcfNY3WWhM7ieB+U0bYRUTicPhmRsmZ30yiZMapVRgWOsO2xGWIBEylS
         IPbEF6BZKSYnpUEBu25GZ87wvd/VX/4t0bU09aQlz56Dh4V6Rw86b3pUwea+E7kXGDXh
         Ny2P40KAUvDwRBoTCEnkAlAaWTeKvOghPhLZGnDus1ypcDVOR591IvQISPj5p5i3VZdf
         LWvXbzMaqz4UwcKaP03BZJLXdK/TYLEtiJKPSv+WmkIlZUXvHfBvF84x3tUsrA5ZrpFD
         qDZ585My/3YS0uIK8jZc1EMJGPlmomUKq4mrBtbU/WQllg6aFcpousqTYy6DnwiHIUXy
         KotQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786714181; x=1787318981;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7YukWWHI9wYIN19FTJID+eUyg7sERpWkqr51k3rjwMM=;
        b=Ew1DScldqQbDlO2ssiGbMvHfbGIZ9iSzsOvXjCNnS7nrmEWj4EaJKtfG4QvHoolxDA
         7TuPNRMMIFmb0p7POEjFBDyMttrhBqftNLhcJ/Pm0O9HREK4AH7mC/HPN4syB1CkfzBg
         OzKnkQ2sYT3xGFToyS17t9q2fMAADLGbyxVLjcNpKBM/olTNIi4jnb77+S1KNTgya/FA
         dVpcCd7hRwGfnZ6LJOAGuA8oSCy5fWiktMWNymr7NfRs3gKlM+GMCWA208xSSjh5bERL
         mW6FMQlLxGdPnJoOy+hJzbLmRwsqKIpv8C8sAf3ryOcGKmcHsYGm3zKo0BW6XvoiknOc
         iY8A==
X-Forwarded-Encrypted: i=1; AHgh+RqUfwlt9MVhDp0pOFHuvd9fe+p2NiG6c3iHT2PSi/llNYR5OhzMbK99j/xKPD0gsh/TVFDKK6fFSx6hdg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwRBvfUsAZAl7FVJeRfkY8no0OucjVj0x1f0p9G7IdFJMi0OYVM
	yprFX1z8ULBvQry9ZTkdtj7DV6svpv4A+WAsdybB5zLrYq8/aYzKjcvw+cVEksME7/8=
X-Gm-Gg: AR+sD10RT+PEnlzY8DOTqmi0C9AMTBEwzFZAKpBfYIo93YJd3HS8Ceyq1sZQ3PCMs+m
	2553MFzVMp6hdpAdzT7GLxNmGI8p9ObTvjHtQhhigSEy0t0pbN0wSq7sSGrCz3Ao2nhUYX3CGg9
	HV98vG+N0ymWvEXgzC83HGYgpOfjWuKP7W/qj2zeIl55aAfFJiLzf1LzbXV7jduRMsJ7+NPGu4k
	W1SfO/jswGmIHGjZIMfFuiETCmYgyvkdGKskzqCZWMNxX6EaHt8KiFaJjYXkgqHAVTQeB1xN3nw
	cnOpivFhciqNIzukvcFNXnSz1XNS2LjKctDehZKogP8d+SLxwDtIBrNhnyvFlCyIpyYa2+soLmm
	ihqeOP/sQ7uXJ2E7iIQfMT114KgefyJ1FKQqDAlDV+RMdqXsMB43qgn4gsUGnTH7z51nxLx57ON
	g4YfWloqkRa01aWXp8k0QpH7V9wbaRo5E8Z91PQnCzgMJ6bZ2lswDn4kbEjoNa9hNDA0NGzGqxk
	PUegcZTEw6yeX4qmwvmIPJt0CICV25lx8F4J74JuIXOUz0DoAYMgWXVaQ==
X-Received: by 2002:a05:6402:1cc4:b0:6a1:d68:338a with SMTP id 4fb4d7f45d1cf-6a38a83ce95mr1450030a12.0.1786714180850;
        Fri, 14 Aug 2026 06:29:40 -0700 (PDT)
Received: from Christians-MBP (31-209-40-223.cust.bredband2.com. [31.209.40.223])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a38c9d5eb2sm841941a12.5.2026.08.14.06.29.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 14 Aug 2026 06:29:40 -0700 (PDT)
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
Subject: [PATCH 1/2] dmaengine: sun6i: fix non-atomic read of DMA position registers
Date: Fri, 14 Aug 2026 15:28:29 +0200
Message-ID: <20260814132906.70322-2-christian.lugnberg@soundtrack.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260814132906.70322-1-christian.lugnberg@soundtrack.io>
References: <20260814132906.70322-1-christian.lugnberg@soundtrack.io>
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

