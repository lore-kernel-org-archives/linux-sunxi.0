Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5881239768F
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 05:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785734152; cv=none; b=pDlQzKvK0gDO7KCuzA1xpDcUojfG0OpMrjfOOfBJ7MH8lUt0QjdCx/zpmRXBmfLG13muiRPM5cNeTHqMoKUawA1+lozxUO1J4dAwHKTuf3EFTNfg+TMhpy5RZlWV0MRFj/4jwMUV6ALygtQaDlk9OdAZscm1DyidrFxey8jOOYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785734152; c=relaxed/simple;
	bh=CsTsehT4z8CJxsGhaiEo1pllL05TyPVSaHwPj6kU07s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G/cPpN4M9hNGlJbdFYK+J0BOKRhCVCbPQKApnlegXNTY7C45henjz+AXlQMBAbpJQGmDRnT+PIB1ip2Cr4xwNDXGhOwdUbfWn8tAPy2mNlYkTpzRoA0hZPbkXT9TbnjXXTEJPjB6GG7aOnUvRrotNv6Jy3PDy6ZUy8qVEFmVpiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ikalkrPa; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ikalkrPa"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7ee37dc91f5so1801470a34.3
        for <linux-sunxi@lists.linux.dev>; Sun, 02 Aug 2026 22:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785734149; x=1786338949; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9OpRGWNf+wnvCcP1DS85gL+udlM+7o9ZcunosuNBCWA=;
        b=ikalkrPa/1xBk9AU4wzocyGIDDlRGEniygJgSIA4EAbBICPltH7JcmVDMJxjntIIvK
         40id1Aq+JMq6n4Da/nCMXF7MkBI4a0I8Yaunn6QOfTlOh4+8jP+VYxTfXGcvFh87mgco
         L7GoAvDM8tE5Cj7hMJUUQ4kuM2VuFw0hNJ9YB6eJxaUWChROPDk/ClfNn7ogTeYBCxxK
         cTURia7eVAiSp8OSzoftDz7T+sC7w0sVaaD9gNtLMIUATmQWVXPNK6p/DeJ8nbaSFa9n
         3bOaja74w2cJnAodJY2xIcguaPLkHY6had0ZZlXCyschP8tZ9ZdDn+stOlepUviovYog
         H0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734149; x=1786338949;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9OpRGWNf+wnvCcP1DS85gL+udlM+7o9ZcunosuNBCWA=;
        b=gnkdjB6lujkIm58mki/FsQRxwDPfEfuUH/byH5lxaT8744qFReEKNraEZSaMbclBpS
         vKUqrXiPUeY5oX9fksGHExcNC+1PJFuZNu194WIc28UID/UQ28FfNbOoA/uxD035+yq/
         nxj50NKcJi1bmZAvDamWldaH0LSdPHEOZ0ZNh0dPxlXkSYKs4UQTUdco/u3R9s4Bss5X
         cY1xIXhNmBtvPefLXyPmaNZGsTQ1hJ1Bu9nVYPGhVhJtmmCOUo5qLV9o0qrEKD8k4P1M
         37txH+LvjXM9VubCdjnIcOUTqj2NBRYCU1l+gH620rMS6qF+NqtQCCIoXNLPOl/3pQuI
         HzIw==
X-Forwarded-Encrypted: i=1; AHgh+RrIoDHdntCVFKK8sTM+sP3rRNjMT3TWkac+dXI8L8dBDxJ86PA8RawYkY2m5AJ7L3BFc09GYQXAYa3JWQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyCt2jg/5H/Ayabl3AvG0pjTDAUnRcHaIHYMoxIesro6oYfWYJx
	fkNBOMPHOMFykungW4grhtke6NNF9pLB/5vBkquyfo6Eb2jwUIardhS2
X-Gm-Gg: AR+sD10IXCCA6pXtF13qapp8HqIaEni3UtvJq76PE3PUQVvyWBMjwWhWkfmLGpD6BLX
	goYi6bmeKbtpALue4tAc5rrrEfL8ah5JeeQ8dZ+JG3AFU1VTLtvjpBC97hogTRPJ24VgA7t65lk
	m27PLten85eA7mftJIw7CLAvGKr57tE6Hrk9ns3Nq3D4i+rE+eIhPrPpCEvKenSsCMmoUZk0pWP
	ZGJAPmnkry35sv5e7IIeCxoUCpo6bqpnc0mCze5msKHjRE/MSMRIEqYHIWk+be36B2wNgfkddDc
	xwwBHB3RB7jU0xjRFQBjb2+Tk8jY7nK13RDnIwbMPUKaVIAuY7ofY2e87VZ/peB4Dk31YmIfYRD
	8WiWTeKSUaNCBiRXVcYWxFlzkQk5XczxpmgSIeJFt2MUsENO4ka1joAcPjTYuRgPPkFefMdTdVh
	vWKqLppi+lLcBpSJ/csx5flKpkVGNTAp13/1zE63XFJNqbZu3OQU6akDRlss/SbnkhVunz8pYH1
	ZLlVtjTbcpa4o0nZANacy+qlkorkqIjSdGQ+VbG0oO+juHpopI0G8sVNqlOlszMvbnEMAbWmEcA
	bo7qWDHiuyDgs8qZ4Cw5VsMhdp9tC9LKfTd+kgShLZndpqS5tbAUrZNCl80bsWapsiFo2U15OlH
	ZcN3RoHVMgh1LOxSx
X-Received: by 2002:a05:6830:3592:b0:7e9:e488:3bce with SMTP id 46e09a7af769-7f196bab78dmr14968611a34.6.1785734148846;
        Sun, 02 Aug 2026 22:15:48 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a5e3sm6787108a34.15.2026.08.02.22.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 22:15:48 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 02 Aug 2026 23:14:27 -0600
Subject: [PATCH 17/21] arm64: dts: allwinner: h616: add ACx00 EPHY
 resources
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-submit-acx00-of-dynamic-v1-v1-17-0a53cd9e21cc@gmail.com>
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
In-Reply-To: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 mfd@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Expose logical SID cells for the AC200/AC300 EPHY calibration, the combined
companion-variant and AC300-calibration-range configuration, and the AC200
bandgap fields.

Also describe the PA10/PA11 I2C3 pin group used by the AC200 control
interface.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index 6879f27c2b2b..2cedda6e87a9 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -252,6 +252,20 @@ ths_calibration: thermal-sensor-calibration@14 {
 			cpu_speed_grade: cpu-speed-grade@0 {
 				reg = <0x0 2>;
 			};
+
+			ephy_calibration: ethernet-phy-calibration@2c,0 {
+				reg = <0x2c 1>;
+				bits = <0 4>;
+			};
+
+			ephy_config: ethernet-phy-configuration@2c {
+				reg = <0x2c 2>;
+				bits = <8 2>;
+			};
+
+			ac200_bandgap: bandgap@30 {
+				reg = <0x30 2>;
+			};
 		};
 
 		timer0: timer@3009000 {
@@ -324,6 +338,13 @@ i2c0_pins: i2c0-pins {
 				function = "i2c0";
 			};
 
+			/omit-if-no-ref/
+			i2c3_pa_pins: i2c3-pa-pins {
+				pins = "PA10", "PA11";
+				function = "i2c3";
+				bias-pull-up;
+			};
+
 			i2c3_ph_pins: i2c3-ph-pins {
 				pins = "PH4", "PH5";
 				function = "i2c3";

-- 
2.53.0

