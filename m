Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0651D363D
	for <linux-sunxi@lists.linux.dev>; Wed, 16 Oct 2024 23:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729120407; cv=pass; b=V6AzVyS4MEsPAP/geGQ/sERVBrOPqQ+uImL81w42VTMtw5jRrngs/9HgUEoyszGJ5/+8qKeQc4dnEcVg29LPXPk94N0XRmQDqlI6tTNEXMyc5Ko7Px5PC/XFM15CCTUkVOQTHM9mxvHuLlTkYPQwbUbpJUj4lQXAFuEFmdwrujM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729120407; c=relaxed/simple;
	bh=QxD1wOZue8qPc1r/LIzRLxUq0oQ9AFAao0DTFJagviI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LXXoBC8/t37XepJNPgvD5HJjSL/M85N+XX9Sqf/NXwg5cdz7/zjetABHLn4OgvUNniYV0p+4lQQkjYjdaGQvHZ/HwXzUPM4eJBHQvsnduqCIC0swQDYPQRZ+8m6qq6F7blJC4OhfuLqYsvDYKHF4se5eKgZJl3LHGkZP7UlZ3WY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=mb+hBcDy; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="mb+hBcDy"
ARC-Seal: i=1; a=rsa-sha256; t=1729120397; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VMp4Hz33bkVA2A8PlupzI4d2ciomAMiIWpcx7UGqCtsbONemkbbCk7wCZwQEW5fM8/DxKHdD670cCBZAsiom5Ogey0nh8Jaobv+E0NHQxDvVGcbnQfxeT48qCEQITcccLTB/DFcY+6bG67bCr0WepkZBHSKYBhcjg0OpEMoXkOE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729120397; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=CDKEdyyU+XmoY3MLHY43J+UFi/e5dgEcLdTPDNevPqw=; 
	b=gmRGX5I/OdlXr8eGXebj3qIzxPUs2ZWAzBoeyY/wc8olyuF73FrSNaAenAOKeS7Mn88BTmwOI5heEZ8d0FVM5Qw8pmlN7BoRZIIODAzJ8EPyWDNSwd9S3jZ7nVPlSLcBicmf1bTIXSp5cGpJ400g7bxuhG69SkgEfzRrCQZSeq8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729120397;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=CDKEdyyU+XmoY3MLHY43J+UFi/e5dgEcLdTPDNevPqw=;
	b=mb+hBcDyrU/mLAXW3ptn9kZIGtzmCMyDdXEJzqeT+LHXsytk+K2IdKA/s2B64YCw
	d35wme75uT6ktCbBcLiGYkM1um+9iAWhD/NolvBVlGGoy1/89pFj3O1NCOPycnoDvzP
	t5O2eG1v9zAUGLQABvv/ZkZo/i7r5h+ExNOaB5BRlQeZOSD0KNmp8lBFlQGR8L28SvE
	5Lk6RnB29WGhbfyrLq6/+7Vp5QhPpVPy6N1QMYqgkf3JvcpoSB/wmnsdPqpWI7kiizD
	H5O9s1wH/5gG38cArvukG3Qql65ML0AeODX/Vn/6wLanpPxzH1Kw53gTL0UdY3ay578
	PNpcFIW+Ww==
Received: by mx.zohomail.com with SMTPS id 1729120394706502.3949692946112;
	Wed, 16 Oct 2024 16:13:14 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH RESEND 1/2] dt-bindings: arm: sunxi: document RerVision A33-Vstar board
Date: Thu, 17 Oct 2024 07:13:01 +0800
Message-ID: <20241016231302.1042278-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

RerVision A33-Vstar is an evaluation board of their A33-Core1 SoM.

Add its compatible (with the SoM compatible) to the sunxi board DT
binding file.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Resent with Conor's ACK.

 Documentation/devicetree/bindings/arm/sunxi.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 4aa15f3668e03..046536d02706f 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -846,6 +846,12 @@ properties:
           - const: allwinner,sun50i-h64
           - const: allwinner,sun50i-a64
 
+      - description: RerVision A33-Vstar (with A33-Core1 SoM)
+        items:
+          - const: rervision,a33-vstar
+          - const: rervision,a33-core1
+          - const: allwinner,sun8i-a33
+
       - description: RerVision H3-DVK
         items:
           - const: rervision,h3-dvk
-- 
2.47.0

