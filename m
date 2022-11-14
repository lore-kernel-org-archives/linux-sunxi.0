Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBD410F2
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Nov 2022 02:21:29 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id A953A320046E;
	Sun, 13 Nov 2022 21:21:28 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Sun, 13 Nov 2022 21:21:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1668392488; x=1668478888; bh=3k
	S+hGr1YOBmWI2lELCrF34cgmevTqDNsJTi/d0Iu/E=; b=OWeZLFE8iVyyVkI+0P
	PaX1rQBL6LwRSN+/Ve4FVilwBScRuFLc/XVksw8zKS/b2FQEDWjVRhvcwlNq57NR
	K0Ziv2YGRgwU0WwfqQp/n5eYUQSvu41AJBwD+a+UcQ2ViGnqRB57FVy5qcyI278k
	EeszYPUsVb1OL9JU6pFVPE12MtoFGsjYm+ZeoQ6WodmBxnA0tCbBXH5Yw1smx2oj
	j420rQulS2JOHQ5GSELSodyjhmeHAN3k3bZIA1aUriPka0Az+Zy6sxtPuwJ9weuU
	YEbavxh0q9k9mYt/nIt78p93z9v2txGE0zCUIM0uJiA2hRjKjGdVb/3cKOQRUnCp
	q8jw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1668392488; x=1668478888; bh=3kS+hGr1YOBmW
	I2lELCrF34cgmevTqDNsJTi/d0Iu/E=; b=m29fVrIOdb2kwzqaEAblpCJCgDzxN
	WtjuuZC+vxU2nbqqtyiGYetiPEEZOmO+k+bPfKzlSeU2jIt+pK9JEXWHXStXlTyY
	hlRcTm5x17LaXUmaShMdcUphc9RHgxs5Au/U91xtRW6DgL8XIcyw1Duza5erSG7J
	18XRhlvuV941qbg4WPcv1eGFyw155oEPCGYn19c8ry5biM5BqEFOp4oyNTaOOyQN
	ulnEthOOB9//ORZDvEEsT38f3nY4qjkkLF/2Fs9Z23CM6IUXALvcJ1AiLD6eZDvm
	wcKX33zcb8ckc/eCOj92WbV1hrg3TsmGd0J7UV3hxuaLJVzPb/R4jeFyw==
X-ME-Sender: <xms:KKZxY6sXMP30OhF7alsFhzCInu2Sb-19R2--4RZh-GPApssN8fep_Q>
    <xme:KKZxY_fRV2brRiGpy810QXgsAhiVUXJh7hl9CyoGXMpG3QETCyDSotopIRWalHwUB
    A0irv89ihNqiOXK9w>
X-ME-Received: <xmr:KKZxY1yoHDNpLxbhLqMbKw8MvZmxVTuMKl1HQpjxoar7EisBfY_f70uX3HYDd9UDb8Kg3Gs7VLashdgHd9LkwAZqdeSR2Y4mc2Us5GqKdEoDoTJOZOqXgXWRYYPu8n0YiLbPCg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgedugdeghecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeehgfdu
    feeitdevteenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:KKZxY1PDKcSm7Sb3lhWH-9MdZnZkLN0ev32yAR6-szGLK_Ynu14ZFw>
    <xmx:KKZxY6-ADFJlQz3JT6GX22JCwPnRrDpSCuTnuJwEN6nA0ZIe4L04Cg>
    <xmx:KKZxY9WgKg9lveiXGNvka3d3-xbLbqClVPqNPYsHywCPFc2M8AOsYA>
    <xmx:KKZxY1Vm5nxvZ0VE9Q7zNHVEWckEIuDNSeuKxooxZEjwQ50nffMYdw>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 13 Nov 2022 21:21:27 -0500 (EST)
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
Subject: [PATCH v2 5/8] phy: allwinner: phy-sun6i-mipi-dphy: Make RX support optional
Date: Sun, 13 Nov 2022 20:21:10 -0600
Message-Id: <20221114022113.31694-6-samuel@sholland.org>
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

While all variants of the DPHY likely support RX mode, the new variant
in the A100 is not used in this direction by the BSP, and it has some
analog register changes, so its RX power-on sequence is unknown. To be
safe, limit RX support to variants where the power-on sequence is known.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

Changes in v2:
 - Rename "supports_rx" to "rx_supported"
 - Add a blank line for readability

 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c | 26 +++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/allwinner/phy-sun6i-mipi-dphy.c b/drivers/phy/allwinner/phy-sun6i-mipi-dphy.c
index 3900f1650851..7d7322670a83 100644
--- a/drivers/phy/allwinner/phy-sun6i-mipi-dphy.c
+++ b/drivers/phy/allwinner/phy-sun6i-mipi-dphy.c
@@ -114,6 +114,10 @@ enum sun6i_dphy_direction {
 	SUN6I_DPHY_DIRECTION_RX,
 };
 
+struct sun6i_dphy_variant {
+	bool	rx_supported;
+};
+
 struct sun6i_dphy {
 	struct clk				*bus_clk;
 	struct clk				*mod_clk;
@@ -123,6 +127,7 @@ struct sun6i_dphy {
 	struct phy				*phy;
 	struct phy_configure_opts_mipi_dphy	config;
 
+	const struct sun6i_dphy_variant		*variant;
 	enum sun6i_dphy_direction		direction;
 };
 
@@ -409,6 +414,10 @@ static int sun6i_dphy_probe(struct platform_device *pdev)
 	if (!dphy)
 		return -ENOMEM;
 
+	dphy->variant = device_get_match_data(&pdev->dev);
+	if (!dphy->variant)
+		return -EINVAL;
+
 	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs)) {
 		dev_err(&pdev->dev, "Couldn't map the DPHY encoder registers\n");
@@ -445,8 +454,14 @@ static int sun6i_dphy_probe(struct platform_device *pdev)
 	ret = of_property_read_string(pdev->dev.of_node, "allwinner,direction",
 				      &direction);
 
-	if (!ret && !strncmp(direction, "rx", 2))
+	if (!ret && !strncmp(direction, "rx", 2)) {
+		if (!dphy->variant->rx_supported) {
+			dev_err(&pdev->dev, "RX not supported on this variant\n");
+			return -EOPNOTSUPP;
+		}
+
 		dphy->direction = SUN6I_DPHY_DIRECTION_RX;
+	}
 
 	phy_set_drvdata(dphy->phy, dphy);
 	phy_provider = devm_of_phy_provider_register(&pdev->dev, of_phy_simple_xlate);
@@ -454,8 +469,15 @@ static int sun6i_dphy_probe(struct platform_device *pdev)
 	return PTR_ERR_OR_ZERO(phy_provider);
 }
 
+static const struct sun6i_dphy_variant sun6i_a31_mipi_dphy_variant = {
+	.rx_supported	= true,
+};
+
 static const struct of_device_id sun6i_dphy_of_table[] = {
-	{ .compatible = "allwinner,sun6i-a31-mipi-dphy" },
+	{
+		.compatible	= "allwinner,sun6i-a31-mipi-dphy",
+		.data		= &sun6i_a31_mipi_dphy_variant,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun6i_dphy_of_table);
-- 
2.37.3

