Received: from sender4-op-o16.zoho.com (sender4-op-o16.zoho.com [136.143.188.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9035B20EC
	for <linux-sunxi@lists.linux.dev>; Tue,  6 Dec 2022 05:53:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1670306020; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LtRxaus840eTgSFHKHI4FiRq3Sc28LDH0d/vsir1aLsM47Dz5lTsmzu9KAKU9UaUn70G3vMEVybA19G2NMezI3cxJeNnXPctmgsredCuDwcU2INW0D6GvUPfE6Ay/U4Ke07sJ8aaLB3EIP93ewd6jY7B+luxviKo9UfqI41kHU0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1670306020; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=/k1Z2WEqHllTXos8B4dmbQlQ4/WttliYjSasnsZMvhQ=; 
	b=aZgxRZV+Ut4+VNrJQIBc6M3Ogxo/14bI9TvtCotaf8hrbakldORtxHAntcopZzbE/u3h+WJ+lbcGHbmPJEUPtkK1sAF+SmCqW//vkqIpgugVSJ6CHAKmKrXw77bnJQkKWvvVec3dgTkQDgiDo0oe/rSG98vI66VPOshpnOjb1mk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1670306020;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=/k1Z2WEqHllTXos8B4dmbQlQ4/WttliYjSasnsZMvhQ=;
	b=N/qlKYX8tYoyB7VdKKHgswYT4lcoDv2xLKWQP2j+JWExnbTnCRCQCrCg5KzDlOHE
	m7pjEqIlcUMMMUTLGuNwnRP/J7cnP6n3ARLuuyk+wO4YE3QdHsiHwdRtA/w5s8Z3fTb
	IcL6O8waDQp2ylfJh6vFFeVMWuQ/kcMIAfz9zWAA=
Received: from edelgard.fodlan.icenowy.me (120.85.99.143 [120.85.99.143]) by mx.zohomail.com
	with SMTPS id 167030601851298.70551810068184; Mon, 5 Dec 2022 21:53:38 -0800 (PST)
From: Icenowy Zheng <uwu@icenowy.me>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Kaehlcke <mka@chromium.org>,
	Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 5/6] dt-bindings: arm: sunxi: add Rongpin RP-H6B board
Date: Tue,  6 Dec 2022 13:52:27 +0800
Message-Id: <20221206055228.306074-6-uwu@icenowy.me>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221206055228.306074-1-uwu@icenowy.me>
References: <20221206055228.306074-1-uwu@icenowy.me>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Rongpin RP-H6B is a development board with RP-H6C SoM, which uses an
Allwinner H6 SoC.

Add compatible strings for it, including the board-specific compatible
and the SoM compatible.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Samuel Holland <samuel@sholland.org>
---
Changes in v3:
- Add Samuel's Reviewed tag.
Changes in v2:
- Add Krzysztof's ACK.

 Documentation/devicetree/bindings/arm/sunxi.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 3ad1cd50e3fe..482631815f2f 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -792,6 +792,12 @@ properties:
           - const: rervision,h3-dvk
           - const: allwinner,sun8i-h3
 
+      - description: Rongpin RP-H6B development board
+        items:
+          - const: rongpin,rp-h6b
+          - const: rongpin,rp-h6c
+          - const: allwinner,sun50i-h6
+
       - description: Sinlinx SinA31s Core Board
         items:
           - const: sinlinx,sina31s
-- 
2.38.1

