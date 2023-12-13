Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096795FF18
	for <linux-sunxi@lists.linux.dev>; Wed, 13 Dec 2023 20:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MOP2Fmbz"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-336356d9092so1230550f8f.2
        for <linux-sunxi@lists.linux.dev>; Wed, 13 Dec 2023 12:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702498314; x=1703103114; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SHZJxjE/63ZPQdMM7w++i0H3AQcrKC5RCaCrTHY5Njs=;
        b=MOP2FmbzUkF5iikEuh2aHe+uc80StbZID+5I9S1gSYr9JSzj+tqu9E+FaN98hF+spf
         HP5DYblDIM2cJ283oRp7frYc76xijU5w5ERWvyT4TlupRM+b7IQXTeiZS5gGEoD3uDil
         ybl1EbPPq7HKCrfCffU/+fGJ8Lw11qKMvKRQz26Yv/+2vXoSxWQ52Gxv/XDBpT3EPLUH
         zvjRZ/vgz4HkB2lO6P1QSoHD4CufiMgZcPTqT9CFofsF2kshAZW2BEH6AgMAzpBLNWSX
         tBDPXqRqhGv6L6lK6xalVxgbvLbcSNmSwwih4zeak7z2wuuDTrsynAuTe89ka9vwHgH6
         //FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702498314; x=1703103114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SHZJxjE/63ZPQdMM7w++i0H3AQcrKC5RCaCrTHY5Njs=;
        b=mc0J9G5ZiAUSGANd4pnfp33HFgSwXSHh8LOJVS4LmvamPiSas6dxLm5yb8tHJ85MAP
         dz7fhGgUD3hCFjJGE5NnTxBldkdjeuDM/9pjxC9DFYCiE3mEuKb8bY/b3H6nhEKNrt1d
         24G7lS5tDo8oRx74rsVAPt6BHe5A6T3UlVG1CDHoIDoIdGCvCs4CnHcc/4NMZvRQJU3E
         a0tBVKr46JIv/5yXXCPPZ4ecnT8k7/pjb2H+O6mdiYyPTlFopPWMHpCXccgo4GRaU4zz
         4gAtINnI+Y/+jrYIKx6TxTeHvMCv+0UU6eyUOutAzxwdTpEs8QvG1e8y08uFhsuadbdR
         Gfdw==
X-Gm-Message-State: AOJu0YxvLLTfC6y1cic88LVOhED7fm0zW0m/+dn6bOK/H9WShpREmmsw
	jHB3NCoj2aAhcWPvnHfRELo=
X-Google-Smtp-Source: AGHT+IHg04Gu69P+Oe4HgRL6vL95x2eltXYD3MsDq45X2kjtZUnpZ+853MUpjE5htvbO4NJbgu55tw==
X-Received: by 2002:a5d:4c4e:0:b0:336:30d8:a75f with SMTP id n14-20020a5d4c4e000000b0033630d8a75fmr1969785wrt.136.1702498314064;
        Wed, 13 Dec 2023 12:11:54 -0800 (PST)
Received: from archlinux.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id p10-20020a5d458a000000b00336463625c0sm100880wrq.51.2023.12.13.12.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 12:11:53 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject:
 Re: [PATCH v7 5/7] ARM: dts: sun8i: a83t: Add MIPI CSI-2 controller node
Date: Wed, 13 Dec 2023 21:11:52 +0100
Message-ID: <8310859.T7Z3S40VBb@archlinux>
In-Reply-To: <20231122141426.329694-6-paul.kocialkowski@bootlin.com>
References:
 <20231122141426.329694-1-paul.kocialkowski@bootlin.com>
 <20231122141426.329694-6-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, November 22, 2023 3:14:23 PM CET Paul Kocialkowski wrote:
> MIPI CSI-2 is supported on the A83T with a dedicated controller that
> covers both the protocol and D-PHY. It is connected to the only CSI
> receiver with a fwnode graph link. Note that the CSI receiver supports
> both this MIPI CSI-2 source and a parallel source.
> 
> An empty port with a label for the MIPI CSI-2 sensor input is also
> defined for convenience.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  arch/arm/boot/dts/allwinner/sun8i-a83t.dtsi | 43 +++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-a83t.dtsi b/arch/arm/boot/dts/allwinner/sun8i-a83t.dtsi
> index 94eb3bfc989e..b74c3f9e6598 100644
> --- a/arch/arm/boot/dts/allwinner/sun8i-a83t.dtsi
> +++ b/arch/arm/boot/dts/allwinner/sun8i-a83t.dtsi
> @@ -1062,6 +1062,49 @@ csi: camera@1cb0000 {
>  			clock-names = "bus", "mod", "ram";
>  			resets = <&ccu RST_BUS_CSI>;
>  			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					csi_in_mipi_csi2: endpoint {
> +						remote-endpoint = <&mipi_csi2_out_csi>;
> +					};
> +				};
> +			};
> +		};
> +
> +		mipi_csi2: csi@1cb1000 {
> +			compatible = "allwinner,sun8i-a83t-mipi-csi2";
> +			reg = <0x01cb1000 0x1000>;
> +			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&ccu CLK_BUS_CSI>,
> +				 <&ccu CLK_CSI_SCLK>,
> +				 <&ccu CLK_MIPI_CSI>,
> +				 <&ccu CLK_CSI_MISC>;
> +			clock-names = "bus", "mod", "mipi", "misc";
> +			resets = <&ccu RST_BUS_CSI>;
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				mipi_csi2_in: port@0 {
> +					reg = <0>;
> +				};
> +
> +				mipi_csi2_out: port@1 {
> +					reg = <1>;
> +
> +					mipi_csi2_out_csi: endpoint {
> +						remote-endpoint = <&csi_in_mipi_csi2>;
> +					};
> +				};
> +			};
>  		};
>  
>  		hdmi: hdmi@1ee0000 {
> 




