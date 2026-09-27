Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339B73AA1B0
	for <linux-sunxi@lists.linux.dev>; Sun, 27 Sep 2026 02:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790477809; cv=none; b=ptD4gtCExngFHhxSGuILRP30frZyNzgWWTEppwYIYbzUeGP3pC8YjSXxip2UeLX1RKOK8mxlrFuUHe6KyfS1POOBw102ubmHWfIgM4h5CO+zcxUCQiD3Chcjn8QQg+fdAR2/w5LOWKMtcabUoWEg+O1R1u220RAuLcnRosNteok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790477809; c=relaxed/simple;
	bh=GNujY27sJq1QrMAiEnc4wu/PVjXA/qEQR0U1YSIve0E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BjFVaiuog0s2dKZkI8ybzXGRbPXtMr8Go2Fn1E8SppUmD2fKBUMcFEWnGijnJH6trDkcUR8PAoZ57D5NNif5+/jBuNXL9fsQYHFhU/RzeNwlmJvLnUZie9C2qwfbz1EKdc1CTCLMOwvPmRAEDFCqc6Jdm4ypE44xL7qxtPFbZo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog; spf=pass smtp.mailfrom=embeddedlinux.blog; dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b=sQjDUFns; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b="sQjDUFns"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2df4aa80a73so11348575ad.3
        for <linux-sunxi@lists.linux.dev>; Sat, 26 Sep 2026 19:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=embeddedlinux.blog; s=google; t=1790477807; x=1791082607; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W0OAcRU9c9mu0nqvpBUc1aIVBrp3XjCBrBUSr/EQyOo=;
        b=sQjDUFnsjpzCFyfoqwBqqbAdYGFzxlHpCrIZF8U9/GlUSYKufXm/+1D+qu7VG2XSkJ
         lP3xf/QLaahu295yJZlrRckraHgbZqH9ajor0sxQgCVB1zv+LoCS5l17Yvx9scwzqjTa
         WMn0hITZChzN4g35ltz9mtUgu1E7d/ikfOCPUK9T7aYLpm4dZ58LgZHfEBTzS2/+tH8d
         OFzzRZaxz+qvwr5EqyGbRqBB8y4PvOFRmuToQfGX86XBUdv1+nUmazNfmQ/YRiGL5m+p
         L15I+m97g45ObryL5h7GHY2ysNAxe+TULmdDKIF9D+91+pyPyYcjplFcq0HKKCY7gmb/
         JapQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790477807; x=1791082607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W0OAcRU9c9mu0nqvpBUc1aIVBrp3XjCBrBUSr/EQyOo=;
        b=mdpLQmgre9fKyz2bmE5jfv25285GJ7yz+TizzDH2XRyqzoqKa9MxCxffO0l/8ec1Ot
         g7OK3cFR0nAam0+Wc+N4bKeSIsI7Vg/thNyOJxFX5ekxYS3QwyH7NIwWJpD1oJ5zR/j+
         5vOpjdGEsPSh9m7T9ItlDd0CTOn4h2/4HdIR0oAjEnBl4VM06cQqD7HH/mIYD+KnUbyN
         SzZfV0RFNM15sVSeTjY7e8bszvQNnd+k+Sy+MkA0Owuz0O17Ahuy7n9HnK86bvXFpoh3
         LBZKVzIKVizcFqbNKC2x23yYaebOBD2r/KG59DzSTBnY02lZQdDLglCFBLpUQazt0qVH
         Fnow==
X-Forwarded-Encrypted: i=1; AKwUvBzAv1OniJ57xu8NRLyKTMLdR31IlTR10gdQMZVSkIA2wXfsvULrT5JIDkW2qSa/CHRVEdr3fkUvOthzbA==@lists.linux.dev
X-Gm-Message-State: AFq9FYKZXlcbnKbz/8JYvydR1rANDZo/EL3DNNCEBnQieQHEaXF+m4xa
	pjdPabhnB8DlSKnZKkx73EONzJorAhNcba+na8L97SOAp2DM9scEuO5gpaNH8s5QHwO5
X-Gm-Gg: AYBFou3Yw31S1iZxtqwJoKJ96MMw3PP1dw8JzR8ouoPBnBpwv2868PHmYDNb10VBmga
	vJZWtMzrmtErH8EGO7QJtTXP5xCPYC0jorP844bLav8KWBBDaA37aPKe8VlbbzSnfkAbU1D8vkn
	rRz4tti7XxovcxOsYR/efnevZtoFZKghgUp8oOmXguV8aQAFcEQXgZ1aWEiGcdHOgcJWS5Rn0l6
	4XlZQakCihMzSIdPxgpLp4gKioBzXQnhE+TvlXZLBvM5355p8kUS8zswdDYO++lgzn58Dottvw6
	7yiRJ2K1oClOzzq9xB8pWAcUKJNqhmuRubVE03TWVzB6aTUFBaYrD6qC/OEH8QJ3ZDGoK1g2QS5
	oM9a3pPtbK+fPED/clTshWZ9tz84CZnXGhlqcra4xA5n9PXZpYrZd6pFPmLWAH7CE10K7t/sQVS
	8n1QIQ4gVoh9L/HrUJv/5tH6lvJjN92Goo/qEfgrYMx8De8jzRorAE72XCy6Tdz3pooQ==
X-Received: by 2002:a17:903:228c:b0:2dd:ad73:c982 with SMTP id d9443c01a7336-2df7dc41d3cmr92788095ad.26.1790477807346;
        Sat, 26 Sep 2026 19:56:47 -0700 (PDT)
Received: from ltu.. ([171.245.4.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142bfd4sm25512285ad.52.2026.09.26.19.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 19:56:46 -0700 (PDT)
From: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andre Przywara <andre.przywara@arm.com>,
	Bastian Germann <bage@debian.org>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tien.nguyenminh@embeddedlinux.blog
Subject: [PATCH 2/3] dt-bindings: hwlock: sun6i: Add compatible for Allwinner D1
Date: Sun, 27 Sep 2026 09:56:25 +0700
Message-Id: <20260927025626.69614-3-tien.nguyenminh@embeddedlinux.blog>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
References: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The D1 and T113 have a hardware spinlock with the register layout the
sun6i driver handles. Add a compatible for it, with the A31 one as
fallback.

Signed-off-by: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
---
 .../bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml    | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
index 584cce3211..13f9a20ae1 100644
--- a/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
+++ b/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
@@ -15,7 +15,12 @@ description:
 
 properties:
   compatible:
-    const: allwinner,sun6i-a31-hwspinlock
+    oneOf:
+      - const: allwinner,sun6i-a31-hwspinlock
+      - items:
+          - enum:
+              - allwinner,sun20i-d1-hwspinlock
+          - const: allwinner,sun6i-a31-hwspinlock
 
   reg:
     maxItems: 1
-- 
2.34.1

