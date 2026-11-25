Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795610671;
	b=gxb9HVCqGL1kHnWEDV92wy0mCIw/GO8BNseTxVR+rOPhR1bLgEqG4WcMSGFrWUU0q06D
	 Jb0BTXqq387BAGuH9KY9G1tTxjqRo4lEOWGOspGLSpukBvDz9Y8nZSf8Bc04O+1cSknvt
	 Sy1iFQAYlwPNGReywRUQBGqr3bLsrcW428tHRjTyyOSdk7cCiR90fAkxbjNU+1GRuBvxD
	 WKcX5ft0Ps3/QNAkRH41AIJpasxy7k4n30bF7Scb10tKK3WI99tf1qXPWmFitoUE8+q+y
	 dd1PPW7wTfzbVWQQMo/gYqSkXAvnHNQMFTG1eqK3jqL/0mQKy7F7Q3RGM1lfWtjBYPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795610671;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gnYPQTYFWBK1uLMVrW6FZpDAtRNAKYO1rW8iK8WK7oU=;
	b=dqjvEA6i+tex8f5krVpyrXX4wYapeuQeRQVvnAigQx45pN+U3LcHNbIhBtZbSypo+d9R
	 B03vAW9vfxzRird3hjfB1Meu/XEsSWsz8osIZ28xHNe6Vc19yGj4tsvTVxIpTTZ93KLrn
	 BkuVZuzEVu6pU8VabK+3YEUHE3+WmFW8YMDxorqDa6xJhy8fqH1vswmouwyu8tw23rW7W
	 ghr53Wcs96WxkKnZnL3gHMySQ78iYUk8nHOzqfFfQ9Xt5FvlgnmX5iewnPnRfQ/Rg67TX
	 gUeZ3wqTxTUs3zn8j1f9RuAzFlGKK8c8B+aeU0MxKFm8p28ZuODTcy5VkD3UeNVDu4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=W3s5i7dx;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7C6606A335
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Nov 2026 12:44:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E7C6606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=W3s5i7dx
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 276154C947;
	Wed, 25 Nov 2026 23:44:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795610661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gnYPQTYFWBK1uLMVrW6FZpDAtRNAKYO1rW8iK8WK7oU=;
	b=W3s5i7dx1cqoh2yp7SL0bkYZZnsTGfH91vXY/yYDoyoRUO/Xoi6V+s3ef/ur/FWX4IVJd9
	VALDLkBF37skmf1cAS7CSDtVEfrYBKYouYJWqz1paocR1EMu3LEzr1qvRsxOFalOzkxdxY
	JRI7xGpF1VnKWdyMCAKU2Z+RBqvFjaKEMzf9UcO74CjRBIrKYC47mJrJdfie8u5M/g7QxN
	6tH/qPGRoxiOyM1p1glg4ATkR0ZegYBlN9lNUvhkPbGa/SlB1uCCxz8MtNSYAqFosYgZEh
	z6r/2Gn5zFjVBC+ZzZujN/dGhLnbbv5vE0kOAv/eNA977ijfDpvYvzxAXhPL7Q==
X-GPT-Reason: legitimate_personal_communication. The message is
	a technical software patch (Linux kernel style) regarding I2C
	bindings for Marvell/Allwinner hardware. The sender's domain (d-silva.org)
	perfectly matches the recipient's mailbox (alastair@d-silva.org),
	establishing a clear personal/professional relationship. The content
	is highly specific, non-promotional, and contains no phishing indicators,
	urgency, or suspicious links.
From: Alastair D'Silva <alastair@d-silva.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 2/3] dt-bindings: i2c: marvell,mv64xxx-i2c: Add Allwinner A733
Date: Wed, 25 Nov 2026 23:44:06 +1100
Message-ID: <20261125124407.4098345-3-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125124407.4098345-1-alastair@d-silva.org>
References: <20261125124407.4098345-1-alastair@d-silva.org>
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

Document the allwinner,sun60i-a733-i2c compatible (with the V536/A31
fallback chain) used by sun60i-a733.dtsi.

A733 uses the same mv64xxx-compatible I2C block and requires the
SoC-specific compatible for future quirks.

Assisted-by: LLM
Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
index c4efcef59133..2a9e723a724f 100644
--- a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
@@ -34,6 +34,7 @@ properties:
               - allwinner,sun50i-h616-i2c
               - allwinner,sun50i-r329-i2c
               - allwinner,sun55i-a523-i2c
+              - allwinner,sun60i-a733-i2c
           - const: allwinner,sun8i-v536-i2c
           - const: allwinner,sun6i-a31-i2c
       - const: marvell,mv64xxx-i2c
-- 
2.53.0

