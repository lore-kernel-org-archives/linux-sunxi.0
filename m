Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD5315A5
	for <linux-sunxi@lists.linux.dev>; Wed, 10 Aug 2022 02:25:12 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id D68E25C0321;
	Tue,  9 Aug 2022 22:25:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Tue, 09 Aug 2022 22:25:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1660098311; x=1660184711; bh=eOEB8KEcVP8KbPwNtMpMNwtoH
	M+vQrkL73Fv/ugZsT0=; b=b4i14hKPWuSNux4iohJEIVMr72x5LmoHOeLb7bpDZ
	unEk58FeopzLT2YFT3MkoLlGhN0V94cq2lU1Y0KwuRIMkbK+rg7s/9/qIRm9OJ00
	7Ntt7A1RONg0P0n8y3itv2uBYJnbOkYxRqe290LmEZYYAepmtG0pp+cK2AR+SwdG
	XNUtsgPOmQJOJtBoIN1KRwmHpT1mwg0jyfkYoMxnxpi2npqpCWa9zFg0+XaGf2C+
	y4j1Eeul0fggyd7PdLnFh7ab2NbuKVN/teskPeGAiT84KfNGJkxnXllvG/59ZCtk
	t/awNZX75XG2lmrnMuC4w87rOk/t66r9OBy4yt9CGrieg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1660098311; x=1660184711; bh=eOEB8KEcVP8KbPwNtMpMNwtoHM+vQrkL73F
	v/ugZsT0=; b=wd85Pl4Udx9qklObvZH/PvknPWmuTjQXUfyUKMZ4xbjoVXL3vyM
	wY2BGAg1b0tmrf5HDDbFzPS3eORBJYKXpNPid5aob4vNejERsV6jeXbHZJ6836tA
	k2cgsuwklDeSrkn1SiBdGsDA1aMZAzvdy2OQ4pwPIUDESuvpUn9EqfrkWG7IjgNu
	xAYz04HakXgjtPqczanZSKxVfUoBUrkrtqqiOuAHXxSoggJSLVQd2rmA/QuB0HX9
	6ATWS8+ke5zZsnizVloOxB70SZ3CBz7B8apt74//xRbMVgsLE6ruH1HfNUANfvyC
	fUAMVLwalkdJkblCPWFK7J/33aroQ5pyVxw==
X-ME-Sender: <xms:BxfzYv7TmEVg5geXgyk-jt_Er4OYV1RWES9zdPD9q5DP3Dr5F_V5Jg>
    <xme:BxfzYk6TpupLeodJyGnQJNg4Uf_lEW2OAOiMReX23Au4T9qwnyJvfaByXbfORSyM8
    iYGR_XH_LbnYShibw>
X-ME-Received: <xmr:BxfzYmckjfiqlNmy0SWwUCzw0JO_V8yvoTIwKTwVPzMGx23r04fvA-d9F_pHmixOBbWo89CE0jHy3dTcp23Lj14hsAGbssJNvpOi1-KApNQnaV8RWx7vpJL6Xbf4iBuBCL5DPg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeguddgheelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
    ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
    grthhtvghrnhepkeevlefhjeeuleeltedvjedvfeefteegleehueejffehgffffeekhefh
    hfekkeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:BxfzYgJ2pMgICYmlrYW-0cAZ7sEe5kfrbZ1DG7Ggvi9C-hLUg5-hVg>
    <xmx:BxfzYjLPJ_I929BbKANqz2GFgmhzfRnZqMy4D_RilDh5UhrFsd5Bzg>
    <xmx:BxfzYpzAGL5819p-5PzkrRUnj5Sj_fzOS3JS17nxQKnH_WlsF9YJqg>
    <xmx:BxfzYkUbq5CI2VUlztOvmu9lVxGSrBYyWGTAe5Xuh3a3AOytyqtvuw>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 9 Aug 2022 22:25:10 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Maxime Ripard <maxime@cerno.tech>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] mmc: sunxi-mmc: Fix clock refcount imbalance during unbind
Date: Tue,  9 Aug 2022 21:25:09 -0500
Message-Id: <20220810022509.43743-1-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the controller is suspended by runtime PM, the clock is already
disabled, so do not try to disable it again during removal. Use
pm_runtime_disable() to flush any pending runtime PM transitions.

Fixes: 9a8e1e8cc2c0 ("mmc: sunxi: Add runtime_pm support")
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 drivers/mmc/host/sunxi-mmc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
index b16e12e62e72..3db9f32d6a7b 100644
--- a/drivers/mmc/host/sunxi-mmc.c
+++ b/drivers/mmc/host/sunxi-mmc.c
@@ -1492,9 +1492,11 @@ static int sunxi_mmc_remove(struct platform_device *pdev)
 	struct sunxi_mmc_host *host = mmc_priv(mmc);
 
 	mmc_remove_host(mmc);
-	pm_runtime_force_suspend(&pdev->dev);
-	disable_irq(host->irq);
-	sunxi_mmc_disable(host);
+	pm_runtime_disable(&pdev->dev);
+	if (!pm_runtime_status_suspended(&pdev->dev)) {
+		disable_irq(host->irq);
+		sunxi_mmc_disable(host);
+	}
 	dma_free_coherent(&pdev->dev, PAGE_SIZE, host->sg_cpu, host->sg_dma);
 	mmc_free_host(mmc);
 
-- 
2.35.1

