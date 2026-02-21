Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AD9279DA6
	for <linux-sunxi@lists.linux.dev>; Sat, 21 Feb 2026 18:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771699019; cv=none; b=FUettiCkOQEnUvKzCMe0MQX3Y91vaz9bl5wq+70cjbgnxAF+g8TGhKFtxbytN0pps/vmYDInBS6/r4WCnjITR0w/x0gvTK/NGFePwCJiotu7gTNl14y6G4+84FQREsNDhhoz7W1K8klN8qw1Su5lgrAVgar2WvRnva0fsmKRE7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771699019; c=relaxed/simple;
	bh=vIgGOct6ry2KV3592MeOE+vIaVFPywrg89zWQ5z/wbI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SgeKPR1JnX+I+jUsuw3RHbNFAEJU45HbZGhFVEnT83Bsjl9zgo0uAVvLD86ZrAvBAKUG8JoKAh8na7FjqTwHHdZ+XjVnOYMb89shf+BvljEzGsptje54Bak1hlYiRGjJOpTDXgxZnNtYHH6FqpbEgPB2Pmjn4cmD610bxnspUXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VjYr1uW4; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VjYr1uW4"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38713b53915so29333281fa.0
        for <linux-sunxi@lists.linux.dev>; Sat, 21 Feb 2026 10:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771699016; x=1772303816; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vi+zTY3v+XYAN7MEQwL4QN54NaCqF12xnryOs65hhBU=;
        b=VjYr1uW4kZgbJ3VWsqRYWynzPqvM1HEfYoZ/kpgs3iq1TTjiH+6JT23Dom7ieYQ6RC
         +m2ixDh/ECdsQ8tyEVLBCWYu9nrKzi5SBSnS1dpqjqaWWOScv8aWhghbbXc5V+JYI6wm
         uLjwCd9045ny2kY9oRO6/IZchBSrWjea2M23UnfxyQemfd/Xz1c2G6L05alArrgQQKx6
         y5aTJhoc2gLu57C5A1Jn9KIUIHyLRmRiV8kkOg97HoBPkmuLNNvdaZdFJCod8WYTG2v2
         /c0kDCWgKQ5yOhKy/SmQMRrcCnQ6MriM01PwJ5FgkFtdIi7GRehF2kSVuDQib5MuWCG/
         ahhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771699016; x=1772303816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vi+zTY3v+XYAN7MEQwL4QN54NaCqF12xnryOs65hhBU=;
        b=fEAf42WUQJXQ7jT8Noj+b7kvBnbxfRt7sbSCW+C4LcoRkZwnc0fpNg0I7/oi2J4au0
         B/IFyO3E8yV6xJJxDzoLiOUEqLiG7MvygRZzH2QGk9kog8qpBqv0Ax4nDFoECYK+zzbH
         li/9sCMHWSWNnP/t/Y0l5h1t1djvfhlcgSS8u/QEbPeMteEXmdTknDQreBRZwMvoBd76
         XJomX8CFbnLfCm2DKAOQRapL9WCGcmOuamTK9UR9BEyquuZLx5iSh5+MX6P2eThTql3j
         SkHdfgD0oX2OotjoVn5f4QDH3+oTDWJEw35rKApdyMobvwl8ROLVaTwYFAQEtsJUIfLX
         D2Zw==
X-Forwarded-Encrypted: i=1; AJvYcCWZzTI2tW9AccNh7q/TEwllgy+afN8dxPM4LGNVz+nebOHrxNCruotU5ydtAVJToqT9oP+m5UQRqHxLFQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwVGcMO9aEZTBQBtMC2miHYcyZ3cMIKC33aKjsWv8XkyhPFTTwh
	kGfrtXAhwJ7voIwWDe4maJJhcOBeB+0NRJVkl3/9dncTmUfsSRf7nqo=
X-Gm-Gg: AZuq6aJv0P3rRuJYVQxAC3SPP1YNIqXylbPn+q1B4nYNI7x5wNERVjseDJN7eVjX8qk
	Zu1mYTkNh5Tbl02Aghhy3+RKTH6sUiDGfWWLvpmBQNKdSU2M5i4BoE1y4C4cRM5j9EHItOxptMy
	qhrB6RvwCes6KWcGhzR7c8aeV8dTefBShz7ir4oKeSF28siAHt6fl/RNV4xsTLEV8BhE10q7iJO
	zch2F69Y3+44ZwMPxv/thoNFAfPWbVu0FlAycNOIuRSFyea0zm3RptoUqpCLBtroCEsWsLIyiZ5
	qe3+AjGW3H0tn7vzxARV2v0ZiFePLjn+6FWS3/kwo2Du96BZi8ZuEzpfBilHWonfTr8DihZHlbK
	zgiPH3QWCOpVpIwgg9VmA8XD6Mm+ydjM0JA+eDKxci9hYoZWesP3lnwfXyCpoU4p+gzGp8aOxCi
	6CG8/kiakfRAlHtzhj7Bv2nxPKMI/sa1CHwRXg
X-Received: by 2002:a2e:9853:0:b0:385:b4ef:f667 with SMTP id 38308e7fff4ca-3885335b418mr22967171fa.0.1771699015563;
        Sat, 21 Feb 2026 10:36:55 -0800 (PST)
Received: from localhost.localdomain ([178.176.177.46])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a7af19d4sm5006841fa.42.2026.02.21.10.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 10:36:53 -0800 (PST)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Aleksandr Shubin <privatesub2@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Cheo Fusi <fusibrandon13@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v13 3/3] riscv: dts: allwinner: d1: Add pwm node
Date: Sat, 21 Feb 2026 21:35:53 +0300
Message-Id: <20260221183609.95403-4-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260221183609.95403-1-privatesub2@gmail.com>
References: <20260221183609.95403-1-privatesub2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

D1 and T113s contain a pwm controller with 8 channels.
This controller is supported by the sun8i-pwm driver.

Add a device tree node for it.

Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>
---
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 63e252b44973..8e38a0d95f5a 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -193,6 +193,19 @@ uart3_pb_pins: uart3-pb-pins {
 			};
 		};
 
+		pwm: pwm@2000c00 {
+			compatible = "allwinner,sun20i-d1-pwm";
+			reg = <0x02000c00 0x400>;
+			clocks = <&ccu CLK_BUS_PWM>,
+				 <&dcxo>,
+				 <&ccu CLK_APB0>;
+			clock-names = "bus", "hosc", "apb";
+			resets = <&ccu RST_BUS_PWM>;
+			status = "disabled";
+			#pwm-cells = <0x3>;
+			allwinner,npwms = <8>;
+		};
+
 		ccu: clock-controller@2001000 {
 			compatible = "allwinner,sun20i-d1-ccu";
 			reg = <0x2001000 0x1000>;
-- 
2.25.1

