Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721496F
	for <linux-sunxi@lists.linux.dev>; Wed, 31 Mar 2021 13:08:38 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 512C65C00F9;
	Wed, 31 Mar 2021 09:08:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 31 Mar 2021 09:08:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm2; bh=qAOqN5SztShRuTjj5eNBpkc/IN
	gZclEg53I6BflBm+w=; b=Pl9tBJalANWNENnL2P//vWknogE0aDC5np+13a2ZDb
	BADnH9/+tuCc8AV0R31qkcRl0iIT9jhvn0LKfv15a15VNRWDHPikr3/ElETJuD9W
	kTrz7PP2S7O1hUEzXwvAKyAnJHB1+POlbgsqAL5E0gWWdtRDKzjBq2wDxP9wnklk
	4STsKEGyDP8iAI5Bbj9IzIErkuh3hFXkOo/8AJvTI/6f65lHwa8mKql6BFjZ2oOi
	plPC1LwEigs2eq4WEZd3P2rKxdtMoYpC/aHxkbH+Qqls/dhcA2PXyjqK8O25XKPk
	E5JNu/0YyFUKNllxQdVBkigyK2eQJ5jF8sO7FJeRebZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=qAOqN5SztShRuTjj5
	eNBpkc/INgZclEg53I6BflBm+w=; b=tc5iaIf4QHmSNZnuO4M9giSCoGfLMHapp
	ZvA+dkdOAi61o3OYF0o4rcif4CcNfM3qGqGciqLOUN4kewf2g25ksjO659rRwObF
	0tFIHOb60sLOh+MftbJXYossyXzFshD7VLmhAh8GBV6RoOCTWAtFnU0EAsFEggH2
	aArkTyXlmI4r4Hzy0/sappdyu1qMB7Dqtl/bcICPVjahlhfjmh66iPJxJF4sBV1x
	72UnwHHoLwJ38qWMmkMHhv9rG7CiMAh3KJngCa/NGQXVK7M47PtBDQ14AvmwgVnx
	OfhsnMx52m71V7zFCTRKjYMkue/jWcSP1IL5UkDA6198YT8FG90Ew==
X-ME-Sender: <xms:UnRkYFmOsoNSI24e8RA3Jn_vFU8Dyd0xZR4LoGI_aaIJQ48MGugSEw>
    <xme:UnRkYA2u7C631_RqZPGL11dy2fbgK0C58Tuk9hyirH5-4b4vxy1TaWmUpSc0O3Sly
    aEp2wKRVVfX8Cqw7Ng>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeivddgieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    govehorghsthgrlhdqhfeguddvqddtvdculdduhedtmdenucfjughrpefhvffufffkofgg
    gfestdekredtredttdenucfhrhhomhepofgrgihimhgvucftihhprghrugcuoehmrgigih
    hmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrhhnpeekueeujeekffegveek
    gffggfevtdeuhfekieffvdehhedugeekgfeludeukeekgeenucffohhmrghinheplhhinh
    hugidruggvvhdpkhgvrhhnvghlrdhorhhgnecukfhppeeltddrkeelrdeikedrjeeinecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimh
    gvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:UnRkYLohglDEoAfNkLBeDTBgS5IXSFy4AtU64ehP0-K0Fxp7D4TcJg>
    <xmx:UnRkYFnkENqkRvhUrm_sXWh675pCHWF3XtOcXGkHRvBhu9DLT-_mkg>
    <xmx:UnRkYD30qPIaql7kvZabqLaOnDY2YRGcZ4FbtLKu-Flzrqxx2BQpJA>
    <xmx:VXRkYBBsFST1mdgojGeZg_PKFDpmkvuYn_HHcAUSGR-j6h2ugoP6zA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
	by mail.messagingengine.com (Postfix) with ESMTPA id A91D324005A;
	Wed, 31 Mar 2021 09:08:34 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <maxime@cerno.tech>,
	Jernej Skrabec <jernej.skrabec@siol.net>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 1/2] MAINTAINERS: Add our new mailing-list
Date: Wed, 31 Mar 2021 15:08:29 +0200
Message-Id: <20210331130830.64182-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.30.2
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We've been struggling to get an LF-hosted mailing list for a while, but
now that lists.linux.dev is there we opted in.

Let's add it to MAINTAINERS.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d92f85ca831d..d8c00df4045c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1576,6 +1576,7 @@ R:	Jernej Skrabec <jernej.skrabec@siol.net>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git
+L:	linux-sunxi@lists.linux.dev
 F:	arch/arm/mach-sunxi/
 F:	arch/arm64/boot/dts/allwinner/
 F:	drivers/clk/sunxi-ng/
-- 
2.30.2

