Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A53310ED
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Apr 2022 04:40:05 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 05C1A3201EA6;
	Mon, 11 Apr 2022 00:40:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 11 Apr 2022 00:40:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1649652003; x=1649738403; bh=xY/wsEH93CLjHX3lnrlxC12c9
	aUtKmnweAqaU5N4rg4=; b=oDJTDlLyoCJ6TK2o2LA6TDMjl2y1IFBrqBIo5liCY
	z5D8lsP9oZST5sJLYswUakSVeaTtVEovvvypqNXuoe1KoyABrcacM8KgOo3sP14G
	hR1uP1z6OZ8PSVi6K+pfKNZjojgX75GXKbtjSNEcBMzLJCuqqGpkjGXeJ06GZBKc
	wNVNofa9UL4TqmPlxrr7zdKUlSlqPWVm2D3BbJdsTk/Tyj1dgzgvIaaRJ9SpYYY6
	kzMFIXJrA9sMau7OsTDnH3UA0qYYR3ljEP5PAkKpOX5WOOv4DYZIvqzjvf8LvVm3
	sx/1CCh4VdW14RGl7VxWUuCj7OVhqTxe1gbyNduRvWy3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1649652003; x=1649738403; bh=x
	Y/wsEH93CLjHX3lnrlxC12c9aUtKmnweAqaU5N4rg4=; b=kxypa8Bcw88WgH1mY
	hrzyrTfSkVLdlWckbs/+tl52gBlES/ZiLqrzIAN1mNNv2muSEkzAYfFbtERwqH4X
	sBaEckUA8cNkgqpNhQT+lbsyCq7cY9ppFoohvPeIaRAStl35ez4s7SdNExd9mGCi
	uQz95t0vMmHuGr/I6oa4bEUt5EjaO7vzywT9XaWMXArSVvG/0jSp84wFMwGOun3W
	LyFEBy5j9Ws6kQc6EdgNhP8J7dl4YPVa4R+YyrPpIGvog+JQkltPB4FoIcuXvf4J
	1H6I92AC+3mGn3WCqs6o47ocbjXEQ5jSeoWB7w0oC41+qn0tk+FyNe6Jhv1IzTdX
	Gbang==
X-ME-Sender: <xms:I7FTYvxm9BuHpOEKbTkZA_xx6OPK6mEAH1I0etIyzDYV9tq2Czl3NA>
    <xme:I7FTYnRd3DukF-oLIhlp6qr8cEFXGy2iZqZQayLXJ7JjrXqvAU9ywbzebbSmjaVNR
    k1qgoVwDJXeRYe03A>
X-ME-Received: <xmr:I7FTYpVaGi_oinM-rauqXvW186CY71ZvnlBSepKZ13sZkb5RpGJKfgQpAAWisqIS2Q4oAeVW4CYq_TyOEDwSg9yREHvewGU65H-8sYa8a1VfxS-YIoQiy5jLDyVYToLAagSL7A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekhedgkedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgvlhcu
    jfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtffrrg
    htthgvrhhnpeeiteekhfehuddugfeltddufeejjeefgeevheekueffhffhjeekheeiffdt
    vedtveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:I7FTYpjb2bcmFeoexQvKnNA-aP9vHa7tkDRLQ9vNKTTm2bZ-ICXxuQ>
    <xmx:I7FTYhDUcH-S-U0hnOaBH_wEvXw2xG_tbXMh6oCeRK1gADyYfKBxpA>
    <xmx:I7FTYiJHN4EJ6x6qVj4Q3mdFWuJdT8qR09C1eUrmFT_oiP79mnBJdA>
    <xmx:I7FTYmJmlXcfPGgRkDVHsNGzh1a1hR_FSequw1vfqDM4Tom2qgKlNg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Apr 2022 00:40:02 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maxime Ripard <mripard@kernel.org>
Cc: Samuel Holland <samuel@sholland.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] dt-bindings: clock: Add compatible for D1 DE2 clocks
Date: Sun, 10 Apr 2022 23:40:01 -0500
Message-Id: <20220411044002.37579-1-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allwinner D1 contains a display engine 2.0. Its clock controller
matches the layout of the H5 DE2 clocks (2 mixers, no rotation engine,
and separate resets), so use that compatible as a fallback.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 .../bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml           | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
index e79eeac5f086..17caf78f0ccf 100644
--- a/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
@@ -28,6 +28,9 @@ properties:
       - items:
           - const: allwinner,sun8i-r40-de2-clk
           - const: allwinner,sun8i-h3-de2-clk
+      - items:
+          - const: allwinner,sun20i-d1-de2-clk
+          - const: allwinner,sun50i-h5-de2-clk
 
   reg:
     maxItems: 1
-- 
2.35.1

