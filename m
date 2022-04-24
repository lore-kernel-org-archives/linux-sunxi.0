Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243DF2F2F
	for <linux-sunxi@lists.linux.dev>; Sun, 24 Apr 2022 16:26:42 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 3E3525C00D0;
	Sun, 24 Apr 2022 12:26:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Sun, 24 Apr 2022 12:26:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1650817601; x=1650904001; bh=se
	q0O/JjDWLm3q7ZpJodrcTjPueq2LdslcJSA34pQRY=; b=tYJy2nSpBs32Gq6YQm
	daHQeesbmWH+/j2uZEWx8m2EV3CnF3t+ZeTCw0KcaJc0nsrOFdY7BAguoh9FDh0P
	hS2pRWZFqrdARvVIeuy3rwx4H3nEiK5nDXEI24QQ8AnXpwl7QVQm0xNN+TIpfH08
	Iq11aPC8KOvLTdcq65hbI2qS2X+BJSI5uevvtHGkM9W8mczEOSUidU4DrgKJ++II
	kNtCqSnNDvA3XDVwxqktUS2aI1eLUq6eickIPwlVG4F6yK0QcEHj9RsQoDdT3wFd
	jzCRlqBTV25SrnQ1bwI7lfXvEbu6tNYuOdx+hDptaFufrGGzID8TcQr7NoyC8t1M
	nKWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1650817601; x=1650904001; bh=seq0O/JjDWLm3q7ZpJodrcTjPueq2LdslcJ
	SA34pQRY=; b=Yl8NKIDnl2WEafzJhPCOBol8ZFIXmSk8Uw2LO8yF8ksppiZd95B
	fgcj0Lq927lFyfnO/XaLzeh2ntPS5SWT8dHZGzdEElAQeFGcsaRtaOUh9nB3zXkM
	ExMuN2Ov9nRm3jVFrqh3TMk3V/BgTlgZ4hB94AjAVh//mmUVHOM93YOEZ3ySq+Wf
	+zQuOaJZ/2IM2cvXuXxYh7ZOplrgUS5oUkEKJmt12wEnU2MNXPRA8eMMWdZ8WxM2
	ouiSYmvATvVXPwjCh1CCJmltZe1Eq9XlX5+7g7BV9lQHLzlpBBmFYEEpAU0rlt8U
	pU3X4Vo2kvuN+9ByrJBEU2uOnmgLVZD2Ncg==
X-ME-Sender: <xms:QXplYj8ipAE45CSco2acm2_E_DjiJpH7JJNU7oJzfILzUgfnM0ALCg>
    <xme:QXplYvtKsaXz-ZgSUMDX96CQFCTt4EgjrJjqc3CPTkIe8dj9XmDHAqEzSZevIB58Q
    M8-IK7eufc3qGx0Mg>
X-ME-Received: <xmr:QXplYhDHnpYKD_M4DRMgG0OT6AF5f75FFPvIlRCXDgzLDG7h0i0EqsBmnt4nhOjJmglASTZcflfy7E8dU4dWdyoeJ_EZRkmEf-rCTFiGmfMkPMrqvbMOxEbHfWRholTWd2eQ6Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrtdelgddutddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
    udefiedtveetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:QXplYveNFnA1FwkEDPgTqZ6F4nzyh79tloLddkaLjFnoNX_RK_Kp1A>
    <xmx:QXplYoMgHksf6AN0Cs0tWEhQvzvwt96FA5Xq7DZgw5LUkGP0bZS5FQ>
    <xmx:QXplYhkmtCC8BsRUKW14l5BGNak9GlIrzDDz_HZt1e_RB8tliTBQ6g>
    <xmx:QXplYhnx85d_R3V2lOJ-h1MaAUaPUZZJFpwiQM-vvjUg3XJP9cmmEQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 24 Apr 2022 12:26:40 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maxime Ripard <mripard@kernel.org>
Cc: Samuel Holland <samuel@sholland.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@linux.ie>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v3 03/14] drm/sun4i: Remove obsolete references to PHYS_OFFSET
Date: Sun, 24 Apr 2022 11:26:21 -0500
Message-Id: <20220424162633.12369-4-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220424162633.12369-1-samuel@sholland.org>
References: <20220424162633.12369-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

commit b4bdc4fbf8d0 ("soc: sunxi: Deal with the MBUS DMA offsets in a
central place") added a platform device notifier that sets the DMA
offset for all of the display engine frontend and backend devices.

The code applying the offset to DMA buffer physical addresses was then
removed from the backend driver in commit 756668ba682e ("drm/sun4i:
backend: Remove the MBUS quirks"), but the code subtracting PHYS_OFFSET
was left in the frontend driver.

As a result, the offset was applied twice in the frontend driver. This
likely went unnoticed because it only affects specific configurations
(scaling or certain pixel formats) where the frontend is used, on boards
with both one of these older SoCs and more than 1 GB of DRAM.

In addition, the references to PHYS_OFFSET prevent compiling the driver
on architectures where PHYS_OFFSET is not defined.

Fixes: b4bdc4fbf8d0 ("soc: sunxi: Deal with the MBUS DMA offsets in a central place")
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v1)

 drivers/gpu/drm/sun4i/sun4i_frontend.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_frontend.c b/drivers/gpu/drm/sun4i/sun4i_frontend.c
index 56ae38389db0..462fae73eae9 100644
--- a/drivers/gpu/drm/sun4i/sun4i_frontend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_frontend.c
@@ -222,13 +222,11 @@ void sun4i_frontend_update_buffer(struct sun4i_frontend *frontend,
 
 	/* Set the physical address of the buffer in memory */
 	paddr = drm_fb_cma_get_gem_addr(fb, state, 0);
-	paddr -= PHYS_OFFSET;
 	DRM_DEBUG_DRIVER("Setting buffer #0 address to %pad\n", &paddr);
 	regmap_write(frontend->regs, SUN4I_FRONTEND_BUF_ADDR0_REG, paddr);
 
 	if (fb->format->num_planes > 1) {
 		paddr = drm_fb_cma_get_gem_addr(fb, state, swap ? 2 : 1);
-		paddr -= PHYS_OFFSET;
 		DRM_DEBUG_DRIVER("Setting buffer #1 address to %pad\n", &paddr);
 		regmap_write(frontend->regs, SUN4I_FRONTEND_BUF_ADDR1_REG,
 			     paddr);
@@ -236,7 +234,6 @@ void sun4i_frontend_update_buffer(struct sun4i_frontend *frontend,
 
 	if (fb->format->num_planes > 2) {
 		paddr = drm_fb_cma_get_gem_addr(fb, state, swap ? 1 : 2);
-		paddr -= PHYS_OFFSET;
 		DRM_DEBUG_DRIVER("Setting buffer #2 address to %pad\n", &paddr);
 		regmap_write(frontend->regs, SUN4I_FRONTEND_BUF_ADDR2_REG,
 			     paddr);
-- 
2.35.1

