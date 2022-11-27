Received: from sender4-op-o18.zoho.com (sender4-op-o18.zoho.com [136.143.188.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B696B20F9
	for <linux-sunxi@lists.linux.dev>; Sun, 27 Nov 2022 07:32:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1669534358; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SIv8Ig6OgvIMKrTGz383JJBDKwfW4WV7jMz2W6hB+6I0+GhTALZdxi0/47O9fF8rxyTWznhq9NojHO9edufr6Z6pkHORLxLyo1KCN1YEAzvbPRtHMVhOya5mRbnhArVC5xuf2ovRSgBlGDfoWpb6QemtlV+MRdDslFqQ9a4dtnU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1669534358; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=PbjBuxSUHOSzyF8NtItKmDMy7yzUEN/jerT/ibZ1LOo=; 
	b=UdrgHGkzG4OlVdaWJ/jWSswwLC/2yOEvsejTQmaalnSD3Zaj/sTQJRIMuQOTgXG6r/kS/V0M7eMuulrHhcBz9XgeY2QhYd2n76jlkT3FO5r4vkggS9r+yynsPIJ0xk6MIGRBOfhziFwqBkiXwk2IcSLzcHwptFQQEp91+z8g+cg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1669534358;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=PbjBuxSUHOSzyF8NtItKmDMy7yzUEN/jerT/ibZ1LOo=;
	b=giKK8+mNVv+P70N2mXPoRBDIbMv8pQ6rQhivTbMmJLPKI0o8OPWwYFb02xy2UQ1f
	Zq21FBGAUAIBBMU0jt7UCCR68P293HftORrXh0xoN4olUsGD2xA2TBCnANRcf8ozUJw
	YhdVmGr27VanIvyzzajb9SjsgKGx77KRjppniTNI=
Received: from edelgard.fodlan.icenowy.me (112.94.100.108 [112.94.100.108]) by mx.zohomail.com
	with SMTPS id 1669534356435814.3503775168624; Sat, 26 Nov 2022 23:32:36 -0800 (PST)
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
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH 5/6] dt-bindings: arm: sunxi: add Rongpin RP-H6B board
Date: Sun, 27 Nov 2022 15:31:39 +0800
Message-Id: <20221127073140.2093897-6-uwu@icenowy.me>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221127073140.2093897-1-uwu@icenowy.me>
References: <20221127073140.2093897-1-uwu@icenowy.me>
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
---
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
2.37.1

