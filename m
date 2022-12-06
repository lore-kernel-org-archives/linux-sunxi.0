Received: from sender4-op-o16.zoho.com (sender4-op-o16.zoho.com [136.143.188.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A00020EC
	for <linux-sunxi@lists.linux.dev>; Tue,  6 Dec 2022 05:53:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1670305971; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LgPrIMdu1a2HDm75QSpHI+g0IFbzDjqdeNcvlB3ewsmW7GHNL8gNquWbktLdy3z9b2740NcHSd+ghxiOwmC8N7f9Jnj0Nff8bN933QGOGxwiMWam+JJOackGlLHvISkQGchpPMhRb4gYJLcA09iRLkmlyaC24EuWYTM+7aGiLCE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1670305971; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=Nf6OciPn+Q4SzoDCtvn0OwyYqpJMxtrBoYZGMDOSbGM=; 
	b=dHzyVqxqNP8ZoKMLWhjmjtqE/7rMtjfSiJ/V634LIh3DXxPt4sJxs7K4mwJbkpi59bR7/XvgBzw4smEWmyh9sd2aE+v2nK/OQQqsRKOO36E8gYVUsUyYRoVSlnVupsOJNZhug4njN6IFZEf+ffDqwBOUCXvlAYdYRpLQ5JDPGbE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1670305971;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=Nf6OciPn+Q4SzoDCtvn0OwyYqpJMxtrBoYZGMDOSbGM=;
	b=Rv3X3GIuvfOJCo1ZvjgwIoY3NPnFcejwyHTKF0MlPPzkYQS53n2TGwEH5u7wzgdo
	ofziV1xyUQDfCUoOTSHhQN+/O7e5Yogk5nXFN/u8qlwkFNzlz0Nlthq66pJQ9CzkZDo
	j+dbiUzjMKEVMyMhDwyTbbsJE1sT7XUpCERM04ys=
Received: from edelgard.fodlan.icenowy.me (120.85.99.143 [120.85.99.143]) by mx.zohomail.com
	with SMTPS id 167030597083732.965150430843664; Mon, 5 Dec 2022 21:52:50 -0800 (PST)
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
Subject: [PATCH v3 1/6] dt-bindings: vendor-prefixes: add Genesys Logic
Date: Tue,  6 Dec 2022 13:52:23 +0800
Message-Id: <20221206055228.306074-2-uwu@icenowy.me>
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

Genesys Logic, Inc. is a manufacturer for interface chips, especially
USB hubs.

https://www.genesyslogic.com.tw/

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
No changes in v3.
Changes in v2:
- Add Krzysztof's ACK.

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 10c178d97b02..00493b962bd7 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -494,6 +494,8 @@ patternProperties:
     description: GE Fanuc Intelligent Platforms Embedded Systems, Inc.
   "^gemei,.*":
     description: Gemei Digital Technology Co., Ltd.
+  "^genesys,.*":
+    description: Genesys Logic, Inc.
   "^geniatech,.*":
     description: Geniatech, Inc.
   "^giantec,.*":
-- 
2.38.1

