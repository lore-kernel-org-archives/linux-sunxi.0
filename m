Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D20C246781
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 00:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784681810; cv=none; b=p0nRKi8Is1I7lIpoWw3YWTkPxzsnIViLysU2fF8JZX1gseb62Bc3mFWF00wb8b3CrsyqD3Lb4R1pgFckNgc4nFd5VBxTVDpEOc9H4gwPQTJdMQTMw8yx2Ye6x7mLyjAm8XcngPy0bCSioMiMkELmlv9IPvKq9+zGctjbsxa+04s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784681810; c=relaxed/simple;
	bh=41yheuYTzflwsC9az/eVDNLUtGn/wFSKA6g0rPFhxGM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lcOVIfSqrN6gPtCsd9q/kpfcEmRmxrt1BI5gSfXXXIZ3UlMavZ1TVSpHtYhGpGXLQ+voM81vFog1ChHfLZ0RTmVYzHsrmrP2G0O0g4K9FTCr9jXu/zB7CWw9YHyubAYTkYrupG1nIXqoOxJrutfkAh4Mm7X+x3M21dSwhtyTHY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cT3rZXVt; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cT3rZXVt"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8ef7b7651ecso56643196d6.1
        for <linux-sunxi@lists.linux.dev>; Tue, 21 Jul 2026 17:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784681806; x=1785286606; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G3zas7MpBZKk+oDgMVzjx3UamWGdsP8MxVU5Ixr7UTA=;
        b=cT3rZXVtAgV6urCKwctsLpVRzNQYjEsDJapcryGiWgzBAEDEAi1UrmVM1z08lCZPou
         tHffDcF/KvzCEkEcF5W4dVf8EZJBdTk9i+aA+3Me5JUQ77D5HuCZf9qVAf50NdY+wjR4
         K/zvKc4goz06RAVRRxQS8xLxNdeHASU596zUOhacTM7oq9T1FHdf9SdD1hKEGx5Jp1GU
         yz89VQntSBTQn9J2W2kS+TcB1zKc7sQgV163a7gOQu19BQU9xUM+1PZ/0EJpY3vByx0i
         sp1cXbQ5ELZAbOItzfkSAucVXJQz4iBJ27zlheb8G1YdbuRlH2iv5WTOSiwITvks0rs1
         hgdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784681806; x=1785286606;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G3zas7MpBZKk+oDgMVzjx3UamWGdsP8MxVU5Ixr7UTA=;
        b=Yd+dfLdMygVRzYbM5AEV2PNkvCo0R19ayKMFrKKH4pL+5g8ABo5/ROfKHLlF7inyGA
         kyY/QFvrJWnCrIlZN5pn9+gtAZOssMBOdq7/rWElrC56fssC6JbqQWNvAPd4SDMFXI2K
         nA0YwXUthCE+dVdLrUiYhJYLkCGdhY+metHw5yKfckzk4bNqe2OLjZWwGbFLCyvsoN4S
         PxPON4KUystFx8W3V3GoI7RQQo3U/15NHkLFjiM6bCikwhiEqPIx7ofTjS0R9crFIv4w
         ZSpUX8rGLu0UMhln9pvc5FOgDiHK+KL9Odd43eKJ27vYAy8UNqI3z2Ky4pr7IL2DCcve
         Zm8A==
X-Forwarded-Encrypted: i=1; AHgh+RpYJoRjemh7As1GyCXtVCos0kenGDR1E5+yuip57K4/dlgtnD0GSZdfyDB2KjvF61gyyDwhpOcPySMYag==@lists.linux.dev
X-Gm-Message-State: AOJu0YyenBvs5iPI1v4ceenTXHr5mROtCSolzhICXfb4gb6AZUPfdDqV
	C6AEuq6F8j69O3TpvkN4dreI8rN9JKpIX00/v6J+jHrbBwihA+aSOj97
X-Gm-Gg: AR+sD12/7OFlau3sN75LnY3nnhvija0znDeaft12JJRm1xSD4PaUpygJOWHXjcKCbaJ
	1U2UI7KAjz0WPdnGJnrOfyl3uuPND9AotoPbHn1Ka3LUz0cG2wWhhBXPhaC2MzpV61MW08KR6+Z
	dzA8eIZH+1PhgrruiPRJ8G0qwfruL1xnzb9wVUnvjwx75NHD0BS0wGnhmV6L8aBxJAzZ1Hy1Ykm
	/nZC+H4s8DkvOnraRWnNfPZi8fbgEcQLosVGSeYwr9p+k2sUk1tCR78M8Vs/NL7iIxfEdctA7Ur
	37brLFCQvQVFbJI7+GqeJg1i+3LWRr7/pPtKIVXK/eUKEx9NyFp6j3uQIY4bIWJPppOjpWOKxR9
	u2rhkRRAKOFz5K/omqzfJGj5Q5F5jGCXLO1rT9VtCWZk3hU45yrGZeMPy+m2WdeyYf6PMbLYB4L
	uiJmmSkEiimW3VissydVXsfsM5vlIknWKd1bNl8R35XqyaJePJtGL8hQ==
X-Received: by 2002:ad4:4ee4:0:b0:8f2:22c8:e71b with SMTP id 6a1803df08f44-907b9bfed43mr25560426d6.24.1784681806174;
        Tue, 21 Jul 2026 17:56:46 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907baa27cfcsm8623966d6.44.2026.07.21.17.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 17:56:45 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: sunxi-ng: ccu_mp: fix clocks without P dividers
Date: Tue, 21 Jul 2026 20:56:43 -0400
Message-ID: <20260722005643.1208942-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some sunxi-ng MP clocks have an M divider but no P divider. The A523
MBUS, IOMMU and DRAM clocks use this layout and also require the update
bit when changing their rate.

ccu_mp_set_rate() unconditionally builds and applies a mask for the P
field. With a zero-width P field this produces an invalid GENMASK()
range and can clear bits outside a P divider, including the clock gate.

The callback also ignores CCU_FEATURE_UPDATE_BIT, so hardware that
requires the update bit may not latch the new divider value.

Only update the P field when it exists, and set CCU_SUNXI_UPDATE_BIT for
MP clocks carrying the feature. This matches the existing sunxi-ng div,
mux and gate helper behavior.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260712081341.9D1431F00A3D@smtp.kernel.org
Fixes: 6702d17f54a8 ("clk: sunxi-ng: a523: add video mod clocks")
Assisted-by: Codex:gpt-5
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
Based on clk-next 8cdeaa50eae8 (Linux 7.2-rc2).
Tested with strict checkpatch and an arm64 W=1 build of ccu_mp.o.
No hardware runtime claim is made.

 drivers/clk/sunxi-ng/ccu_mp.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_mp.c b/drivers/clk/sunxi-ng/ccu_mp.c
index 7cdb0eedc69b..aa6cb20447f1 100644
--- a/drivers/clk/sunxi-ng/ccu_mp.c
+++ b/drivers/clk/sunxi-ng/ccu_mp.c
@@ -237,12 +237,17 @@ static int ccu_mp_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	reg = readl(cmp->common.base + cmp->common.reg);
 	reg &= ~GENMASK(cmp->m.width + cmp->m.shift - 1, cmp->m.shift);
-	reg &= ~GENMASK(cmp->p.width + cmp->p.shift - 1, cmp->p.shift);
+	if (cmp->p.width)
+		reg &= ~GENMASK(cmp->p.width + cmp->p.shift - 1, cmp->p.shift);
+	if (cmp->common.features & CCU_FEATURE_UPDATE_BIT)
+		reg |= CCU_SUNXI_UPDATE_BIT;
 	reg |= (m - cmp->m.offset) << cmp->m.shift;
-	if (shift)
-		reg |= ilog2(p) << cmp->p.shift;
-	else
-		reg |= (p - cmp->p.offset) << cmp->p.shift;
+	if (cmp->p.width) {
+		if (shift)
+			reg |= ilog2(p) << cmp->p.shift;
+		else
+			reg |= (p - cmp->p.offset) << cmp->p.shift;
+	}
 
 	writel(reg, cmp->common.base + cmp->common.reg);
 
-- 
2.53.0
