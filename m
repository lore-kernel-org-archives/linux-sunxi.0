Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794838996;
	b=tv91TTlHJ4UP02yb/4d3EreX+kPXJmLjgBajSeW+ClMjSytG5tAFTywZ21/StfwlkR2N
	 ZyJ4BXDWYbp/qoWS6eAJiHOkUYplrdxSjNjSZ5HXzP92yMLU879kBWN+0BCfS5WmQmwqu
	 XPTyjAREvcBKVQtIJdEM9JQ8v8i1rC3f14zi7nA6cAuw+ugqoJMoWeXIKWUjxcghkgbLN
	 caWO+L09205krQyl3swSnT+FH+eoogQpO75FQRLwJ8KF3McCKNpmtG/MKRBMUQsoleXBo
	 oml9uq+J8kum2RaSR+mUfCyAUHsfw40ybqnODP+967DktMXKLuZJaxfLo7lS7fbUPag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794838996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3+LDIf7xcOUg0Ytv5NF1ZKANWMIYF3HNRlqe1V/Gd84=;
	b=oGynLhV1gE3XaUVXd0d+duM+cYiAcABNaha1t3blpVA4d4JpCGucQxeZG1+DnxmTLiaZ
	 mY8CjMG6JXR36aF6pS0RaOmt13PysVZoYk7IR5a3PnvMQoPK7lvKKc4Nm3W81ZaWX17U2
	 dRWADU6JgcpvXcjdbZ658Alf+IoaoU8EUHDSLbAwrYrk4AS2lVjik5XzKqcg8bTj+aTBe
	 UJ+QXH82tVpYwkeljGeWuHDNExGZVUls8a7768vyJhLoYdjKOWNFdSGNsDdFcuXtVY8vm
	 VCcA0YKWEED9cTlnq4vdhBZJZ3mofk++Z6MzHfs1m9a0KXZbbk9yZhvJ4uTqMWZZYnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y964wnSk;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82955606A329
	for <linux-sunxi@lists.linux.dev>; Mon, 16 Nov 2026 14:23:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82955606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y964wnSk
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b3b4944a0eso1517977c88.0
        for <linux-sunxi@lists.linux.dev>; Mon, 16 Nov 2026 06:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794838995; x=1795443795; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3+LDIf7xcOUg0Ytv5NF1ZKANWMIYF3HNRlqe1V/Gd84=;
        b=Y964wnSk2Rzd4+I/+puZ57qR4VgEAVvb4U7s9diF5qqzL+2zseW3kUiReG7T502jBm
         DBd/l+PFDw56eB8nJN+Hf7dcCaYGOO1EEYtbQrUTcB1f8K3h1tDd/TVFkoEs5KM7Dmj5
         Q0/TB7lOIZeyKHw4hyaalYqecIDM9M4wzKKbG7SUhAhS488/eg7G2tuK5JI+HQ2mkEWG
         pQawf78a29jEkzxiE834EYYC1P2IitVnwk0rUFCa9xgXZBEzQrk+MkBcv89lODgfcdWa
         iJPpCslXzeB6xLcXW/a3Eun5UqfmoveeESZpn4842b/S4Mo5OFUnLpV8WQTDylS8JHch
         Srnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794838995; x=1795443795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3+LDIf7xcOUg0Ytv5NF1ZKANWMIYF3HNRlqe1V/Gd84=;
        b=QgAlXWkAe+1MpDOGCUnXBb303RljpF904oJJb5bmgi5L8S9YoxejC8p2HGr+eBS5i2
         Qx1ytPeBaGEn9+Jh3DY93rZBfUQKNLEwp4EkP9dGZSDPE4XVxz/z8EAu9z1+ZQT8w0QF
         FnQ+It0scZv9l0fD31js2mXhzQ7IObEvdp5zqwZVgbL1QLpjMImo/+VWg/CeMud+qkec
         tSCtvwYCEtZZwTnUIz+KIfocQpTCgJABHkoc0ws6nPQV5ixbTG+9i17/oMNhT+OnM7Gq
         mZGg4VVdsoP1YfpDnxq5KyQVVOuS3b5Ft3fKHEI2Xol1AbTAwALutDwDObOJeesMUSYx
         oLCQ==
X-Forwarded-Encrypted: i=1; AL+hErEZ1+L4PYw8cCnWw6WO5TgbkvQnw3dZdnA1lgCEf80pqRaHbySKTaeqBfum9F1epknWmPRE2Q48KTyVmw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/izv6hJrIMLCHbfziH7eP+xvuHo31zS63iP8FFZ9vUjBa9BiSh
	8tfFvNAQ8LjXuvugla4GE3AJgyVBHfaClvwSkp7MPWb7y7Je+YdbZqOo
X-Gm-Gg: AYBFou1gllwvXYHB++VMZwdvwK77L+TrrFl5WcFetSWJY4pMDb0YLm86Not6H085h3Q
	en+3gtLg5NQvINDGR2U14WvS0G6pMPEG7kLtF7a7aT+3bNGagDIdDJHvcQ7iollwS0gQ8Cd0axF
	K/vq+ATgN+xGlalWsRbTqyGTylRLzFwPhWQzGJ5HIbKXlAQgwfPwNTgLub0fb2DI9IeT0NTADEZ
	7Sa/STaSN8S36twkSlbewH7NsdHSvpFWfCGpK6usgm/x8EEc8lyJw+oGHceZGhyGwJnM82CdiXM
	/LR5JE6Ey1ci/qLk2C1Dtps1ErSRJ2XlGGUHSjkt+ze+Q+00KfYzTytZ2O7cJY1Z0T+6WQSAdBw
	wux0bY2lOk5z6F+uGwHvV+Eq1zUVuSPAYUeOTbLqR/iBju/qdcjHR2Mvn2z0q44d/a4bP/hJYrE
	or1G3vSFhKjTfsR8KuDVU9j2gtVcxcgckWwpzSPeuEynbqnorFkIl7feEHpVeK9rfdaa02erOqd
	bR6aLL0wERQTzTONdOQ6yUwYZtrnskaMX3kxVZ6TFMXn7eInjtaai7sCA/9ctyBE5TT7YMLlaBm
	LOQ418I5PqjLj0VAhWF9BOgAGxNgcWMM8X8mrWw=
X-Received: by 2002:a05:7023:904:b0:1ac:2f6d:e1c6 with SMTP id a92af1059eb24-1b503068271mr10508055c88.6.1794838995363;
        Mon, 16 Nov 2026 06:23:15 -0800 (PST)
Received: from arch.localdomain ([152.175.35.61])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319e381sm32526875c88.12.2026.11.16.06.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:23:14 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: jernej.skrabec@gmail.com
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	james.hilliard1@gmail.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	robh@kernel.org,
	samuel@sholland.org,
	wens@kernel.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: allwinner: sun50i-h6: Add AC200 companion chip
Date: Mon, 16 Nov 2026 22:23:07 +0800
Message-ID: <20261116142307.671340-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261115171148.37784-2-jernej.skrabec@gmail.com>
References: <20261115171148.37784-2-jernej.skrabec@gmail.com>
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

Hi Jernej,

> Every H6 package contains an X-Powers AC200 die next to the SoC. It is
> controlled over I2C3 (PB17/PB18), takes its 24 MHz reference clock from
> PWM1 (PB19), and its Fast Ethernet PHY connects to the EMAC through the
> RMII pins on port A.
> 
> Describe these parts in the SoC dtsi:
> - the I2C3 controller with the AC200 at address 0x10 as its child,
> - a pwm-clock that runs PWM1 in bypass mode at 24 MHz as the AC200
>   input clock,
> - the I2C3, PWM1 and RMII pin groups,
> - the EPHY calibration value in the SID.
> 
> Everything stays disabled. Boards that use the AC200 enable the
> pwm-clock, the PWM and I2C3 controllers and describe the PHY package on
> their MDIO bus.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 53 ++++++++++++++++++++
>  1 file changed, 53 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> index 48c771223af4..5e48b35d13de 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> @@ -17,6 +17,16 @@ / {
>  	#address-cells = <1>;
>  	#size-cells = <1>;
>  
> +	ac200_clk: ac200-clk {
> +		compatible = "pwm-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <24000000>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pwm1_pin>;
> +		pwms = <&pwm 1 42 0>;
> +		status = "disabled";
> +	};
> +
>  	cpus {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
> @@ -314,6 +324,10 @@ ths_calibration: thermal-sensor-calibration@14 {
>  			cpu_speed_grade: cpu-speed-grade@1c {
>  				reg = <0x1c 0x4>;
>  			};
> +
> +			ephy_calibration: ephy-calibration@2c {
> +				reg = <0x2c 0x1>;
> +			};
>  		};
>  
>  		timer@3009000 {
> @@ -388,6 +402,11 @@ i2c2_pins: i2c2-pins {
>  				function = "i2c2";
>  			};
>  
> +			i2c3_pins: i2c3-pins {
> +				pins = "PB17", "PB18";
> +				function = "i2c3";
> +			};
> +
>  			mmc0_pins: mmc0-pins {
>  				pins = "PF0", "PF1", "PF2", "PF3",
>  				       "PF4", "PF5";
> @@ -414,6 +433,19 @@ mmc2_pins: mmc2-pins {
>  				bias-pull-up;
>  			};
>  
> +			pwm1_pin: pwm1-pin {
> +				pins = "PB19";
> +				function = "pwm1";
> +			};
> +
> +			/omit-if-no-ref/
> +			rmii_pins: rmii-pins {
> +				pins = "PA0", "PA1", "PA2", "PA3", "PA4",
> +				       "PA5", "PA6", "PA7", "PA8", "PA9";
> +				function = "emac";
> +				drive-strength = <40>;
> +			};
> +
>  			/omit-if-no-ref/
>  			spi0_pins: spi0-pins {
>  				pins = "PC0", "PC2", "PC3";
> @@ -626,6 +658,27 @@ i2c2: i2c@5002800 {
>  			#size-cells = <0>;
>  		};
>  
> +		i2c3: i2c@5002c00 {
> +			compatible = "allwinner,sun50i-h6-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg = <0x05002c00 0x400>;
> +			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&ccu CLK_BUS_I2C3>;
> +			resets = <&ccu RST_BUS_I2C3>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&i2c3_pins>;
> +			status = "disabled";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			/* AC200 is co-packaged with the H6 die. */
> +			ac200: mixed-signal@10 {
> +				compatible = "x-powers,ac200";
> +				reg = <0x10>;
> +				clocks = <&ac200_clk>;
> +			};
> +		};
> +
>  		spi0: spi@5010000 {
>  			compatible = "allwinner,sun50i-h6-spi",
>  				     "allwinner,sun8i-h3-spi";
> -- 
> 2.43.0
> 

Tested-by: Jun Yan <jerrysteve1101@gmail.com>

Tested on a TaiqiCat (TQC) A01 with similar board changes on top: the new
I2C3, PWM1 clock, RMII pins and SID calibration cell all work there as
well.

Thanks,
Jun
