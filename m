Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9648D7F
	for <linux-sunxi@lists.linux.dev>; Mon,  1 Aug 2022 03:05:18 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id C2D353200077;
	Sun, 31 Jul 2022 23:05:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sun, 31 Jul 2022 23:05:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1659323116; x=1659409516; bh=RF
	f4ZIQUHigdGLmF6ZInRkG114b+nlKi/1CwVmNwCes=; b=jXAgZVPr8jwj4OXbaT
	vNnDYMWp+RNJjS+7Dw9tZxXaJYp/je6k1z3DJUjQERG8e/tRPBu+PVi54Oaf/S2A
	SYzrcQfGdsF5xGYWK1mS8/8oJRQIqtHSypSKKmDOhVz1oTqFcmTH96m8iUZ3KDze
	NtXRUc2cUNdPHSh8QgMtEsWlfT3uzTIgL0zh/KfHhSJuHR0iLPjKt8tHSEOD7ce0
	QRWGDBTYbqykBcctWuAWyq9eUqAsygfwUuC1OrGZLS/ym0qfX6k3KblXEK/ele8+
	qf7x+AA6io9ZHuHe/ACVSCC5UxiyQfut2PQnC3amE2XLdiQo3+4Y8RMVhIUasYle
	yksw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1659323116; x=1659409516; bh=RFf4ZIQUHigdG
	LmF6ZInRkG114b+nlKi/1CwVmNwCes=; b=s/ggJ0kHyu3SCYAPNJcMdhK8YsYhY
	AGg6Mr8bd9XhokEHiBXtNWDvDQuX4M9P61MoWtfgKijaUscMUWwxKBYj51NoNKmf
	C3aRgwDgwNkS4LL/3QYZ3aFCWMEkyCDEtelFN8FdVQj2VzRM3GaSRd68cvYsCqwx
	aJTpyzxAM34L7Ev5hvP/zrQi9ATK32F1PMiYh9dRt3xL5baoVCQCo+Sq7yztEAUW
	mRzDxCnTX4/E4NZl/8vg+KYsHjLkEBzGvveGGylBj9DJSG5uHpDWgcF5E0CQ2mP1
	Nl/NVu3tfpsEoKh8sZ2aAHfmZNfhPhTn0XPXy7iLH1jWarBylfHe7OJAw==
X-ME-Sender: <xms:7ELnYsRTFD9EiaRu_irgVjTCYkd8KJfd7s8UAymnMTN0bko2hHL-Yg>
    <xme:7ELnYpzej5epKytlmmcSlA0WuY_oKRWp5UPhq_DWx3qp0AP0KG2jXo8oV1CI_vuHT
    lALU3wMnd0mHaQJfA>
X-ME-Received: <xmr:7ELnYp1IckGpMgr8E1BuFa74AkEdp-9aArw5-pEnjtc8JkTTlaAV-yvzTvCttYF65BxAoNItPCpDST1oPrxnsaxRfTX-6i4MNFrOGO5pZxplCoAZ3knJrZ9Diss5Z2D0nBZZ8g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddvvddgheejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
    udefiedtveetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:7ELnYgBlhea6k1WRmVkhnnTGRMBzMZYIM78ePMGwM5xU4pG8xoR9GQ>
    <xmx:7ELnYljFzVegMeI6nUQFIoV1DdbmKuUYzNRqnDSON1nMl_dARgZBdA>
    <xmx:7ELnYsqy8P8C0gtmxwAXxR-44O0JQJxobcicWHTyUcEMevHvwkXj3g>
    <xmx:7ELnYgoMod_BTtlfpsZIrjvbq-7-6J7wDl1HHki2StSOqSKdm-GKBA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 31 Jul 2022 23:05:15 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Hans de Goede <hdegoede@redhat.com>,
	Icenowy Zheng <icenowy@aosc.io>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 1/9] dt-bindings: sram: sunxi-sram: Add D1 compatible string
Date: Sun, 31 Jul 2022 22:05:01 -0500
Message-Id: <20220801030509.21966-2-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220801030509.21966-1-samuel@sholland.org>
References: <20220801030509.21966-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

D1 needs to export a register for managing some LDO regulators, so it
needs a unique compatible.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 .../bindings/sram/allwinner,sun4i-a10-system-control.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml b/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
index 1c426c211e36..ab6e95a97c9f 100644
--- a/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
+++ b/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
@@ -39,6 +39,7 @@ properties:
       - items:
           - const: allwinner,sun8i-r40-system-control
           - const: allwinner,sun4i-a10-system-control
+      - const: allwinner,sun20i-d1-system-control
       - const: allwinner,sun50i-a64-sram-controller
         deprecated: true
       - const: allwinner,sun50i-a64-system-control
-- 
2.35.1

