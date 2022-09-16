Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AC720EA
	for <linux-sunxi@lists.linux.dev>; Fri, 16 Sep 2022 04:27:54 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 7D93F5C0219;
	Fri, 16 Sep 2022 00:27:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Fri, 16 Sep 2022 00:27:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1663302473; x=1663388873; bh=k9Qt81M4LKuSOwQceO20Bstmi
	DW44X4V/oE0ozyjyII=; b=RXhYNqONt8eRZbleg7ML1aBZO1oVH1pIHXYXaPwb6
	zJXkpNulFH81v0kpNT022wLT75cEtmm9DOrzWsGYFG2hxZT6VHBxs9hoHfPBgXxm
	0K9NZC+cIUBEugBPGTTMLuWRf3nCzTyUTNG4cRcxzJgnXsk6W9uAOHsdACSv3zvo
	PpK9y2gsz/JbP+x1F5f2TZ3KwENxQ35fnHeWC5yTCvJ1P+HQL+U5jJVPl8Ab77vk
	GDHF932/YDm7ZncT43rSeHktfSWLz3zB3621nzEhm7puxRG7pp3q6Ubq+DmpKJaH
	StlPFjTPvtuBMPHMZQ3KDpP7RFeSadrNi3fyhj7jigjrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1663302473; x=1663388873; bh=k9Qt81M4LKuSOwQceO20BstmiDW44X4V/oE
	0ozyjyII=; b=SN/tmMhFr0kGmlHYQJZMdCkwPpXvyVn0PLeLu6bnXhuQlvQcu8V
	Uk+EdyNy5qqv4xcnIXaI6fRY78o3BJIEvbZnG076AdaGYDRv1mVwV+ElGZcfcZIn
	juhZnGuAZ1NlQaQCEgB8EuyszhdLL51nRb3GVImfrgDsNaJClwQXO3QrgtZEY6m1
	rjhIXEAmonui+7E1CB9foI1ZHVOOZdXnmlR5rk9DkW3f0M79WTyk8ZqTWGXzjxAW
	4YE/VQMG5KDEY1vN/YIm7+1UJRZiyVFLkm9Tt146zlxNEqIV8r+7IKRuBGnny9HB
	mEG+VsTr6vk3UKJYYWOLTMLrNf0fG2S/32g==
X-ME-Sender: <xms:SPsjYyywpAQ4oG3FPHSKz1e3lRby60FBzJVQTaYUfX_5UlVVCLmDKg>
    <xme:SPsjY-Sm7MiGILJXvXpcb9SwHotNjNTWjkvOCRSvoat6ZQhcZbvPdM7CVKTotaUhY
    TmSSbsuukqD6W5_lg>
X-ME-Received: <xmr:SPsjY0U_RLRZeZRhNZQSUktzeYSasY0g1aIirW11UDtzbAyGyi1iyXkvsqOFDOQGkRFzFScgKzP9ajHRtBXOEJgC5hDQg_3GazYWWmhN_eWHr8-JE-NYJEVOGuH-frtghpXN3Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeduledgkeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
    ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
    grthhtvghrnhepkeevlefhjeeuleeltedvjedvfeefteegleehueejffehgffffeekhefh
    hfekkeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:SPsjY4haZoBFk6iU4Iqgp_kNDmFcZX5Fv5M58x_BM9C3M53uLsgOug>
    <xmx:SPsjY0CAjkJ7o0ChtutLa1iKr9B9sW6wn3hD3W4KoBg14LK6GyjI7w>
    <xmx:SPsjY5K3zJkI3E4BbtJDKqxeMl5hdVwr0nNACdJoyOWnuCQuWu2Aqw>
    <xmx:SfsjYyCyHe_e-wpSs0Q6Pk5h2gyJeC0xr1RYprFEoANNIHeQ_V_b6Q>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 16 Sep 2022 00:27:52 -0400 (EDT)
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
Subject: [PATCH v3 0/2] AXP221/AXP223/AXP809 GPIO support
Date: Thu, 15 Sep 2022 23:27:49 -0500
Message-Id: <20220916042751.47906-1-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series hooks up the GPIO controller found in some older X-Powers
PMICs. The main motivation is converting the U-Boot driver over to use
devicetree, but Linux might as well gain support for the hardware too.

Changes in v3:
 - Added patch to remove existing "ldo" pinctrl nodes
 - Drop already-merged binding and driver patches
 - Remove "ldo" pinctrl children from new nodes

Samuel Holland (2):
  ARM: dts: axp803/axp81x: Drop GPIO LDO pinctrl nodes
  ARM: dts: axp22x/axp809: Add GPIO controller nodes

 arch/arm/boot/dts/axp22x.dtsi             |  6 ++++++
 arch/arm/boot/dts/axp809.dtsi             |  7 +++++++
 arch/arm/boot/dts/axp81x.dtsi             | 14 --------------
 arch/arm64/boot/dts/allwinner/axp803.dtsi | 10 ----------
 4 files changed, 13 insertions(+), 24 deletions(-)

-- 
2.35.1

