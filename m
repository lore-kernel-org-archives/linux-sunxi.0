Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D10D1A6813
	for <linux-sunxi@lists.linux.dev>; Sun, 17 May 2026 23:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779061289; cv=none; b=egsFWuwEy1bvsV9BxXXRausIrB0ocxXtuDXCg0bbiyJ1sXOjthk3MIJLLbeoalknL24w7APGXi0ImTcU41LNkrS+ivpu8ms2Z29nDf0PjzmYgT3Sd59cqzu+phROAzssWKVk6S5Ml9wD1IodwhQt+xvLYaBGERF76vXWo3NxuQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779061289; c=relaxed/simple;
	bh=e3BakOiIkbxUPegUUabz2iD6bSOHgMc97qZrJo9OOrM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dwXcbFF5R5jlFtmFtDNJVgSrbwtc3Q+ZuyY2LKqvLnC4NR43hq5MHzCuPDCpTMxwVSxJcl+LUEAHGzLlbQ6cFjacHzvy8y4YSIgCzRSwEBPuERYuzR2DLrwSwI2mletyBnoIIOs5SxXuR5s4fFZJy6g2py0xeLojb+HWQwlz7T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WxoOMyyB; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WxoOMyyB"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45e7c636e74so184643f8f.0
        for <linux-sunxi@lists.linux.dev>; Sun, 17 May 2026 16:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779061287; x=1779666087; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fFby9i1jhlPu5HJbXvVneKL+o1hXPAgNpBdPwBqhzJU=;
        b=WxoOMyyBomfBdxjYyBEImQST+iGvE1vXzWyEenCCVU0xl0FW8MEIzd9vCv9jvfb4A7
         A/Z1KzDWTjfRygoMRlOGjU7wy1JzDgA8C+tXVMW/I9fVOV65RjiDSuRNuHTbf/1B7IjX
         u9PzPMoRHu5mumeN/VDFqP13EDadMIJw1S7V8Vfje05ksb1jI1DthSKv+aQ4pDHcA9Z0
         BaNLc2cQliuqFa361lzrNlbhPTIg+ohrNy90BoTM8VQD+BmBN9Cc4FeYb/1SnrgE89Pj
         NDTCaycd80MdK+6l/QQd63Ms80KF9ZPr4eIn+bz7bqzGSjKWCN68ALqW2rGwfTUO2qEB
         GWFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779061287; x=1779666087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fFby9i1jhlPu5HJbXvVneKL+o1hXPAgNpBdPwBqhzJU=;
        b=QbzBpCcsAURu36EoB917ClDNWZPtlt1PbNoSRAlZTE04JeiG4NtYUcTQm+OYfOELgq
         Q03LTxvxw3iCA7vGzMB3LNIdRsRcuRR+6EB2YFtqBXfZW8iJOfxYSFVe3UiLW21sX2Xe
         k2oXAMrqUTmk1V4pdHTRwVpZgbR0Rbw5dqUeCNaYAIoPs7ke1b96237vluokdvwEmGr/
         XrXRvLK1p/yGMzORgsmDQwi6cobUqUP6UNQoPi3i4YoELjtuve0kPxSvzKow+GdEmPlG
         aLKS0hbkYNTQbkIhrL3jusl4KnUd11XHaWzI1TJWeOuyz/PvBDTu7LX3w7w2vvHzp5iB
         9QoA==
X-Gm-Message-State: AOJu0YxPgCqgk/8Sa2ZqZqxNb5uI11JmREc8Ya1emVpZTJvVKEyldPz7
	Ri516q/zCEeKXcvmNInG0vlocQm+bzzbPxf/ydcn/t8/D7iyFGk+hvYvPaMopk1N
X-Gm-Gg: Acq92OHRsWV8K5lfRvaVIHwXWFozg8/0C2QnH4Mtft7Sl+MhIhAgAR5af+gAQ5UiIeJ
	dlzKPtDhN8RvEmCktp74ZG9+wdDUM2YifiqTo0d43Xenv1cptToutNcH4EbjdS7YvkFZGSbhWt6
	pE+UHHbcjWuDzfd3lw10C2STzLoNTmv7pzPvuvoTSAJnptCbiWYMi6I6WJQQLEZk7ArZUc4LggV
	shMzykZ5cP/aJFrim0aOAog8PFXdq3lcUdsAo9BPPbzb0Xnb10cksMm6UimfCpL/xW/ig6BPHhP
	t/ZJqJ0OU/lvUbruRP7byeNy4XIVKb+ptT50oIgUQa1Xo7Eh3gLchPejxzA54WUbFWUwIqKF6hM
	6dDwD7qNvQ7CMw7NJzkQlvSnEcCjx8I+pngp6rfh06jxtbLxqZoBFCHU26ZwlilhW3EK8R3nlAJ
	w8QRVXA047MUfcki0qWlUpOhMWnuKfBZXaxcBuCreLhE5WyfrTxqPsM4u1bQsEC09iOO6YljDgO
	7tPssygH2E=
X-Received: by 2002:a05:6000:1b85:b0:45e:739b:2748 with SMTP id ffacd0b85a97d-45e739b2792mr5067481f8f.25.1779061286975;
        Sun, 17 May 2026 16:41:26 -0700 (PDT)
Received: from localhost.localdomain (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a562dsm32845129f8f.33.2026.05.17.16.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 16:41:25 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/5] arm64: dts: allwinner: a100: Add LRADC node
Date: Mon, 18 May 2026 01:41:29 +0200
Message-ID: <20260517234134.2737320-4-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260517234134.2737320-1-alexander.sverdlin@gmail.com>
References: <20260517234134.2737320-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A100/A133 SoCs feature a Low Rate ADC (LRADC) for Key application.

Specs:
- Power supply voltage: 1.8 V
- Reference voltage: 1.35 V
- Interrupt support
- Support Hold Key and General Key
- Support normal, continue and single work mode
- 6-bits resolution, sample rate up to 2 kHz
- Voltage input range between 0 and 1.35 V

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
index b3fb1e0ee796..2bba13c5d25c 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
@@ -466,6 +466,15 @@ ths: thermal-sensor@5070400 {
 			#thermal-sensor-cells = <1>;
 		};
 
+		lradc: lradc@5070800 {
+			compatible = "allwinner,sun50i-r329-lradc";
+			reg = <0x05070800 0x400>;
+			interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_LRADC>;
+			resets = <&ccu RST_BUS_LRADC>;
+			status = "disabled";
+		};
+
 		usb_otg: usb@5100000 {
 			compatible = "allwinner,sun50i-a100-musb",
 				     "allwinner,sun8i-a33-musb";
-- 
2.54.0

