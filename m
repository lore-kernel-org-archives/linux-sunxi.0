Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795742794;
	b=X7b0SLnlDNp1Ub8omNFChUgDG1kqyN9gUKWvLqymqWfShomrV7mnEvU/T67SuaJ0H9BQ
	 i6HaK7CYdXa90zmAuUEdyzQ3dtV5fspBQb0zY02zp/M0Jfk+m95FJ7x0r6dqCJ+kV9bHv
	 9jQ8TM8Xtr/HYcA1p3bK8QSw+Av3EMDxUt8KdchvQEnxuRKUQ9vdZpS/axwmVNrulYWBK
	 jOu/X8/Wm4yZYoD7XvfmeEcaXKhd/NvTKWarr2C2cz6/GnozH62kve1+y6bOX2ub+2IHH
	 rHfmXFY3ukVfZn7eTzQBNyWiCbRWlQGcz0Ao8NaigGZEMEpDmy58Sw0W+3f8OQ3SHEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795742794;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4ZwWBrnn96TFtHdsd5bNIm5u9QIUQi8JSQL+RPU0pxg=;
	b=mavl4x0uwVuHpC5EqTTzMEV36eJ/8KQoX4HEuk8d9uTaxowkQqNEFBWxtAjSWOwjoEOB
	 xtTfxQkY99lk7s22VKxuTJxf2GL4trZvTU94JQu5Ie1AxW+U75c32DiFRoaw1mMzJ3jxL
	 tFKwpfqAr9ALbswLJsraugtCsTbHYwdDybiU74mjaYHxGrDTlQEW/rtb17CqTfO+jV+k0
	 KPc//lgp0izP/ERpUMWfda0RtzW6vSaNBQ0I7lZpBf0zL19JO58hrCQsp/4ob+SGQe2Xz
	 g1/PYa2lrz/hRcOC3xGwmQBTqhhHSeRfnYgnogUK/AZvsu1XaqnDUgCZNN/c8koNXLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="F/32XpNJ";
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A17606A31E
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 01:26:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68A17606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F/32XpNJ
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-ccca948203aso5334135a12.3
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 17:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795742793; x=1796347593; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ZwWBrnn96TFtHdsd5bNIm5u9QIUQi8JSQL+RPU0pxg=;
        b=F/32XpNJVVGZkfa68cpDs3aPvoVBGVkMc3QHDXVvnzQSZ/d1x7JQa6GK8HcyyzoQvP
         WbPgmPd82Zth8PTjBI8chLDJoJEe+MsoiBGIuvmtQGWi5Uk+TTk6ZQH5iJdFjIp2QD8F
         UQZM7xU/4I2A3PoRzuDkcAnbxDqMxf2wcq6schRXjc2WjZtM444Z5OTJQZrb3E4UtEdy
         6cbWoEysc+G3t/AGPv6CRtCwm9SEgriagdHCe8t1pz9DYsq/2wIqn6GkKBKRYE+CtGZz
         n2w9c2SImleqOhxBC9TdqAJObWcANDKdga+C7BZpPSkfFT+tISoNqaDOcdgiSK4a/PGa
         P+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795742793; x=1796347593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4ZwWBrnn96TFtHdsd5bNIm5u9QIUQi8JSQL+RPU0pxg=;
        b=0/2HMmakeWMkLzqHNarvkR8U38wcQL4afZRkrr8rvLd44GLObho7tpv+3WC00qCdst
         T92WSL5lsG/iCrLwo0yrC554NcQCB2ITKh1svwwNvbtjsyJyO7wAZqseU9yZJOFXuIZo
         mUN+eoCqlxfH8uvGlB29oHw5AHsrZEB7889NM0pdDmx5ec7NcUdxC9CUF8Zzjwvj6vnE
         mCa/hU7R1PkV4xE/+ZMF407RoM7XynDNYefQ83gBHJPPxu51lV+HUFvOGFX3TooAoCw+
         v67w4cGe2XbNgYGpmXF4f+Kq5GRNTuoaU4H7XIpZ5elbzmEzg/d4NGJ+GdqHkZTbbDvM
         75mA==
X-Forwarded-Encrypted: i=1; AL+hErEtMdz9/bd6eJfoXUq6fs0mROfAYVwyoFIfsMHkMUEwrOFvcuoUebUnpOo1ZJFo2xg7SeOcn2OfcTmJ+Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z9W+aNhV3zRvhipQcOkvJUmh/v18e22bwbbgjy35pWjshEpLoaf
	PhjKfhZ46s9tYBLTVjEzrbxSuhY/CWXK+w7neN4dk/bowWltcG04B90p
X-Gm-Gg: AZFdTZc5NF6ci7T+ruiT+hIUnifekFu4x56250xuvjOFi+NloL6iJqWqRxYxzMy0FhH
	ZctaWgOzZOfHbqiOPBzEZmCDWzf2nRBl6kzv7SnJ9MwhqUY2aSayeTX1kDkiR3JkgvmltTCXkwA
	qOojtpgTiA6cD5Xs05Qcy2dc0xxEu9OifyiXcUKoc0ZAakm8CMLBlrDJ+fp+0XdlCDNGkhs2bji
	tQN+3gVH7ErULaxjUQFPG9OfdBJMYqPJQqzTlRbflEw2Cq8/y8I3Xe2o/WINPFlNdRHAVOblObv
	Pm0X//r0S5gmtjPfs0oflnkaQMjPxIKEhDufZLJug5u18oLQ95t134QI4Cj4Sxlj+OHW0hPtMXU
	ejPXfpYERi2FH0HVfq/Z19+bgaD3MXoIat22ZKDxX9XWv+ocOI+irPVU0cTPwpduvrssi9Qpuhm
	0KqAG9+AD6kICjO2dEf22HxO7vlloLP31MiQfxZnakNRPNLOF4WIIhzp7+FS14k6iPnvgGwBV0A
	Zk4QNnLJpPL5t9KDOEnDAovNQfMjGDa0fnhP/s7HAqfwfav0661D+dDVW64rYQIf6Y/4irtO/BX
	oM59VewAsb8tSW+ChQ48P82Peoec3MuzLrNV95uN2eQOkvVikyBcyaBiHu4limvTBv22YbW8s/E
	Vqem22turhtOGr806I6JAf1R7DD36cYoBIst9JXkRynPQJQ==
X-Received: by 2002:a17:90b:2f8f:b0:3b0:ad59:7199 with SMTP id 98e67ed59e1d1-3b41c942629mr20023312a91.32.1795742792547;
        Thu, 26 Nov 2026 17:26:32 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:1432:1241:93b7:7b4b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm35042866a91.4.2026.11.26.17.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 17:26:32 -0800 (PST)
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
Subject: [PATCH 1/4] dt-bindings: iio: adc: Add the Miyoo A30 analog stick MCU
Date: Fri, 27 Nov 2026 02:26:09 +0100
Message-ID: <20261127012612.1589039-2-romain.tisserand@gmail.com>
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

The Miyoo A30 handheld (Allwinner A33) reads its analog stick through a
microcontroller that samples the two stick potentiometers and streams
the raw 8-bit readings on a UART. Describe it as a serial device with two
IIO channels, X and Y, for adc-joystick.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
 .../bindings/iio/adc/miyoo,a30-stick.yaml     | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/miyoo,a30-stick.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/miyoo,a30-stick.yaml b/Documentation/devicetree/bindings/iio/adc/miyoo,a30-stick.yaml
new file mode 100644
index 000000000000..6c0e997d4ff0
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/miyoo,a30-stick.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/miyoo,a30-stick.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Miyoo A30 analog stick MCU
+
+maintainers:
+  - Romain TISSERAND <romain.tisserand@gmail.com>
+
+description:
+  The Miyoo A30 handheld reads its analog stick through a microcontroller
+  that samples the stick potentiometers and streams the raw readings on a
+  UART at 9600 baud. It provides two channels, X (0) and Y (1).
+
+allOf:
+  - $ref: /schemas/serial/serial-peripheral-props.yaml#
+
+properties:
+  compatible:
+    const: miyoo,a30-stick
+
+  "#io-channel-cells":
+    const: 1
+
+  vdd-supply: true
+
+required:
+  - compatible
+  - "#io-channel-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    serial {
+        adc {
+            compatible = "miyoo,a30-stick";
+            #io-channel-cells = <1>;
+        };
+    };
-- 
2.43.0

