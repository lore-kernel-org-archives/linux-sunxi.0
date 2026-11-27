Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795742808;
	b=QIjriP91s7FP9rb63ehfO3mTcqFbq5Qo3hhNzuqb/gg1RgCAr2gx7zvh1F+U+aNPcNrf
	 Ct5NdHT/O36HgL1GQMHgUyHgB8dtGufpTLGKM2flDK0FWI9MrH1yEe1dotTJ0dncdRP5b
	 nBjjfywJzGbS5Dgg+44+jb2qgAdtuMIxNB3146Ugs4Pvzck4NV1ePC51SzWe/qgOUliWz
	 G6MrTHIiRK3jWY5Ou8G/j2QRthrTzar8JIdfakTKGl1ic01fAwo1LPNP/QhOU2d6/3In3
	 mchq2V2jTVUuZCmtK/o2UBvgwHB5ZJu4lELYj/+8JwMpkah8AhtKoHxR9MhGtrPTVJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795742808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aG/KagoNLB3jHRjeL3wtY+SAB/EDT6a7qyc/UcmRA5Y=;
	b=VpzznXB1wGqK+9DQp/IoCiN7j9IP1xqzitmROFa5LRT9z8hJJBrCoIgUJu4uBQRqTc17
	 B4ayBn5XqV3tX/2qo5qdlXFMqySa6GUFbRhqRJaHosYpeSuqEGIh84ayUfQMBbTV4xfxj
	 ABIWOZEFzFe5gnm0neLTvguzZ5PPRFBMCj3neloDq0A56BsC/yFSaxU6IOdgn6I32Qw/U
	 4/IDUGivsGMXcl66z7eDmvc+CykuZQW+eXF9bK6YvqOw7gdGRNkmqS9OK4dgG7LjyoraK
	 tR3w5ptgHgfIIUKsuEdnNICTllDvY88TNspqNarb1pHZxkSJbIvPZYINPLkKfr/FuiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NoPKaa8B;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BA6606A31E
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 01:26:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78BA6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NoPKaa8B
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b532dfb874so164433a91.3
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 17:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795742808; x=1796347608; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aG/KagoNLB3jHRjeL3wtY+SAB/EDT6a7qyc/UcmRA5Y=;
        b=NoPKaa8BcjDqM5MCIS8zObcnTnrQz59bIfDSMhOnHKGZmEBpFaGv3irzDUmhuQT75/
         WCk09U+itT2vG12UQeCXoroSwiDNHwys8c7Q1K3R/2v0eXIp90dYdHuktt5vnPHDcPS+
         FroBysPyfi+mnTiq4CMNJPlc+bKyrnKP7I26QpMlIoXgnv4fPjks45FcVdT0yAGzEcEn
         +k6MFaKNsWoativ9N9R31taHkJq5mb7IRTxX/YncX++tYtBA0L3mvjC2eZROiAZap0jZ
         dKg6dwcKkNEVfyA54hitpzuF00qZVioHh0dmwdQ/L1+EjXpwapKxHMa0i1tHEP3oNsZ3
         eRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795742808; x=1796347608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aG/KagoNLB3jHRjeL3wtY+SAB/EDT6a7qyc/UcmRA5Y=;
        b=Mho++XEyjwugbkdiHMyLlH5XJtugkfkRDoB7T6qoRjT8qctj+z3I6TbiDTnYMIVQzu
         iZafFeWneUnrCSP2zVzh6BZ/kdIjyfeX/MWghZgRfsVtF+m9o4ccM2jEp9t5p8MoL1E4
         dSlD3FiuPy9yyR2PEwvybt/jBBXM7HVshGdJkrz22zAjQtWV7UznR1BhFJVTxqoCJZfC
         pNb7PmCV+FYY7IUXSCTPYk4ziCMUiMm0l2QXmP8MIUpZzOLMT3D2Xk6elk0A560++gsj
         QqiQNR49vm/WdMnkEVNQ4tVJdcJ10JpO4BOtzx4Nl+DKAoX1AkRQGO6MLEzjZHJjkyA7
         82vw==
X-Forwarded-Encrypted: i=1; AL+hErG2G7hOoeL4JZUbWpLjkfU9je0GS9XQ8Nqs5ssDsBzo83DDjF8IAmRObALit9DvGjGD6hA7a6IRVlKBDQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+vrmUY9wXZa4G1buuE1qtj+NzASdZVgEk3TGtAD3ae+Vr5kyg3
	mSXk0HkoJ8jx6B1+JrbSK6rwwPmuwbbWTnO7+/69jt4RdJUgcovphsf+
X-Gm-Gg: AZFdTZcv1jC29b1CIIt/YF/G2sFFYGs2V24qqCYHxnrs0fWJtBHy/biR3OImgDtNxY6
	dLzXNfVD2dQUZ2vU0rZtYY2ktxqz7YoArdNKMTluuoyQ/vlYW/Cz9CeL1/bVoL6aCRAr1z1qymf
	pro7ZqA5JLP1nIpVmIPDApeicnTwCdWEuGjycWq4iU22r4ebTrvB4AN/sHY4WepU+DpgdDAtV11
	RRBzDOXqm45OqEc99Qkdxacjg5vS5P69Clg4QxMKNRZ240ijlq5ZLvHNl5gindi14wANRckL5A2
	QvM3lz3P1hjDGkxkSa7V6Hfn1amql40Nfy/Vf2AIXtiWk2wGPzX9NwOcpzokzEf6gkbC1oB9eSm
	vbEbaKCsZ3+Y95sfjCq50NSLCl2rWdOkQBjRS+fiK+ZpOYRuolmkuWo+0w/zezqpKc/iLTh4ZnT
	jkMgCnfrDJ3aq8lm5kjMM1FiSVXurc6XtpFWV32JQzhvy7xZ8AiWAPzJzarjYsb6ET2nqeMiBHW
	akJNslgyTOBl93DArtt3SYLUFPi8iBw00rseYI+3LqfNtREyqKclozkx5AgZfulqYo4x08uwbXm
	C3J+4l9W4Ct8Ajwrzuwe/9Bs5375Z7DH/L0qXS0jlVC3Fd33U/HMzsQTtsO+0RdHn6Y4/dhomZp
	J3ZSi9Gf5xqrH0P4zv8pUHtSe7V46691S6bxMgDeID+nz0Q==
X-Received: by 2002:a17:90b:1e4f:b0:3b5:35eb:5ea7 with SMTP id 98e67ed59e1d1-3b535eb6056mr549399a91.33.1795742807761;
        Thu, 26 Nov 2026 17:26:47 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:1432:1241:93b7:7b4b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm35042866a91.4.2026.11.26.17.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 17:26:47 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH 3/4] dt-bindings: iio: adc: Add the PocketGo S30 analog stick MCU
Date: Fri, 27 Nov 2026 02:26:11 +0100
Message-ID: <20261127012612.1589039-4-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127012612.1589039-1-romain.tisserand@gmail.com>
References: <20261127012612.1589039-1-romain.tisserand@gmail.com>
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

The PocketGo S30 handheld (Allwinner A33) reads its analog stick through
a microcontroller on I2C that samples the two stick potentiometers and
returns the raw 8-bit readings. Describe it as an I2C device with two
IIO channels, for adc-joystick.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
 .../iio/adc/miyoo,pocketgo-s30-stick.yaml     | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/miyoo,pocketgo-s30-stick.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/miyoo,pocketgo-s30-stick.yaml b/Documentation/devicetree/bindings/iio/adc/miyoo,pocketgo-s30-stick.yaml
new file mode 100644
index 000000000000..103a11c96fbb
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/miyoo,pocketgo-s30-stick.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/miyoo,pocketgo-s30-stick.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: PocketGo S30 analog stick MCU
+
+maintainers:
+  - Romain TISSERAND <romain.tisserand@gmail.com>
+
+description:
+  The PocketGo S30 handheld reads its analog stick through a microcontroller
+  on I2C that samples the stick potentiometers and returns the raw readings.
+  It provides two channels, one per potentiometer. As the stick is mounted,
+  channel 0 follows the vertical axis and channel 1 the horizontal one.
+
+properties:
+  compatible:
+    const: miyoo,pocketgo-s30-stick
+
+  reg:
+    maxItems: 1
+
+  "#io-channel-cells":
+    const: 1
+
+  vdd-supply: true
+
+required:
+  - compatible
+  - reg
+  - "#io-channel-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        adc@60 {
+            compatible = "miyoo,pocketgo-s30-stick";
+            reg = <0x60>;
+            #io-channel-cells = <1>;
+        };
+    };
-- 
2.43.0

