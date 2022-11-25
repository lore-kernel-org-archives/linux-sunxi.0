Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140797E
	for <linux-sunxi@lists.linux.dev>; Fri, 25 Nov 2022 04:01:21 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 4067F5C0152;
	Thu, 24 Nov 2022 23:01:20 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 24 Nov 2022 23:01:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1669348880; x=1669435280; bh=yx
	oCW18sGnAleTXERaxCCwFBmN8B1EyztOvLbqS0bd8=; b=BjnxwE6TKebpPzT2U8
	ROz+fz0anYyp9MpM1hl0SiD+aM1rKcvoBV+SzkrngMqiJuq0FwxjgqzFvKAGJo2K
	oqwEufzs2OKZ9MeeBZsJbDDdFGiTjfFVBqhzGxdouEWkrSjrwEMHkLMbgkkAQppu
	Pu/WQpsa7ytc2K0mL7vhPMK5WQTFQIAdnRcnSRZqXBi/Uf3gplaAiklmtfwYjVDj
	gcOdEdFghPTER+/T2TiOK4Rvi4IIviMzEM/R+kWGHbJKBIA7C77S9+LeglFvIGKR
	eWO1k+JZp5mfOPhtaH8YL0mFyYaHSNNGmRc9memSpuCmdwYIvd/MwrDYt/Y2gmH0
	A6jw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1669348880; x=1669435280; bh=yxoCW18sGnAle
	TXERaxCCwFBmN8B1EyztOvLbqS0bd8=; b=ZvZ2j6XNr8ko82Io47/lvF38cYZYk
	o/LbBIP5K+GSONo1f0/hdPoFDsm1ttQsyPBx1iQ04xwFgranF0GabO38jcCH2LCp
	Iys4jSVhIPlUB3iucSiKKZZfeBMkWiI/CiOO71D9Cvlo7RnOSDfPHKwLGjAKJIBp
	N8gbTw//Eg5V+UDFUbmn/XcHzJDTHbLRcmSKk/7BDqbvZiT8vQwep4dMlctuMUXM
	f0IgaYohVWKBdmPh6sDq3VuhP+siFScaxk3rKSNdd5yUn17/oUr5mVS2yGREkixB
	CggwHf67+jwWUZ7ZgIq9/uzKWN7EpalGcECihw8kqtmC/7Q1Wa7dg2+mQ==
X-ME-Sender: <xms:ED6AYyxtEafVGMthGK-TwRo75LSndQ36GGZMbFMF1VtO2ql2I2Xtsw>
    <xme:ED6AY-QfB9-8Wt19LIMIGhXu3DqWYXcbmS70WLqWh6ln0yb_-CRwSBS9mnpesEBhh
    R8LNXQUT7vCzg6V7w>
X-ME-Received: <xmr:ED6AY0XEP3JBaWWZpBlwsowFpW-UcGJSyKDvxTgIo0y4IAOUxElV6RRM_YfFcPf2xf8V2ZJPlIaclrmrwOnzpHZg_JqilPe3mUfLR5ziWHIW-vuBti1Z_QGkTP6g1s3zmUTaEQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrieeggdeigecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeehgfdu
    feeitdevteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:ED6AY4j7-_lm939vsqCM8Ibho9znQdnKUs_A1NgX9_iDMeXHv2OB5Q>
    <xmx:ED6AY0AN6uEBeGDmMrmMCKFZ-8gMkE2OQBGewYIGPIwMsWHGC6vmYA>
    <xmx:ED6AY5LAdbApB_ZW2PDKTr8bLFlAELAgC0Ha-99clVN6Eyi5r_2MdQ>
    <xmx:ED6AYw4ILoP810vYbfmePT44Z1Y_HKYFCqyRE3M2h1o9l41kJx2r_w>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 24 Nov 2022 23:01:19 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>
Cc: Samuel Holland <samuel@sholland.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v4 4/4] soc: sunxi: sram: Only iterate over SRAM children
Date: Thu, 24 Nov 2022 22:01:12 -0600
Message-Id: <20221125040112.18160-5-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221125040112.18160-1-samuel@sholland.org>
References: <20221125040112.18160-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that a regulators child is accepted by the controller binding, the
debugfs show routine must be explicitly limited to mmio-sram children.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

Changes in v4:
 - Check the compatible string instead of the node name

Changes in v2:
 - New patch for v2

 drivers/soc/sunxi/sunxi_sram.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sram.c
index 92f9186c1c42..f09918c59042 100644
--- a/drivers/soc/sunxi/sunxi_sram.c
+++ b/drivers/soc/sunxi/sunxi_sram.c
@@ -120,6 +120,9 @@ static int sunxi_sram_show(struct seq_file *s, void *data)
 	seq_puts(s, "--------------------\n\n");
 
 	for_each_child_of_node(sram_dev->of_node, sram_node) {
+		if (!of_device_is_compatible(sram_node, "mmio-sram"))
+			continue;
+
 		sram_addr_p = of_get_address(sram_node, 0, NULL, NULL);
 
 		seq_printf(s, "sram@%08x\n",
-- 
2.37.4

