Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com [66.111.4.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09D32F27
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Feb 2022 01:36:02 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailnew.nyi.internal (Postfix) with ESMTP id 03E4A5801D8;
	Wed,  2 Feb 2022 20:36:02 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 02 Feb 2022 20:36:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; bh=5AjGYad9sW+FKie1aNJ3+LpBiH4rzT
	j/3qYmj3pgyJY=; b=nIFf0CEuLAcA7GwB0DxNrEmHzPCcN/hj5kEEKyz1T3kXIO
	obQCh1Mo8ecLONj3blFtmUBKek+y6ktYgtQhDMOfnIKXDfyzHTt7FXHw1pDwRsCO
	JAZB2DYPC2vKfBklt9siAoU6hjrg4ulGDlM93b9TQurYR48tpNnG2Mz7eJTmQpwi
	7i3e5UetGMSHAr5SQLsnztPmePAnL6U3c1B75lvH/gC+7rV4WlTeo0waOUVUfEd5
	wcHVoZtKgfLH4LYii4+DjQlEa+YlGWvqwIZQrr7uREppACqHPpjb2egD8rwA8Z1J
	y3DoFwpSw0H8c1l3J8wbu9LHSSqZKvTXiSbrg4EA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=5AjGYa
	d9sW+FKie1aNJ3+LpBiH4rzTj/3qYmj3pgyJY=; b=a6W+pCQbElOaTUErmRAdkB
	Rd0QnFuI4zCdQb8vpaDrJeslrCQDuxDjzDsRRW1HMj3gu9CBWcQIAnpc8B7FzWrn
	d5bBI1u6oIG0PVpsPx21OIvXqHLycmfxUJb5arkcDQbvBeBaJAoxATS/YAmEB00K
	8Z1oBcUQWwmQpSkmdhCPWFVNiKVY3ipkst2KmTwYoJmVbLytvNdOQPgRCwT3MGnX
	dmta6yk2+lxUZW71YtbTHKbhhcVPVvU3lkheR3qf4ZkmdT+Lhwf3141kSw8f3Ijf
	QDXrcQBx6gJFgtu2BMLdCFuqil8vZDQnFB0rIproBHPWKqoZiKUdeRYCCArqSlxQ
	==
X-ME-Sender: <xms:gTH7YcMGHztxTDpi259jHncLb9SnsBST3KPY6egJwmB5tQraMZSSww>
    <xme:gTH7YS8vA6pIKQltOiZrKoPPYkHhkEV09LDYjTFUGNewyqoIdYKiyxgaI1jPrmDy9
    3XV_xcL1m-imNvpxA>
X-ME-Received: <xmr:gTH7YTSpc3hWQ70MXZvJsVXOrUan4arrRkeUg0mEWWKE3vt4HTEKE0XA3JzGZDiuSKBrADimIHxZBswhYdTF0VkjsQtAkChYYKqrmZnYnreXSEA4iEW1bpGD986C_8TrDREN8Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeeigdefhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
    ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
    grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
    jeehueeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:gTH7YUsvF4xmHxv_kN-QzIwQ6j5S-yLGj9yBmcYO1Rd4kOJSQXc8gg>
    <xmx:gTH7YUdJxFnqhAI4WZH87ieZ8BvvBfJg8oSP3BNWxUk-BQLo-9odPA>
    <xmx:gTH7YY2ZwzLJmXcV_XkTKtuQttzYioSIEqwoEPmoWLyF1Sqcjk1ACA>
    <xmx:gTH7YY0pVx0R-nE8-nSLbtUcrpSUQZMqrg2G5biYcOvSQARu1ska-g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Feb 2022 20:36:00 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Kishon Vijay Abraham I <kishon@ti.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH 2/4] phy: sun4i-usb: Remove .disc_thresh where not applicable
Date: Wed,  2 Feb 2022 19:35:55 -0600
Message-Id: <20220203013558.11490-2-samuel@sholland.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220203013558.11490-1-samuel@sholland.org>
References: <20220203013558.11490-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

.disc_thresh is not used when .type = sun50i_h6_phy, so providing a
value for it is misleading.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 drivers/phy/allwinner/phy-sun4i-usb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index 788dd5cdbb7d..624950fd48ba 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -962,7 +962,6 @@ static const struct sun4i_usb_phy_cfg sun50i_a64_cfg = {
 static const struct sun4i_usb_phy_cfg sun50i_h6_cfg = {
 	.num_phys = 4,
 	.type = sun50i_h6_phy,
-	.disc_thresh = 3,
 	.phyctl_offset = REG_PHYCTL_A33,
 	.dedicated_clocks = true,
 	.phy0_dual_route = true,
-- 
2.33.1

