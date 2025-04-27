Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C06D1C07F6
	for <linux-sunxi@lists.linux.dev>; Sun, 27 Apr 2025 14:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745763936; cv=none; b=tC/5zmiw+mNLRi8ao8WbGMytPKUXKaCHFBeR0nlEKeBEQF5nJWqgO+LzT3JIhPLV+SrRQkgD6dN/VrbQ3tv86RAwSN9TFxVUjSslP3RPDfkJfGad5RZ44FfpHMZmcbEVIVHWolRqq9daVbH6TMxiim3n56yImr1y0L8NJkZ2uQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745763936; c=relaxed/simple;
	bh=h43/JFNo6LCvxmTnoJsqQ2wSk+f2aaZbipXz39J4cxw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jI9xM1uvhZpsfWv0RU/LkS9suPHymMv2HHFtDs60YPICPL9QvYT/Polod7zPKRs+FFdI0NxnoxdMQ7YQV+lqXskwIYpA7lCcO+b7J2JUNKe3YMqg+zGMOdl8f3STV+gQVMDG3USYTjFZmVZJntqUUcjE2EO/fyKRt8c3r9lxd4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XRDFuzzt; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XRDFuzzt"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-317f68d0dffso40887551fa.2
        for <linux-sunxi@lists.linux.dev>; Sun, 27 Apr 2025 07:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745763932; x=1746368732; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ehkKd/S9OU9qUgpjp1lZbmN7V0G9VzQJCuY2t4gA7ss=;
        b=XRDFuzztZF23Bmh0FnxfpkUUTSASbrcrmlRHec6VGN497UjLzf6eJSVb9D1L09GhQA
         +7SoE5NH9cxLWiF2vz51NGiaHc7KbAhopjhylUUY10LmnPSvb5sbI07IPMsS4Zw2SnrB
         IOrbBOR8EVFdBkPgNuEJpwH/PhfYaCnY7E01vtFha2bg/jilAMaT+GFEP7rWiGdoyub8
         RGWJ0MCgH3yST9nGuwRwlLk7kRSMT/0Bao/qBVN25UoK11dqvwvje01GeyqJllTAKjBG
         g5hc+suzGUSTFQac1lMx9trwITnSsjzC55p4HaYSrJ8iHnYRyNz1hcmhYcQCq4JIUM7Q
         8mZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745763932; x=1746368732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ehkKd/S9OU9qUgpjp1lZbmN7V0G9VzQJCuY2t4gA7ss=;
        b=ge8urPZAJ8e4s6B4N+dR5NOuSY/3XDWuxzoprKYD7GuiVTPuOmrnnUSzNmGZFNSY/U
         tx/dlH7Cyr8YVXHVvsTT4wNz6W4MJFCBPwRMQjndwKlvips5DG2m8wuU/c5L/yeRIBQq
         /VA9cHDxHwuJjKQqcD9FaokpNo+MHHT/rnZt52K203WL1fK8q9EOwuA96Vsjbp+tr+v7
         iJ7ubNRWGyrSvl5R2ufn4oB7MG2gPEnRjHAdw3u/uVerL4bgIrpJi4xNleeYUqWxzqJW
         tjbNKaeejhU6/AKpTj9duykOYb5z/Gddvb166P20B/Frk7INc2LB44w9dmCsMGhLTqmm
         cWZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCLPVAeP7o+9UR6cBllB4XWtwQVQrANRuj6tJyP7tHvW7vf7YtbLNUsVYI2X/w+8C8RLkFCknBnx/icg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxZH28NKx2+mrKLhljI5K3cw7nOt4zKCOiLYWnZ2biiyJYeMxB+
	ejB/52I7mBe8+bS4ZoISt+EF97f6TFQPr9xachPCVGtQ/IlKo7c=
X-Gm-Gg: ASbGncuf6garr9l5Z4qs8aCCqtA+f8OI6nsGmiAQ2LObsCvU4GR9vMxvq1KIkxw8E3c
	kfUpdMvbN8os4F/lQczTHqUhY8GhFReZ7HxR3mTSo5L56QXFLHZqeJNH3wBMAY+RF6i7L11LbC7
	QLF7ngq30Mbk2wXnJGths4asKwHCzwo2+JWDWvmK/wJjdXQK8NOCBq+gbWIxWNI8ieY1KQ+xswn
	j3g9UbDgVkfDDOvqflWkn0mfBvuFePWWM38eMciFY2fWVahqjPucDlRSOXZYF/K/8aXCA1wwBUn
	xTPwHFa20kyRYAhwBkNFN7txfiLhhw9bw5QiMB4WegcFOBAX57cnEHA1
X-Google-Smtp-Source: AGHT+IGLFpAqg2RLvOpyGg3GqdGLS7yvAzNGtXYHl5esGTKNk58qPrWitKbJKkJMbZDpUAYewQ6wGA==
X-Received: by 2002:a05:651c:12c9:b0:30b:e983:9ba0 with SMTP id 38308e7fff4ca-31907022667mr27391711fa.23.1745763932152;
        Sun, 27 Apr 2025 07:25:32 -0700 (PDT)
Received: from localhost.localdomain ([178.176.177.108])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317cfb482b1sm17659191fa.29.2025.04.27.07.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 07:25:31 -0700 (PDT)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Aleksandr Shubin <privatesub2@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cheo Fusi <fusibrandon13@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v12 3/3] riscv: dts: allwinner: d1: Add pwm node
Date: Sun, 27 Apr 2025 17:24:55 +0300
Message-Id: <20250427142500.151925-4-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250427142500.151925-1-privatesub2@gmail.com>
References: <20250427142500.151925-1-privatesub2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

D1 and T113s contain a pwm controller with 8 channels.
This controller is supported by the sun20i-pwm driver.

Add a device tree node for it.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>
---
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index e4175adb028d..2c26cb8b2b07 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -145,6 +145,18 @@ uart3_pb_pins: uart3-pb-pins {
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
+		};
+
 		ccu: clock-controller@2001000 {
 			compatible = "allwinner,sun20i-d1-ccu";
 			reg = <0x2001000 0x1000>;
-- 
2.25.1

