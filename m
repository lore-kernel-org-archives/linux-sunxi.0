Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0688846B
	for <linux-sunxi@lists.linux.dev>; Fri, 25 Nov 2022 19:54:04 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 7815E5C00FE;
	Fri, 25 Nov 2022 14:54:03 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Fri, 25 Nov 2022 14:54:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1669406043; x=1669492443; bh=d9RBks0wci/gqhrse9JNMyVYs
	NZ48qNxrEdP2snbsqM=; b=Hn+5UCD3sX3nLig53Boj7q7be0IKtRb81i+HdWPjf
	rLirhsk8s1UqYth+7Da7AZzZCJc8S7fk7JcBl/khD+I87cBwDBhIPdyWHIwwH2lD
	xg5JhL6VSJ36PscblL+BsjFZSm40sg6+5c4hzO+3LVvK7z3kBENgDeE9a/6n7VEN
	hMvj45st4Ih2+3/KzlfynueHuxy+rY9bWdFpL7jaBctu9kPRkhfNKvZSnnmbpdDF
	xy7/UWi8WH6BDVzKOhs2+mALJFaqn/Ah1+JnOJI9ynM1anIElxIeCCmTGitbpJS8
	TKWgQ714D7Z9uC4MaCG8p4ouU2j2TD6pQV4QcVU0Uvpmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1669406043; x=1669492443; bh=d9RBks0wci/gqhrse9JNMyVYsNZ48qNxrEd
	P2snbsqM=; b=Vj98wfjkod8dwgVMVhCA8jN2QVFEy/vfeIIThmghKYE4jXpapAH
	JpF8kK1H/AXQIBbgAsselSvMXM4NE7cYtUTpPmpGqTybgpks4+1jFbmJnRSg4dDv
	8uzGs+dLky+3KG6Ng2gWGpYz6MwW4jgFAcB5zFASzUjI7OxdIOu76MApxBVlcB84
	bcLwtM5HH9hUu+nuX2DUe7mc8/Zf06taQDFjl2IprAZXV46kFF3JusuWQiCJ1xbR
	bDlTsypFynPqzKQeK9zWMJ9WgNQW9ZHbKS9FH8pQPMfYFl2sGZ2cd3pSfsLvT6R2
	EUsjm/r0i6tATHZPOsmAzen/+lWJ4Tyn6tg==
X-ME-Sender: <xms:Wh2BY4HMdcSKcD34xwQXAfOZbAheeppI-CqlyW4tSm0rGrcjLY70_g>
    <xme:Wh2BYxUVxihc5u7m8Xb3_-7OoqyVxQJuppHtUW54DgkkluCh519zGnVSEpgOVmWDX
    6y8_QLhS45RRIkiww>
X-ME-Received: <xmr:Wh2BYyIwBPCdsW9mPBeekA9kRX7U8CHBixGAz7Y00nHDpBZdbCVHGQVrW-rdM6fm9Pg6kwYT8zm_XrPHj20730J2VxzchDAfRUeJL2zB3_vYwMZ06JRDionnzqI_aHHzConyhQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrieehgddufeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
    ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
    grthhtvghrnhepkeevlefhjeeuleeltedvjedvfeefteegleehueejffehgffffeekhefh
    hfekkeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:Wh2BY6F2QhVgsjGSdQpxRTdxSIQ8H-3Kj2tl7EkGG1_WOylAIKdYyQ>
    <xmx:Wh2BY-XskPoejYMY5PyzPGBtZONKEeIIICy7Msr4vx_hKtV_GRBjxA>
    <xmx:Wh2BY9M3jV7GIExvL59HCS3UV72M7lgZMyOTQKbdkCB3SOfMyaO3XA>
    <xmx:Wx2BY5EOY0ajl5laR7lNDeEpgPE5_GjxDqBOkpVmZfwYtX8OO2CIEA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Nov 2022 14:54:02 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 1/2] ARM: dts: sunxi: Fix GPIO LED node names
Date: Fri, 25 Nov 2022 13:54:00 -0600
Message-Id: <20221125195401.61642-1-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These board devicetrees fail to validate because the gpio-leds schema
requires its child nodes to have "led" in the node name.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 arch/arm/boot/dts/sun5i-gr8-chip-pro.dts | 2 +-
 arch/arm/boot/dts/sun5i-r8-chip.dts      | 2 +-
 arch/arm/boot/dts/sun6i-a31s-sina31s.dts | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/sun5i-gr8-chip-pro.dts b/arch/arm/boot/dts/sun5i-gr8-chip-pro.dts
index a32cde3e32eb..3222f1490716 100644
--- a/arch/arm/boot/dts/sun5i-gr8-chip-pro.dts
+++ b/arch/arm/boot/dts/sun5i-gr8-chip-pro.dts
@@ -70,7 +70,7 @@ chosen {
 	leds {
 		compatible = "gpio-leds";
 
-		status {
+		led-status {
 			label = "chip-pro:white:status";
 			gpios = <&axp_gpio 2 GPIO_ACTIVE_HIGH>;
 			default-state = "on";
diff --git a/arch/arm/boot/dts/sun5i-r8-chip.dts b/arch/arm/boot/dts/sun5i-r8-chip.dts
index 4bf4943d4eb7..303191c926c2 100644
--- a/arch/arm/boot/dts/sun5i-r8-chip.dts
+++ b/arch/arm/boot/dts/sun5i-r8-chip.dts
@@ -70,7 +70,7 @@ chosen {
 	leds {
 		compatible = "gpio-leds";
 
-		status {
+		led-status {
 			label = "chip:white:status";
 			gpios = <&axp_gpio 2 GPIO_ACTIVE_HIGH>;
 			default-state = "on";
diff --git a/arch/arm/boot/dts/sun6i-a31s-sina31s.dts b/arch/arm/boot/dts/sun6i-a31s-sina31s.dts
index 0af48e143b66..b84822453381 100644
--- a/arch/arm/boot/dts/sun6i-a31s-sina31s.dts
+++ b/arch/arm/boot/dts/sun6i-a31s-sina31s.dts
@@ -67,7 +67,7 @@ hdmi_con_in: endpoint {
 	leds {
 		compatible = "gpio-leds";
 
-		status {
+		led-status {
 			label = "sina31s:status:usr";
 			gpios = <&pio 7 13 GPIO_ACTIVE_HIGH>; /* PH13 */
 		};
-- 
2.37.4

