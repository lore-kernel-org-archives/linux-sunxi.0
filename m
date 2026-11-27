Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795762440;
	b=s9/2PvnshOrRGLcKhhnAoYIe3r98kmaayNij3eE3CAd5a7tfzPQ9p0hrPXkYQHMNlK1E
	 //qI42JZTyw92UuODWFdzgKhktavmbsAuxpL0ksp2YKkFPYd50Zd26DVCLu68rbaD1dFq
	 MxArjcUMCS1L0yuc/TlMjjrfgtSWiQxGt+IQYqkRaXtGaYKOV7BHcDV6REskG9Wh7328e
	 ptyKe7HallWphqh73teRnxuVrAJLqm9vjvi2bBkaozfyhbJb2dZkn7YNpjCQnnN1Bjw1f
	 PGZJNvhXcJSGZOsqytKBqeY+EYO5Nlppo/6BOvGQEvfhHPi8k2Jh6Y8tPhwRCvCUEGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795762440;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ncDzTHpCPV4lwKcdX/E+CqJ1ByUzIH55tg22LmuRbMI=;
	b=F5YUkkkFEhc2rsw0E3VEtsfK8ERXvl9fVXe878ee989eAaEJfFiR7ljs7gDi3DBUuox6
	 9SFr/sEZIfzTarexS6juBai+KHkHugX/7E4+YR4xh3j15iwO3q4yNX9OlQH5eEfuDGoJa
	 pLyEw8lY2qkehueajbzAssmwMu4oSTIglGClEuVao35wegCpRq8WfaKcTLbWvLgN1WQuT
	 su+KJZOJB+ueahhM/OOGNlfnDJvraBFycttv1l4oyg6e4rna1RI8QAHKAnv2HDhEBZ1zi
	 3Jry53bzTAseXq/tfNX7+vDW3JD/VzADQ5iFOTmCZgZa1Dl44uSHf+BFzwj2f2zVwDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=P0q1BjKX;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE2B606A324
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 06:53:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBE2B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=P0q1BjKX
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 17CE74C953;
	Fri, 27 Nov 2026 17:53:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795762432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ncDzTHpCPV4lwKcdX/E+CqJ1ByUzIH55tg22LmuRbMI=;
	b=P0q1BjKXojKbvNl8JdxL3Hi5fPTS0hjWeXi1UtIBm0xTdWw5trRZIVh3c2doFDoiLbZEj8
	PYmTbVNkmw8uh8Qw/HHYWXiL4RvE1JJCR+EFKYyz3JNyp0bNv2+X6ZSVxPKPWy8pyJ77tj
	MFUG65jrMPvpH1/tikQZ8ETwGS/Al3Qjy2JG+5Nftdq0aT4xZ+AEjhetIvoijNYUAZ+5CR
	ITFKVUVxn10SkzFW7hewbeEJ3X6qFhfohxtV6LgMlCP/wNz3VEDPSgjHq/RaR15rqBS+HW
	6jiN5orSED5xebufw5IqvdywWN0NRmJCymCqTBCalPMRdDyog+FRPiYMSPbX1A==
X-GPT-Reason: legitimate personal/professional correspondence.
	The email is a standard Linux kernel patch submission ([PATCH
	v2 1/2]) regarding hardware bindings for the OrangePi 4 Pro. The
	sender's identity (alastair@d-silva.org) perfectly matches the
	intended recipient's domain (alastair@d-silva.org), indicating
	a personal or trusted communication. There are no links, urgency
	tactics, or marketing elements present in the body.
From: Alastair D'Silva <alastair@d-silva.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH v2 1/2] dt-bindings: arm: sunxi: Add Xunlong OrangePi 4 Pro
Date: Fri, 27 Nov 2026 17:53:42 +1100
Message-ID: <20261127065343.1449675-2-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127065343.1449675-1-alastair@d-silva.org>
References: <20261127065343.1449675-1-alastair@d-silva.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the Xunlong OrangePi 4 Pro board compatible.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 7a7f96f21f57..2fdf614e639a 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -1043,6 +1043,11 @@ properties:
           - const: xunlong,orangepi-4a
           - const: allwinner,sun55i-t527
 
+      - description: Xunlong OrangePi 4 Pro
+        items:
+          - const: xunlong,orangepi-4-pro
+          - const: allwinner,sun60i-a733
+
       - description: Xunlong OrangePi Lite
         items:
           - const: xunlong,orangepi-lite
-- 
2.53.0

