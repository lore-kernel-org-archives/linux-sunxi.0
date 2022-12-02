Received: from sender4-op-o18.zoho.com (sender4-op-o18.zoho.com [136.143.188.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9277D1C03
	for <linux-sunxi@lists.linux.dev>; Fri,  2 Dec 2022 08:17:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1669969043; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YnUPjnsuIe+0K04IK7XQmhRRfK2SNlpJMtnX0fxANCuZlPNalSovgjBoy4al2bdHmlUjFonc6ceHBbxhewlR0ipyEkT9DfwBLUIGpozo9AFJiSRKHyfRMhR56gfvpQ6cXnItQQ3rGYeOUsTSSym6g0hSSRvFnvsmGuF2VJTq4Gg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1669969043; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=Rratc0OttPrJfv5oyD9jUDBZ1BW+JJIqS7W6aA3RiwM=; 
	b=RnQgn1KvbYcZ0Gpb4QyLihaYgoGaYwGjmVmu3kqRtIZjEyEiotY0IiS6MCu5KgMKGh1uWSYZNuAvT977IL8Pwy9ADnSvswxo9xeKHHteT5zjyQIOANxzmdLMlDmaTsYwLnLvgQkYcytvh/rsSbsznU6WGr45+ymAaHVK3IKus/A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1669969043;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=Rratc0OttPrJfv5oyD9jUDBZ1BW+JJIqS7W6aA3RiwM=;
	b=Pt8k1vXB48VEjsvLG8jmk/IqR7ZjDfDdPMvjsHtUbuy1aoYkr9/WYq793TQfWSBA
	ClQtrKX8RfPP1azvStjDOW7gXktvhV0aLNUSGg6Y7jYImsdBmoLUbgFfOuXF6+u5oFG
	sxVGiw08G0XBhDU9CHz5ms0F6/4PR6Gy8psXK3m0=
Received: from edelgard.fodlan.icenowy.me (120.85.99.229 [120.85.99.229]) by mx.zohomail.com
	with SMTPS id 1669969040692988.3765698302417; Fri, 2 Dec 2022 00:17:20 -0800 (PST)
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
Subject: [PATCH v2 1/6] dt-bindings: vendor-prefixes: add Genesys Logic
Date: Fri,  2 Dec 2022 16:16:42 +0800
Message-Id: <20221202081647.3183870-2-uwu@icenowy.me>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221202081647.3183870-1-uwu@icenowy.me>
References: <20221202081647.3183870-1-uwu@icenowy.me>
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
Changes in v2:
- Add Krzysztof's ACK.

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 6e323a380294..43359c0ccaf5 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -488,6 +488,8 @@ patternProperties:
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

