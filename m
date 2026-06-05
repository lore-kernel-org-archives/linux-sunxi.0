Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680FF47A0B8
	for <linux-sunxi@lists.linux.dev>; Fri,  5 Jun 2026 07:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780643408; cv=none; b=eXnShN3yzHofO+18kcTbO4trYaEn6JfgbXAn5sq2+3whRjkNFcA4EYiYCuECZZKdD0I19BVAcTuPzCOFRNxZ21DoowkQeP8r1yqrwtyTyyorSrvqF1Cn8gvFQ9c2Jbch0mQJQ+9oko2KmMuQAWWGqH4R/JuLjjt8RhNCbfSn5YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780643408; c=relaxed/simple;
	bh=GBzyizyPv+xra61B+Vq9gjaajVwxBgMvkwqgSZplbY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k3pRGJ+G2Pv8rHocZZJDwQCp7MbSgApYAjFPAk0YwSo1/MVyR7/9q3zRJn8OHQkqGUNtmAzIMiIOGlVOIh33VG0wuCGwx8GXqbTsibziuqkrJkWEDp1FOz3z9q414HpG9eWRSfFuomjnS9cB4y9Etm8JEKd9buSSh1LONVF3lqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=meDIm0ZR; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="meDIm0ZR"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-46019b190b6so1187188f8f.3
        for <linux-sunxi@lists.linux.dev>; Fri, 05 Jun 2026 00:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780643405; x=1781248205; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KMKMXYkNxydSpTz7ZRDCxG2wY5Cxqn9vnpLFwt0ezvo=;
        b=meDIm0ZRZoKq0tQXDpMg0nfemYRXm7j+rQNOhiCxEz3O7G9CIP4zrQWb9HF25sp6JM
         uKnuM9uje0E9GEnkuzToXfSTrtXTZOlnrP8cMLcrwmBT6aEYw11d/3zb6jDhSg7iwwT3
         3l6t2RVj2X9ECV2qF+/LkBzWQ+v/Yuqzkxxr1IqNJVY4N4njHnvwFJgKhgt7upvJtIrf
         I6ninqx23hDBfWuZn5d5EzrjdpsZnYIsQV4b4GvhbjobV0/bFRWukVNXzmdySVL6B7sR
         rELsZ9JKKKLuQwQw+TSg0AWAJY/Q60ZdU5uP8ozlb6Kl9Ii4eB9fbdxOwjSkcvWgoeYE
         +F6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780643405; x=1781248205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KMKMXYkNxydSpTz7ZRDCxG2wY5Cxqn9vnpLFwt0ezvo=;
        b=P44sw1g4XvM/dvUMUT3bt09UChujKUwySlAmgKMXGJkSRTJWtTuUNPWZqO3MYrynfg
         M3Nzh/qSbPFw52Ds67zHOXJT9w3vSmwxdSpoWnNflBDTljdtK0obKEBzD2gycfQxY9hz
         XBs+Ob1yV4dLQ0uto0dC0ooHFqvYukiLNcM0Prtktziy64L33sXjqOwW0NPrAG+gGjfP
         0D+ZhY0TF5jgIHEqi06lx+6E6O+QZkIZHriuyNt0nEuqGte8ivc/jkFJTPfBWs2cdBvP
         hFv1XrQpuK8lWZ6h5qEA+c3Pe9TUQcKjPOBx4YnKjK3x6xLJB5AcMGW+XGJ6pUm2GGvW
         pUNg==
X-Forwarded-Encrypted: i=1; AFNElJ+pQwNJOw2VCTxUTDnBIyMjYsGik5MfYCBwBovGyGzCtzK3FxO/sW3NIOPT9LrFZVoGJQVsnlXD7Kujeg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwwxQyOusb2pLpY6qoUZ63SdDoscExHRmvDF447F3XpLmT7yKrn
	eXs0x7KkuNug+xN7wF1NdQQzoyQfxACCanb2dwEt65hOOUGL8Gc4gx9I
X-Gm-Gg: Acq92OGFtcbXw3TNnH4ZP9Wken54MduL20aiZPh8+3V4rsqzKZkWllWQ5PLKPtXYHKa
	6slKN3l+KHWp6LkVuoVsRBwBytyA7thk1iGAOvCfzvj8FG1vwS8ijGQT3iD8AF7rDx+gkbjjuTt
	vLZjz8md61HCmqItmq7OYr/UMICK98o9gsypZsdb13TO5OI40TzUuKsCbGbhjzKtS1sLl1wR0kb
	G2lV8KCqZFfazuxpbpvRCIHlOmJPPp3Aj9bCQrrmWMp22vHzCP9xbC9Y+XMJZ5DTm9uogxnm6+E
	cda376D0kmsepwnm5jkORCRetORW7Xjurfs938xOnnIDwJJbyR6kyBwMWJf+wOF2kTD1ICTzkyR
	eWNLoUp46gmOOg64UOhqaKaoQ+FkJ1f1GAKhheAT0O8+8kLX+CLha8CAa29JRWERynExXPPyrBT
	dWwPAp3hyLvR83Sm4bun33Gojl2+5mw43M4VLgJGrHizLpnTvsXN3A77ovxQqtiDlPO+1DH4Iuz
	kVK9udL0krWH6Wg9wH1iw==
X-Received: by 2002:a5d:40c8:0:b0:45e:eec6:5020 with SMTP id ffacd0b85a97d-4603063ff2dmr2697534f8f.38.1780643404687;
        Fri, 05 Jun 2026 00:10:04 -0700 (PDT)
Received: from localhost.localdomain (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm25132882f8f.5.2026.06.05.00.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 00:10:04 -0700 (PDT)
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
Subject: [PATCH v4 6/7] arm64: dts: allwinner: a100: reserve RAM for ATF
Date: Fri,  5 Jun 2026 09:09:20 +0200
Message-ID: <20260605070923.3045073-7-alexander.sverdlin@gmail.com>
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

Add reserved-memory node carving out Trusted Firmware-A region spanning
fixed 256K from physical address 0x40000000. Even though Allwinner ATF
itself passes the address range in the fdt to U-Boot, U-Boot currently
only reserves this memory internally, but doesn't carve out the region
in the fdt passed to Linux.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v4:
- new patch

 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
index 7cb06b19b5a5..d8391663fd1d 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
@@ -87,6 +87,22 @@ osc32k: osc32k-clk {
 		#clock-cells = <0>;
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/*
+		 * 256 KiB reserved for Trusted Firmware-A (BL31).
+		 * This is added by BL31 itself, but some bootloaders fail
+		 * to propagate this into the DTB handed to kernels.
+		 */
+		secmon@40000000 {
+			reg = <0x0 0x40000000 0x0 0x40000>;
+			no-map;
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 13
-- 
2.54.0

