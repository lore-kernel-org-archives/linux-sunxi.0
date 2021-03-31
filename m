Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF86770
	for <linux-sunxi@lists.linux.dev>; Wed, 31 Mar 2021 13:08:38 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 2DCDE5C00C3;
	Wed, 31 Mar 2021 09:08:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Wed, 31 Mar 2021 09:08:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=fm2; bh=3S01/Yd8yzJh1
	1P0hZKIaXqlFvpcXy/bttRMQLyONjI=; b=ncW++uhhQp7Sxe+SR8hQVwIX7xlvy
	gQGV2KMVHKyuGuEBEd4W+fg4jrs/V7wyUIKR2SKNEkEJ5tuXurIyhBa6XuGfhD9s
	z+7mrgzqgnErSh3mNfLq9E3NUaElGINCDjmSdV2lvZiANf4ywZ1iTujurwSQp6R/
	IIMnkAbDSMAd5jxWPGGfZU41Rpbfz9CTGcCnNESFBquM0+QaAmJH1O5uGsMhmQQ8
	wvMzcYwd/yomD16IuVJXbyf/9SBO62I3haXOFprw2V9d8bieA9KHA9Mhmi7fYc3U
	K7yfhg/fjomooO1RrK99RIY7/DWucoZX4+5bHQD3yRewI04lRHY33pcbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; bh=3S01/Yd8yzJh11P0hZKIaXqlFvpcXy/bttRMQLyONjI=; b=oqsRpQGp
	nOemH3tvj0YF8KPSKopusFzgh0s/Y3/KErwlk2letIA6+b/vme4kjg84ovmV9ju+
	mC7kU/nSzjSCZGQc6dYVd85Ge80X5lrO8uVsPPGgCocf3LTqqieZSZF25X+NAcUq
	V7ndI7B5Xa55uRPmwnrCb1j+33cAVDRS9/0HhEmzq/feXTANwHsafNYDK3fyMsY/
	eWl3OWTWp+gVqiAdasOh7bO8eUr5w9KYB8lltT9dw/58JO9zXL796qjyZa01UY3Q
	OM//ZZVd3EpmTp0fyT0jCSS1QvoSplsne1M9sOqesVTPqRsFdpDmw2RJoQU1Rz+Z
	7XQ4d8V6pht24Q==
X-ME-Sender: <xms:VXRkYMohsk1DnCKU5DWFJCZAk-jsFrTDPbyNZ_-9xlOaLT5rEjXJpg>
    <xme:VXRkYCr7YbmVZKFp9fBEl0KtEgceruZyp7cUTj29KE-CBoMH1OZ_hL2v5egtYeF1Q
    6OLP2AFXRxpY_pkcD0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeivddgieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:VXRkYBMFeOQWkui-Mg1rCT19gvXXaM2CNHFf83_2uZ_ULYuMFYQBpw>
    <xmx:VXRkYD6nEIiAB6by9cfapE7YVkUeQnlWv9vGc0kObsHVOR0sJrQrIg>
    <xmx:VXRkYL6txBK_cBLHlrLaWxk2YybIhT4z79dP-vIhIQW8jEyq8MoJCQ>
    <xmx:VnRkYLF0hG6NrN6jIXhq1HN1gN3BtQuZ39gmFpaP8SadRQwEwGAl7g>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
	by mail.messagingengine.com (Postfix) with ESMTPA id B036D1080054;
	Wed, 31 Mar 2021 09:08:37 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <maxime@cerno.tech>,
	Jernej Skrabec <jernej.skrabec@siol.net>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 2/2] MAINTAINERS: Match on allwinner keyword
Date: Wed, 31 Mar 2021 15:08:30 +0200
Message-Id: <20210331130830.64182-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210331130830.64182-1-maxime@cerno.tech>
References: <20210331130830.64182-1-maxime@cerno.tech>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some drivers (phy, crypto, net) folders don't have sunxi in it but
allwinner. Add that keyword to match on it too.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d8c00df4045c..5e808daae799 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1582,6 +1582,7 @@ F:	arch/arm64/boot/dts/allwinner/
 F:	drivers/clk/sunxi-ng/
 F:	drivers/pinctrl/sunxi/
 F:	drivers/soc/sunxi/
+N:	allwinner
 N:	sun[x456789]i
 N:	sun50i
 
-- 
2.30.2

