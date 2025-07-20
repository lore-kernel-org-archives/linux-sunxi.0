Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AA51E32A2
	for <linux-sunxi@lists.linux.dev>; Sun, 20 Jul 2025 08:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753001477; cv=none; b=M25E5A7KJJc5/JuiVx9YXMNCZ3xtEfAzcuzoe/Q53us2Ge2PNUIZDe2Botlb+vE5wKB1HIqJ+3ci7wY6vQa+AT4fwo2dYqE3mMg1dD1HgGQ8OZncYNEAeX0UJstdA43LbwQcvpWI7WdS0RhtDXC3Ec0CcNeSruy9mP2dDVDKOQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753001477; c=relaxed/simple;
	bh=dOz/O+Fmr0MrO8uf6IeSnuEwB6n0QZHNUM7Aubvi7Ug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aIR7yyFfsZjYCzSMW6WbehAU/wnRije48wFEMrZgkyPJrAd6jIMQoFUP9H37NbZmJwQXthukG6SePMfOLkYY+s2z9MrThlhRhqrh3QvTdiOjt/ZPLfWZmtSOQihFfvxcL+C80lfY6Gvl/LFjlzN7Yn6nYUSU7r/xi4eGEvXKBnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=KwIyqXfo; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=G0rpmCGt; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="KwIyqXfo";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="G0rpmCGt"
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id E7E3C1D00121;
	Sun, 20 Jul 2025 04:51:14 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Sun, 20 Jul 2025 04:51:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1753001474; x=
	1753087874; bh=/BGi5ucU1o2+iAEAe5eZtkdao45tn34zo5WJJl1KkNs=; b=K
	wIyqXfoPvyrZVS1a68agipuehvKjP9dJT+pqqP+FM3bwve61xU2PqqiSIaLQpp11
	2zpkM1oOFAMhpCGIbiecOZ0sh758BG5BZrfv1oSQafYdmqwSlK1f6YHYrDcISAVF
	ZWe2nrQncnCSRO2fO7qqHQl4OHxrWvBeH9xDXsz4jgWCBQJZEHeitShGngNvOfO0
	zUOplTIpgAXfH/HPnmnnuPeZAeL5juHIeYegBU8hNqMYFaV1OaClHHUrYi+k1KR0
	Gj8BqjuNsEjZG9zaickeL6O2d+NlNKLyPGvmObsBad1IMKEhyqLE3fNSo0GPfP23
	/9C2lQc8xbFSzXMxUClKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1753001474; x=1753087874; bh=/
	BGi5ucU1o2+iAEAe5eZtkdao45tn34zo5WJJl1KkNs=; b=G0rpmCGtIxqM+R1Uj
	mSugcY9gDpNbp1nd8qK7ia0a5leAZcWZ8kl5j0i7Lqxd3TMj6XkVH9D9yEoGz97O
	XaW6IXwtj+Hes4cGQfqBhk3CuOfwNmdgvRJD0BG4wRK6vruBJe9jvs0dnm1p2sZH
	tVCYuzZNPckRGLu47e0olPYl0LZMS+DsqxwegtmMgxp2Mazif0sMYQ/LUAt3t6LF
	DoBR7EKlCi/Q/GvG+Skl9hn+LxbObjosroLNi4vEvS6kubWglfQuQWFV9khHfums
	FeYxymgF67qU0D6EvlPer2CKLZjqXEJfvYx7u++Th6/iaolGfljZ6L8F7RKjkKgX
	iZpSA==
X-ME-Sender: <xms:Aa58aLXs4agY2z3zt3Q5FF9PkqcJTnjPkg3xWiSnkNJRhnw9mLGbIw>
    <xme:Aa58aLI2SmZzGR-GfxokaNu1qSNHgoAWFaS2Uf2qyNVh3R8UaS8bBPIJPV9e2BmKT
    0BOufjJIA9IlAu49Q>
X-ME-Received: <xmr:Aa58aHBAgB0eeFfRSzqaiXxRYLPVURu8-oGqhx1SmygZE_K0IL24YtPaBapEUalbLVmD5R2hOxpnUTEX2xYovo-ZbsJBmw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeikeejiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcuhggr
    lhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecuggftrfgrthhtvg
    hrnhepffehieffgedtgfffjeetveegfeekleeileekveeuteffteetudffveegieeiheet
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhihrg
    hnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgtphhtthhopeduhedpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgu
    theskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprh
    gtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphht
    thhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtghpthhtoheprghnughrvg
    drphhriiihfigrrhgrsegrrhhmrdgtohhmpdhrtghpthhtohepmhgrtghrohgrlhhphhgr
    kedvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepkhhikhhutghhrghnleeksehgmhgrih
    hlrdgtohhm
X-ME-Proxy: <xmx:Aa58aDFvcwRooZ_KA72kuTnwN8fjxTuEAcesu37azzUfEn2ZDw8Diw>
    <xmx:Aa58aMLlia4t9420gwrxf4NPUxp4gCfzkFLDGFpqRwsM_oA_dXIGRg>
    <xmx:Aa58aKpdgR9UhZfNYRrCR8KAgS0vIzP9mWyP4NrHSDKn7xAPYDhmuA>
    <xmx:Aa58aDi579743aJQG1eh7CYG8O0GWptCAl7A_NH2X8-E5pXeZ5TWKw>
    <xmx:Aq58aNX1vUrrOtcFSsXXNv1uSdoECT2LNLDUOz-K3yDkHnFxJEa6Lc1Q>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Jul 2025 04:51:09 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	Hironori KIKUCHI <kikuchan98@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 01/12] dt-bindings: allwinner: Add TCON_TOP_LCD clock defines
Date: Sun, 20 Jul 2025 20:48:39 +1200
Message-ID: <20250720085047.5340-2-ryan@testtoast.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250720085047.5340-1-ryan@testtoast.com>
References: <20250720085047.5340-1-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner H700 exposes RGB and LVDS pins as well as a HDMI
connector. This requires additional clocks for the TCON_TOP as per the
T507 datasheet (which shares the same die).

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 include/dt-bindings/clock/sun8i-tcon-top.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/sun8i-tcon-top.h b/include/dt-bindings/clock/sun8i-tcon-top.h
index 25164d767835..2a12d047d2e1 100644
--- a/include/dt-bindings/clock/sun8i-tcon-top.h
+++ b/include/dt-bindings/clock/sun8i-tcon-top.h
@@ -7,5 +7,7 @@
 #define CLK_TCON_TOP_TV0	0
 #define CLK_TCON_TOP_TV1	1
 #define CLK_TCON_TOP_DSI	2
+#define CLK_TCON_TOP_LCD0	3
+#define CLK_TCON_TOP_LCD1	4
 
 #endif /* _DT_BINDINGS_CLOCK_SUN8I_TCON_TOP_H_ */
-- 
2.50.1

