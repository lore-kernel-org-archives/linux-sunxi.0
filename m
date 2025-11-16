Received: from s2.avantea.pl (s2.avantea.pl [46.242.128.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80AB2F60A7;
	Sun, 16 Nov 2025 13:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.242.128.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763299522; cv=none; b=muEdWXgApfS1cisldJJTlD4Gu46wJsO0LV1SeIzd0TlAoGa2d3LvaOfca/aLhenk2EHCM+L7gJt6RZl5meLTr/KsO+Iasf4lvUKLErjAk1F7L1yo6Ri2dJ2ZB/WkXqG36P7SsXaH6tPOq1eK2pmHWiA+/v514A1pBDKOw7AaWy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763299522; c=relaxed/simple;
	bh=g47VNxOuIRVfIjJ9Gd6MyaohN5b5SV9VKZlky0fDxHc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kyQEpnqFAehmwKAtXODhkcnpN3krX+EPYS5dTm0RMxHAox4dTEbBOXjUKmzAWGkCQV4xVwbg1Skl+EnfrdXTVwEuo5gVU867IfOE3fKnRuPr9mE2IVCm6OvvU+iwES9/9Yy5DgkwgarJBdaoptegH8oeBT7KF7nlLZAbkqBpAcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=szczodrzynski.pl; spf=pass smtp.mailfrom=szczodrzynski.pl; dkim=pass (2048-bit key) header.d=szczodrzynski.pl header.i=@szczodrzynski.pl header.b=oqYIW28M; arc=none smtp.client-ip=46.242.128.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=szczodrzynski.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szczodrzynski.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=szczodrzynski.pl header.i=@szczodrzynski.pl header.b="oqYIW28M"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=szczodrzynski.pl; s=x; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BPO9NrD7t7ozHNmv9SwKBa5YjnO0HgIRT0temEkfh70=; b=oqYIW28MTYchaus5P4hPdqBMcw
	8w9RZoiGHzBso3Fy8hSBWffJ6uTQq8OC61xOZXDkdr8db5Z3qY3ZKZVVjkv9hyHc0lTpmfM9zR3I/
	dD+Lx1poqOVYaSfouhdkmSymdGihzeTgYPajNIlem8qvtBZ7J5FN9nL1B6p1d7E5tUPxF2kUoucox
	U9vjnQYVSGknlAKuGjUMHnlw0e4khAKvVLjhJKBDojgl3mmMQgVbTajBVPmfUeAmSt9gMnNGH0dxH
	apBQeVCOQbM2ByyMp6Q5t2vD0DS/M8OXoZFAnZ+AfLCtD9LJt2MQSnh3O1rbQecCAzl03U+pvtNjO
	lPlC6zwA==;
Received: from [62.171.184.96] (helo=buildhost.contaboserver.net)
	by s2.avantea.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <kuba@szczodrzynski.pl>)
	id 1vKckk-0000000FWTF-2WDU;
	Sun, 16 Nov 2025 14:25:14 +0100
From: =?UTF-8?q?Kuba=20Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>
To: Maxime Ripard <mripard@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	parthiban@linumiz.com,
	paulk@sys-base.io
Subject: [PATCH v2 5/6] riscv: dts: allwinner: d1s-t113: Add D-PHY to TCON LCD0
Date: Sun, 16 Nov 2025 14:25:02 +0100
Message-Id: <20251116132503.441015-1-kuba@szczodrzynski.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
References: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: kuba@szczodrzynski.pl

The sun4i TCON needs a reference to the D-PHY in order to support LVDS
on Allwinner D1s/T113.

Add phys and phy-names to sunxi-d1s-t113 common device tree.

Signed-off-by: Kuba Szczodrzyński <kuba@szczodrzynski.pl>
---
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 63e252b44..78aa61607 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -876,6 +876,8 @@ tcon_lcd0: lcd-controller@5461000 {
 			resets = <&ccu RST_BUS_TCON_LCD0>,
 				 <&ccu RST_BUS_LVDS0>;
 			reset-names = "lcd", "lvds";
+			phys = <&dphy>;
+			phy-names = "combo-phy";
 			#clock-cells = <0>;
 
 			ports {
-- 
2.25.1

