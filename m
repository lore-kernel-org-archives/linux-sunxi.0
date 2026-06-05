Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CB847887A
	for <linux-sunxi@lists.linux.dev>; Fri,  5 Jun 2026 07:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780643407; cv=none; b=MXCbbIyA1yk4wdD/50tsbjfpeOv+TxzUBuVhiJoZHCO3wHgbYWKpfZXBi34BPY7EVYodY8uFwchZsaOi4F06FnwlhpeAAyCkRV43ABCP6TdTbkGIdzT5PCZdHY3MCyCEQz2hBbA22snfeMA2cKd4+a5//KYLhWhH2/000VyYdnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780643407; c=relaxed/simple;
	bh=5WZ+tBexvdJk8/8pbvHz1XquFaJAKiQawiGF8mrATF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cr0LHu1ARys1ISgccE1ceVlY5HzpZQQfijbgD428nywcwYEeXZBqchGO/5txCBRiKGpF12EUdqkPchhALBKxHxnw0TpMLB++1XICR+DBwDlIli6OsMsjAlY3TcjOm1nlTwa9WVk4HJvlqHNdbsAUwzWJXYTSDq3j2/IdWriu7vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXx/z+Eo; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXx/z+Eo"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45ef6565cfdso784971f8f.0
        for <linux-sunxi@lists.linux.dev>; Fri, 05 Jun 2026 00:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780643403; x=1781248203; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ti3aO8Zn2qwqlJrE/LtPSs6G2aaVeGfvnqG893sDUic=;
        b=BXx/z+EoxVSl1YVRrgy8fX3ctt0knGFR7ogmPdpYZYFe2q537PKJ6cFIUpt40eRHv3
         W2CwLh5ke478ilhl8CO5eWNkdKt7gNghz4u7JOq7UCHzGuEtvaTMQdhwmxkE9GOflDR2
         EHAGlhyStzzAZWMO5DTCpAL6TXBsbDJaXx3OYInHxB+RMvEUcqcMKgGqJgsinO7Kx25t
         CO0L4x+xB3XnYFznIN3Ihz7hJvgyIMbzu//f+F4ICBMg9if51Ji20uPu7mS8IG6+2ZtQ
         Jo/BBwuOsWcKWjdQ1XSgAGxkYQ8GJkAJ9Lq6DD5I/JtRkxVXvJ3bc0kVYal53S8WLuYN
         2gPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780643403; x=1781248203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ti3aO8Zn2qwqlJrE/LtPSs6G2aaVeGfvnqG893sDUic=;
        b=pokWc0OwTFOuXElyFJ8DavMg22ZfOepF6NaDjThhHNAg0UVSgkxsGm2CNlbt37l1Mj
         HeCoZX+CmrM5zzRMREjUlo2YbF/TcjgIhy0B7fH0q7+QTNOg8ZamIXjZDWlejxo2s+n0
         WLCd7JzuZxJeGBq1SukLTjXjZLZMVnfoTztNTsY12/olpUsE4n41BcgteSXYWkME+c7R
         qT3kwku5o9CYutNqkDCoaGqMk+OgtqOYAIXJPuQv/eCL4wF/Km3Jnup7ovcwbO0EWoPq
         owrXvhQdj08rjDj2KBEAF/JQQSA7PWzkHwTMqZU4azZJ9XvlFUW/BaaOQoN5r0APSISt
         hHXg==
X-Forwarded-Encrypted: i=1; AFNElJ96J4zZeFzRo0v6tYtcYsOrB7OiMxfxCF90HbZXQ9FuqyyC7umqBkW3P0KgkWwRNFZEMqkpSADaigY5GQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxMJRovbr6lCpCbjVo299oeKCNEjA/8HUKLqZbaNATQK2mJW0rV
	1xlQpin9VbH2KMNNPorl09KGIwEaLYE/3DpSVQI0hcMKRddpA0OlHWJm
X-Gm-Gg: Acq92OHNLfah+o2A7W9csVjHXnRmfmTOGFhyRfkdQt768hqxE5c6agXCOnrVzKalwTN
	lBy7Rm2SMkC5xNQwDuuOeVX1R9/4p8b3FAMolcrFtD7GDYR4eC9hbUEMDHLLXUpTujSNcvUXYXC
	2OT/u8jr3u9xWEJErPSxNlOdOi3dBmFc/D89FWWZrs6aoHF/SsiSVUUoLNCA7y9ih3TzB0ouDJ+
	9sGTTRRCgLeSlWtoExBV6emBIUo/vRIvCLJo6uKVmyhhnJyHCOQbe16rgNWlL18DuU5Z5N81WdS
	yWTeWLJwYkjdIPLRGu5QBjufE1p6XPIEoGaJZ4jfG7n8MpHWNRpFB3dnrzhY93nSy1VPWQLNLCs
	iLIfgMPtsAzzhMSIaIiEv5/c8HxfXc2ck5WVvCnYEKM13ftzUjHmsqRtgC/5ZgYC8sOcOi/92q9
	VRBZ2rbkncNrIJw4Z9Omp3voSh0huv7LSKu9lweOM3jIjzpp7CRJpc5PctxoTMvkQCydou3mOID
	YHFUTmaoEgVjT5BwIYSvw==
X-Received: by 2002:adf:fe01:0:b0:43d:775b:c9bd with SMTP id ffacd0b85a97d-460304fadf5mr2671883f8f.10.1780643403511;
        Fri, 05 Jun 2026 00:10:03 -0700 (PDT)
Received: from localhost.localdomain (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm25132882f8f.5.2026.06.05.00.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 00:10:03 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans de Goede <hansg@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	=?UTF-8?q?J=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Eric Biggers <ebiggers@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Luca Weiss <luca@lucaweiss.eu>,
	Sven Peter <sven@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH v4 5/7] arm64: dts: allwinner: a100: Add LRADC node
Date: Fri,  5 Jun 2026 09:09:19 +0200
Message-ID: <20260605070923.3045073-6-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
References: <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
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
Changelog:
v4:
- added allwinner,sun50i-a100-lradc compatible
v3:
- new patch

 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
index b3fb1e0ee796..7cb06b19b5a5 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
@@ -466,6 +466,15 @@ ths: thermal-sensor@5070400 {
 			#thermal-sensor-cells = <1>;
 		};
 
+		lradc: lradc@5070800 {
+			compatible = "allwinner,sun50i-a100-lradc", "allwinner,sun50i-r329-lradc";
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

