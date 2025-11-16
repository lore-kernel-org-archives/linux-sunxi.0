Received: from s2.avantea.pl (s2.avantea.pl [46.242.128.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54762F6560;
	Sun, 16 Nov 2025 13:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.242.128.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763301018; cv=none; b=rje5Z1gfY+67h3EVjYnyBxgp8HUl7YXCzBKFIU6FGNC4U5tpkikFkqA1dxaX1Mglomk6DFIEYiPjdbh7cqE6vVQMUgZyzuHCM05+CfPw0jWe6tVVbIQgRTT0zoCypQqtnfbIB5u3hhw3+nUfqOjUK5kAgcp1lHQptrfk37ii4Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763301018; c=relaxed/simple;
	bh=g47VNxOuIRVfIjJ9Gd6MyaohN5b5SV9VKZlky0fDxHc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SS2Z3+vl+6joNrF9tVN/mkzsEtEg5Ig6f0SH4iv4VzbqzdvSvGoa4UmI0F0z7giDkwhzRZlZBJVosDe9HdNG18V1348lN31TM+WFVNaHMlfZZ6NtbQQ52l5FwIP27rN6mHygzSFmY8LoZAhvcWLe49AtI1YSwSPppQdookXbKDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=szczodrzynski.pl; spf=pass smtp.mailfrom=szczodrzynski.pl; dkim=pass (2048-bit key) header.d=szczodrzynski.pl header.i=@szczodrzynski.pl header.b=Gg+j1iN2; arc=none smtp.client-ip=46.242.128.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=szczodrzynski.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szczodrzynski.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=szczodrzynski.pl header.i=@szczodrzynski.pl header.b="Gg+j1iN2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=szczodrzynski.pl; s=x; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BPO9NrD7t7ozHNmv9SwKBa5YjnO0HgIRT0temEkfh70=; b=Gg+j1iN23n1xHJQNAyHu8/3ZYX
	XvHAhG3jyG1PpNQAeLFit19IsBKmN86Nb2Zyj5mlmQkN2/V005zWuP9lJbWs5szW7dntwRKci25Xc
	c86GTd+4URPW9Mo7oXm5Sfkv8k8oY7nGo8rMz1N0tUjMYdn9vdkMweUcgWvaIVAvQHK9tYfGnUX94
	bXBBYvqTqs9NayEiTXczKmSDDVG3UFmu6qGReiG59Z6aVEj0iNS4ri6YivZmggmB67Nw9jVLEwHhQ
	JRi/6HGoJ6M6S92GuxSn3ccsNEg1WnZLCse3sTRbfjw8AUN/t95E8QktjTbPWLOUtP7h9KbunJBhd
	wuHQycew==;
Received: from [62.171.184.96] (helo=buildhost.contaboserver.net)
	by s2.avantea.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <kuba@szczodrzynski.pl>)
	id 1vKd8k-0000000FXVf-3tGq;
	Sun, 16 Nov 2025 14:50:03 +0100
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
Subject: [PATCH v3 5/6] riscv: dts: allwinner: d1s-t113: Add D-PHY to TCON LCD0
Date: Sun, 16 Nov 2025 14:49:57 +0100
Message-Id: <20251116134957.447529-1-kuba@szczodrzynski.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251116134609.447043-1-kuba@szczodrzynski.pl>
References: <20251116134609.447043-1-kuba@szczodrzynski.pl>
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

