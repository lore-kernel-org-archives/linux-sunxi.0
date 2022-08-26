Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE4E23A6
	for <linux-sunxi@lists.linux.dev>; Fri, 26 Aug 2022 05:09:56 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 9A3473200A1B;
	Fri, 26 Aug 2022 01:09:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 26 Aug 2022 01:09:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1661490594; x=1661576994; bh=vd
	531MkIYA8R3532OhIEJHc24rhSGrcsdC8Qi3NA00M=; b=bB/aZETnOTSQGlJZZ0
	180RJIJjCevFEz6Wqvc3DCJmzXzIcTtCbqMRuUAZtqaYE7K+xpE3p1s6IMx5m/AH
	jGI9PeHcCYUA2MlT1QyXYTvbOforXzfX5P8mmkleJb887LkruttWrGUMbPtT/Y6F
	g9i1y5ceqxA6uO23pgcGn/k2MDXYMKKXjzRPL5h/PlcUwbsTDtekXhZw6WXqAPH7
	i1L6nDZUYROGo0qP7O475z6djYhWQC7jXvmuiGUyl2VFgqOp6J/sTJE+HjT4sX50
	WmSP3G007wRwm17O9Xxl5kz3nEfYBcqy6huGnN4zyGbI0H6ZbBL5zebXzLGvvdJO
	SLzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1661490594; x=1661576994; bh=vd531MkIYA8R3
	532OhIEJHc24rhSGrcsdC8Qi3NA00M=; b=xk14UN/xrRzBRWuubG8bEXdX4lMPK
	Q67kdqWLk3amdrveuFhfw5le2ar0gE+2GzMA6busI6SfsS8OJGCjx7Cz2hxHu+D4
	DbqQu+kEJ+MqrkyeEnyBOUlqZnicwUB2D4L24dPJD5BMdh7ePbFiJAaMiCgp10iN
	aljDPE+hinsQBdMYf+61UU6aPfh7FxtW8icHIhqVwiJ/VoKDBB/gA75NvU71iplS
	fCGURoowSFJ1D4SaTHk/TEz27zOwv40bCMJaQn9PB/n/H04xmrskx1Vb1n18BXp+
	Pyz14EvWEQAAfLXBbI+g34ZmCMC/1+tG9Q4Cnmexn30ceSnWCt6u0jIYw==
X-ME-Sender: <xms:oVUIYz8iprudiclBp6kTcQUX6TpS-cZiJfBQsTR7ROfqb6mV0JN44Q>
    <xme:oVUIY_tKi6TE1bPsTk-6Tj4HW2pX0CEbtNZc_U16KKplVBKBDifReHVdOpVZig8Xf
    x0AkuJDh0ZUmid2HA>
X-ME-Received: <xmr:oVUIYxDHcPX3Mu39By_Nc5nxIGsHTx-76jbCdNgMNSqMyKXGlxkvWgD8xcWD2TqU8u-NZi1EuK9Vl0JE_STw6d571ThHB8WXNraqv80HiRFA4AxdhMP6kTsSSgQNe-HvbrjHWQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejgedgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
    udefiedtveetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:oVUIY_eNgHsmwdEt5KJmEhlSt4fjlZEL6G8v3tqFvkkyFme-wowT7g>
    <xmx:oVUIY4MgQGPipdapZvdFGTtv5Ei5JHT7-euJ8zGIVh8omKBW4X98_Q>
    <xmx:oVUIYxkmLvNtnhiTMVpz_xiaiH7ogAc4G0FOpJ72M1y-1LEM3Y4uoA>
    <xmx:olUIYxnx7fxPGlaXmyrAf9lDROCa4N0_138kcR6D1ahBwqUmoVjByQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Aug 2022 01:09:52 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Pavel Machek <pavel@ucw.cz>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Yangtao Li <frank@allwinnertech.com>
Subject: [PATCH v5 3/6] arm64: dts: allwinner: a100: Add device node for DMA controller
Date: Fri, 26 Aug 2022 00:09:39 -0500
Message-Id: <20220826050942.20067-4-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220826050942.20067-1-samuel@sholland.org>
References: <20220826050942.20067-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yangtao Li <frank@allwinnertech.com>

The A100 SoC has a DMA controller that supports 8 DMA channels
to and from various peripherals.

Add a device node for it.

Signed-off-by: Yangtao Li <frank@allwinnertech.com>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

Changes in v5:
 - New patch for v5, needed since the LEDC binding requires DMA
 - From previous submission: fixed off-by-one in dma-requests property

 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
index 548539c93ab0..5453a3bb7d81 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
@@ -101,6 +101,18 @@ ccu: clock@3001000 {
 			#reset-cells = <1>;
 		};
 
+		dma: dma-controller@3002000 {
+			compatible = "allwinner,sun50i-a100-dma";
+			reg = <0x03002000 0x1000>;
+			interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_DMA>, <&ccu CLK_MBUS_DMA>;
+			clock-names = "bus", "mbus";
+			resets = <&ccu RST_BUS_DMA>;
+			dma-channels = <8>;
+			dma-requests = <52>;
+			#dma-cells = <1>;
+		};
+
 		gic: interrupt-controller@3021000 {
 			compatible = "arm,gic-400";
 			reg = <0x03021000 0x1000>, <0x03022000 0x2000>,
-- 
2.35.1

