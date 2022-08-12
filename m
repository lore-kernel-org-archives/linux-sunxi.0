Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8B862E
	for <linux-sunxi@lists.linux.dev>; Fri, 12 Aug 2022 07:56:07 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 032FD5C0178;
	Fri, 12 Aug 2022 03:56:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Fri, 12 Aug 2022 03:56:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1660290966; x=1660377366; bh=A0
	Suz3pFHzbaDEdJ1Zd98AaOQsAUFz+r94G9QZCuotI=; b=TcTrobC40xND3xjOAj
	2l1FKmjTq5yki6KIjmfkgJu3HuvOnGRd0JIpeAKS/7sd8nOU6K14WRB00JjWsk07
	lsFBBEBmb2ZAsSCY4YyecmhWHsp7QJznf1H0ejwF5sL8ATZLbmWBoPzyMCrBhTBX
	vGOrLzA1bI4YrzjMyHUCaAstmVn6exGijY3PgmiS7mEezGKgSjTqlTR/ubBA9a/r
	cRbyi/F8t6zQE7BKow0822E2Eh2YrQvQxZcfyWQgXiawufVCY6TzMKzZwlT4lIE9
	sKwbVVsgPBipDDiriaAOoyKEH8dnmQljqd0u1ysgmkMer2pcBwSqlQkLI2+0+Q6F
	d4SA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1660290966; x=1660377366; bh=A0Suz3pFHzbaD
	EdJ1Zd98AaOQsAUFz+r94G9QZCuotI=; b=k+uqelU/83YxgC4MuSV2hgruY03b4
	EK+7aMRf2l6enro9v96bAWT6Wdyp53ejsmUE3R0yOID9aPu0PcRom7AHN48Jimtx
	8h0UaE38FLQSPzkrHdw6CWUxkA7/kl+Uogrsk6TZwHIHqRi+Vby/oQRdkDjiUPCp
	VnDA+E4hVOeUN9RZUMLSq9IMfmIZnoXAgEItxXb0qUowkyQYUTnXxkhw+PRxdm4C
	BdOpdfZngoHfOOLTtxjM9tIW8k9KSwi/0xtnfXzG4qEE9TwDA7n3Ey2e8mlAhDGg
	a5kQi6sIHXQkjNMKAmJ+2FV9oxV9r/W50Bnymsx0aaPM5enWoDn2i//GA==
X-ME-Sender: <xms:lgf2Yv99GP7xaaezsQbdwcYhigZH8Kv5JosBcFJL9nngdy_bv5MmNw>
    <xme:lgf2YrvbqsKg7eAGvmsJblaReef1J6r3uXPpXVaSrvx5gXbj4-4bTrgRS3yeSm6hW
    SmZEv40bjNSSgUy8Q>
X-ME-Received: <xmr:lgf2YtDo7RVPKySsjM5bbIKmfkpOTWUF80UngYmrPYkuxBcliU23TYpBP-T2fG7zvkQDRPBpzgYjIMp4GVo8tOyBkXvFWQvEIYKeIsS3CpTLWyIgfKUncCLAFQl-OojDnrTVmA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeghedguddvjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeeh
    gfdufeeitdevteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:lgf2YrdsGlrKYFa0u5xJqaKctGAghArR6xKXHfXIPXU6Rlaor6JHuQ>
    <xmx:lgf2YkN45EEV9vxzP0e-mAqK53xk9euVSNyiDur5E4xcna4KBVG6Vw>
    <xmx:lgf2YtkC_sq2ngCoKNrSdaxA-JMcfanwQjgAOaHcKGWqp_Bre6GRpg>
    <xmx:lgf2YrloC4C1N2bjU1vKKqB0qtlK6EMwWlNZu8UJfWH01qEhpBqMtg>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 Aug 2022 03:56:05 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Kishon Vijay Abraham I <kishon@ti.com>,
	Vinod Koul <vkoul@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maxime Ripard <mripard@kernel.org>
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Samuel Holland <samuel@sholland.org>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Maxime Ripard <maxime@cerno.tech>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 1/8] dt-bindings: sun6i-a31-mipi-dphy: Add the interrupts property
Date: Fri, 12 Aug 2022 02:55:56 -0500
Message-Id: <20220812075603.59375-2-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220812075603.59375-1-samuel@sholland.org>
References: <20220812075603.59375-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sun6i DPHY can generate several interrupts, mostly for reporting
error conditions, but also for detecting BTA and UPLS sequences.
Document this capability in order to accurately describe the hardware.

The DPHY has no interrupt number provided in the vendor documentation
because its interrupt line is shared with the DSI controller.

Fixes: c25b84c00826 ("dt-bindings: display: Convert Allwinner DSI to a schema")
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 .../bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml           | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml
index 22636c9fdab8..cf49bd99b3e2 100644
--- a/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml
+++ b/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml
@@ -24,6 +24,9 @@ properties:
   reg:
     maxItems: 1
 
+  interrupts:
+    maxItems: 1
+
   clocks:
     items:
       - description: Bus Clock
@@ -53,6 +56,7 @@ required:
   - "#phy-cells"
   - compatible
   - reg
+  - interrupts
   - clocks
   - clock-names
   - resets
-- 
2.35.1

