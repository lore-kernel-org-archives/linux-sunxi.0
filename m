Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BDAA48B6
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Mar 2022 16:24:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B2231595;
	Thu, 17 Mar 2022 09:24:13 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.196.172])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3EF273F7B4;
	Thu, 17 Mar 2022 09:24:11 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Mesih Kilinc <mesihkilinc@gmail.com>,
	Icenowy Zheng <icenowy@aosc.io>,
	Jesse Taube <mr.bossman075@gmail.com>,
	Giulio Benetti <giulio.benetti@benettiengineering.com>,
	George Hilliard <thirtythreeforty@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2 04/12] dt-bindings: arm: sunxi: document LicheePi Nano name
Date: Thu, 17 Mar 2022 16:23:41 +0000
Message-Id: <20220317162349.739636-5-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317162349.739636-1-andre.przywara@arm.com>
References: <20220317162349.739636-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The top level LicheePi Nano compatible name was never documented in the
bindings, so add the currently used string.

As for the manufacturer name, Samuel reports:
==========
From what  I can tell, "Lichee Pi Nano" [1][2] is the original board, and the
"Sipeed Lichee Nano" [3] is a newer batch by some of the same people [4].

Other than the silkscreen and the addition of the resistive touchscreen IC, the
boards look identical. And in fact I was able to find an intermediate version of
the schematic [5] that uses the old styling but includes the touchscreen IC.
==========

[1]: https://licheepizero.us/
[2]: http://nano.lichee.pro/
[3]: https://wiki.sipeed.com/hardware/en/lichee/Nano/Nano.html
[4]: see e.g. http://bbs.lichee.pro/
[5]:
https://github.com/hongxuyao/F1C100s_with_Keil_RTX4_emWin5/blob/spl-separated/doc/lichee-nano/lichee_nano-Schematic.pdf

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Samuel Holland <samuel@sholland.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index c8a3102c0fde..a7e7b2e79616 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -391,6 +391,11 @@ properties:
           - const: libretech,all-h5-cc-h5
           - const: allwinner,sun50i-h5
 
+      - description: Lichee Pi Nano
+        items:
+          - const: licheepi,licheepi-nano
+          - const: allwinner,suniv-f1c100s
+
       - description: Lichee Pi One
         items:
           - const: licheepi,licheepi-one
-- 
2.25.1

