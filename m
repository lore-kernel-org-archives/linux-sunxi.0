Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01BE2D8DD0
	for <linux-sunxi@lists.linux.dev>; Sat,  6 Jun 2026 19:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780773439; cv=none; b=ZkXLpzxMOskhAPcGTEOmGzqEbCLdKykKfwMsH8DzAXLV160/ERuVazo004QhrrudH6nvUlr1jA09iqhY3rUBOjkwQ/pm+I1l+2JODewXwoj+4LAMpm8al+XdzQ+DyGgDD9C56W451xGLO6c4TGZIiTGJSTloai7B9okDW9WhfRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780773439; c=relaxed/simple;
	bh=fxjxwfx7XvPeO/NbiTK9kR5HAqqnG8gD+SZpa0q6mc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h8OwZ/2AvGmIUN0pW+hshArFHPFmOlx1QzU7ki+u6mq/H/YrQdbPC73pPowr3aUL90mOEcXU2mnntb0M1fZrrc+Jn9nNEn95APan5Eja5sa93jjVNMcCcGWGDWDmBYhfvlNqnWqX+TJVaqyVez+t/oLsE/H6Tslg9j85/cca9VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=YzTXiYFx; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="YzTXiYFx"
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References;
	bh=gTs0cZaUUQQv4ViGpAM8i/wK3g92g6IK/a+nwJZu5P4=;
	b=YzTXiYFxyPJlipiSBs6WMacjC//y3aESKAjTWxTX3EqgITWEXsJWdcQqAXzMZgG+Tgqo3KQ1qRWEpzIrH31/Gs1HfnPtakk8KAF4l+oFZKhfqU7WLgyRSAPG5hFHgPxkTsu3LDxmOhuZR3EUk7mAT4Q/r4r7ERuFGiJ1xo8L3mA=
Received: from lukas-hpz440workstation.lan.sk100508.local (194-166-56-114.hdsl.highway.telekom.at [194.166.56.114])
	by mail.netcube.li with ESMTPA
	; Sat, 6 Jun 2026 21:17:15 +0200
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Maxime Ripard <mripard@kernel.org>
Cc: Lukas Schmid <lukas.schmid@netcube.li>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 2/3] riscv: dts: allwinner: d1s-t113: Add uart4 pinctrl required by NetCube Systems OpenNMC
Date: Sat,  6 Jun 2026 21:16:40 +0200
Message-ID: <20260606191649.2347704-3-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260606191649.2347704-1-lukas.schmid@netcube.li>
References: <20260606191649.2347704-1-lukas.schmid@netcube.li>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added the "uart4_pb_pins" pinctrl used by the OpenNMC

Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
---
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 82cc85acccb1..00fddedfa36f 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -191,6 +191,12 @@ uart3_pb_pins: uart3-pb-pins {
 				pins = "PB6", "PB7";
 				function = "uart3";
 			};
+
+			/omit-if-no-ref/
+			uart4_pb_pins: uart4-pb-pins {
+				pins = "PB2", "PB3";
+				function = "uart4";
+			};
 		};
 
 		ccu: clock-controller@2001000 {
-- 
2.47.3


