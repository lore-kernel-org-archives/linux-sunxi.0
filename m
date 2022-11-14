Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C161110F2
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Nov 2022 02:21:24 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 5B366320091E;
	Sun, 13 Nov 2022 21:21:23 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Sun, 13 Nov 2022 21:21:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1668392482; x=1668478882; bh=+A
	yJRlUtw7YrN/zrnK1iUvTLXnPZ+9CqwIituSa4cZE=; b=k890dPAVDkQjmQmihQ
	94VBs2P1Trbfpql9DNIml3vOr3ibLmQqy62qeQV01jIapywMjoIKQ2Q+ocuQ9id/
	IZqK6U8b8LbuMZC51oj8CoFqm252QDus22/DshPl/oKlwOeNMRM4FaPLnPUzoPrl
	xP2lXd+8ZpT1145xC6qyelCL3xFs3HNUXwSDgLo+o25W8vbFbtTSb5+i+ypJe9rp
	lP4J96gYTYhqZ8+I8kBZ+F/1kctkJVrud0y2KW2CBp8bWOsNqnYiMxIe3syxJoyQ
	K3h7bfF9Rd714qO9sKxrYV5v+/wkR8hl2PB98lfttL6410d7FOa+QrK+urWkbfWz
	YXuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1668392482; x=1668478882; bh=+AyJRlUtw7YrN
	/zrnK1iUvTLXnPZ+9CqwIituSa4cZE=; b=mTyFuoH1oscs64LiEtfA2+1XlyM1h
	t+6u5kyzCFdAt+MnQjQzXSSl429VqCOFS5iZb66ybEku4jcXlwRGfHDKOHGY3xWQ
	kp0yi5v/Y18N6q96SHhL2qZPkqiqq51YrVj9CgvYwZlgYCZCoXTJUlNQSnsXsGOd
	Oz5d1JQjAV2TFN0Qpm38XJiyjzmCJGsXPxygPQl4CHpGafnY7reRffGaMbYU84FX
	kJPE003BYS6rPqN63JHxUb6piW1YuKlRq4KmRzkJmxtYqHbmyGHLImgKAifvVRBN
	CqqNYAPc2d+PYyko6rgAtHQPSP8J3uK1WOBmGgqfzdXv3/idi4lk4qOjw==
X-ME-Sender: <xms:IqZxY30p63koNBcx0YTK9GUmeQXcDjhXJANKhnH0qXW-yzWiJmMuoQ>
    <xme:IqZxY2EUmR11P5eH46PqWMEOVg1s0LL7whmqzsvHx6yzKoPsYqF6h67sGZrSbMWbq
    0KkneFH5VM6bHm8og>
X-ME-Received: <xmr:IqZxY34rSQGXHLWMCPElCnKN4kSaPCBgXm1mE5x_sEJnMYvio1ehYB7U72eR7Pw3NODMZ86isWhGfsoD7wChCSLHg4EDwDC8cKa0uG_KtfAlREG6B7wrwkzuKG3V0YvUOZ6dYw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgedugdeghecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeehgfdu
    feeitdevteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:IqZxY80kRuqAQ9hmmU2nXlcTXKPgIuiZcJ77bkE0m2TfPjKDzn7_uQ>
    <xmx:IqZxY6GdLbRjKA3i2OdgYajvtchN_Uske6qXR5sA24oL9xBqL5fCpA>
    <xmx:IqZxY99fXSK4BL-lHgh-GG24xTvevOO-jfO0DLKOvn3MfYoviVDNIQ>
    <xmx:IqZxYxcOgM6m4ycsqJXGigPXuz_VVBnPm3eP7nQ7I8bXqUpZLswB8A>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 13 Nov 2022 21:21:22 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maxime Ripard <mripard@kernel.org>
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Samuel Holland <samuel@sholland.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 3/8] arm64: dts: allwinner: a64: Add DPHY interrupt
Date: Sun, 13 Nov 2022 20:21:08 -0600
Message-Id: <20221114022113.31694-4-samuel@sholland.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221114022113.31694-1-samuel@sholland.org>
References: <20221114022113.31694-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DPHY has an interrupt line which is shared with the DSI controller.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v1)

 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 77b5349f6087..62f45f71ec65 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -1199,6 +1199,7 @@ dphy: d-phy@1ca1000 {
 			compatible = "allwinner,sun50i-a64-mipi-dphy",
 				     "allwinner,sun6i-a31-mipi-dphy";
 			reg = <0x01ca1000 0x1000>;
+			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_BUS_MIPI_DSI>,
 				 <&ccu CLK_DSI_DPHY>;
 			clock-names = "bus", "mod";
-- 
2.37.3

