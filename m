Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADC46FC8
	for <linux-sunxi@lists.linux.dev>; Mon, 18 Sep 2023 07:42:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 457B41BF226;
	Mon, 18 Sep 2023 07:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1695022957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YeG5a/Bqgvtd/iPOq8Fvj8+3brEGEmRcYA0IG9bBuc4=;
	b=bhc8RvMqy/Pq5T6Dh0KqYSOzBrydic0M1kq7DmoPrtyEtMnm+6lesiXFQdyEPub3mcsUmj
	EhNPwJ5K8q7WOxYxfwOv+IdXkTWJWyZirjZu5A9oZkiyGYXTTn2/nEjFixVkFOobUBVd3o
	UhndKbq7sG+L7VJGxO/K9xvkmVR8I22vkqjamelhSeEO/HZbzq4YsR8QmTBm/2NrXVajmX
	bEBQwS75OTvCN+nCWwp2VAMQ7QJH9BaITC6LZdYjG4o9q8GOqqVlrn+4CFsu8HdxHBwGvo
	8mORnLNEb0y5tA3O0lWJv8vJeaO3iCa8ei1LJngy12eNl4DHYmeIA3WIIQIxsA==
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Peter Rosin <peda@axentia.se>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Paul Barker <paul.barker@sancloud.com>,
	Michal Simek <michal.simek@amd.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] arm: dts: replace Bananapi with Banana Pi
Date: Mon, 18 Sep 2023 10:41:22 +0300
Message-Id: <20230918074122.73265-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com

The brand name is Banana Pi. Replace any mention of Bananapi with Banana
Pi.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 arch/arm/boot/dts/allwinner/sunxi-bananapi-m2-plus-v1.2.dtsi | 2 +-
 arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dts       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/allwinner/sunxi-bananapi-m2-plus-v1.2.dtsi b/arch/arm/boot/dts/allwinner/sunxi-bananapi-m2-plus-v1.2.dtsi
index 235994a4a2eb..ef532494fc9d 100644
--- a/arch/arm/boot/dts/allwinner/sunxi-bananapi-m2-plus-v1.2.dtsi
+++ b/arch/arm/boot/dts/allwinner/sunxi-bananapi-m2-plus-v1.2.dtsi
@@ -7,7 +7,7 @@
 
 / {
 	/*
-	 * Bananapi M2+ v1.2 uses a GPIO line to change the effective
+	 * Banana Pi BPI-M2+ v1.2 uses a GPIO line to change the effective
 	 * resistance on the CPU regulator's feedback pin.
 	 */
 	reg_vdd_cpux: vdd-cpux {
diff --git a/arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dts b/arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dts
index a37f3fa223c7..7f0948074945 100644
--- a/arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dts
+++ b/arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dts
@@ -10,7 +10,7 @@
 #include "mt6323.dtsi"
 
 / {
-	model = "Bananapi BPI-R2";
+	model = "Banana Pi BPI-R2";
 	compatible = "bananapi,bpi-r2", "mediatek,mt7623";
 
 	aliases {
-- 
2.39.2

