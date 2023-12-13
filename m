Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741057E542
	for <linux-sunxi@lists.linux.dev>; Wed, 13 Dec 2023 20:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QQaYOFTm"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40c3fe6c08fso49789525e9.1
        for <linux-sunxi@lists.linux.dev>; Wed, 13 Dec 2023 12:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702498175; x=1703102975; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E1E00I7csYet+h6d3hCBs5SooYMP4Ja6qAuEnzWpbHw=;
        b=QQaYOFTmaFLY/JnrDDhDAJcmrD3bskTFcwAQT3BBOiKNBsGWdkkLdJ8IGaFsTn9nE+
         cbFbKbXSrMgAQejDT1hHN0tJXkhYdZytnmwVcD91bAVv4t7W0nhd/au7P9hEbohI3Qs1
         igA0irGN+tIEhIGWjKMUwnhxgZsTN75nrVU899FLwx7fgEhd8oK7IhmW58ipjw4xuWjT
         WVvznBzMOzeFU9Ku7tDaxhqIv6DtXZBB3bnSXJhQSqIRv3lMiIhIHBrI0iVhfOEU3jRF
         cgSV9dF2HTCWFuxiJONirWhUKrgVMAtM/lwrFd0HzAZAs41ZBmERf/z0ENydHaTH5n7p
         fqEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702498175; x=1703102975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E1E00I7csYet+h6d3hCBs5SooYMP4Ja6qAuEnzWpbHw=;
        b=r+cPaPw8ZaQCb/amUZE1yIPw3aJO13hYBFpXzoMcQ5/14ZjwxFsMixwz/N9+9TtJBu
         pf6EPcw5CPWS3W8dnxh0n/YEoOCJkG1hLi/T/RMGEoGg3hZI8/fRFUEARQmcuQKKh7CI
         Atu5sTEuITQyUoHvhDn0LiL/FQU65vrA5Mqmqzc0hTDEyBHT7B9wcNxo9BYCTKFhnxEz
         RJoEplJNXxb8FiTuCI5SUxoGmxEgVCVEMSrpGMKh1bMCAQNxJ88yKjztaio73IOlJSSX
         vJxf9K9iFKO//J3M0Dxz9lwKhH6OK8Aa36xsZVEKXL7ldLGZxyffxVbFPEIN+QlMunGu
         HP8g==
X-Gm-Message-State: AOJu0Yy6yKlnuJ9z5+18w/GZ+ynEHDo+MOkv6s/46K34SpMDfIvzkRyn
	CRFbDdRn9hbgTI90+1kc2LU=
X-Google-Smtp-Source: AGHT+IGgnj9gSAhJ/otmBIdrNYjW6wgF/y7XkF5VoE4tuaeCabEiVYTrQgIZsnFDgtnuMk+zMFilUw==
X-Received: by 2002:a7b:c419:0:b0:40b:2a3e:4c9b with SMTP id k25-20020a7bc419000000b0040b2a3e4c9bmr3183581wmi.29.1702498174346;
        Wed, 13 Dec 2023 12:09:34 -0800 (PST)
Received: from archlinux.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id p8-20020a05600c468800b0040c488e4fb5sm11794611wmo.40.2023.12.13.12.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 12:09:34 -0800 (PST)
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
Subject: Re: [PATCH v7 4/7] ARM: dts: sun8i: v3s: Add support for the ISP
Date: Wed, 13 Dec 2023 21:09:32 +0100
Message-ID: <3267480.aeNJFYEL58@archlinux>
In-Reply-To: <20231122141426.329694-5-paul.kocialkowski@bootlin.com>
References:
 <20231122141426.329694-1-paul.kocialkowski@bootlin.com>
 <20231122141426.329694-5-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, November 22, 2023 3:14:22 PM CET Paul Kocialkowski wrote:
> The V3s (and related platforms) come with an instance of the A31 ISP.
> Even though it is very close to the A31 ISP, it is not exactly
> register-compatible and a dedicated compatible only is used as a
> result.
> 
> Just like most other blocks of the camera pipeline, the ISP uses
> the common CSI bus, module and ram clock as well as reset.
> 
> A port connection to the ISP is added to CSI0 for convenience since
> CSI0 serves for MIPI CSI-2 interface support, which is likely to
> receive raw data that will need to be processed by the ISP to produce
> a final image.
> 
> The interconnects property is used to inherit the proper DMA offset.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
> index d57612023aa4..1a1dcd36cba4 100644
> --- a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
> +++ b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
> @@ -645,6 +645,14 @@ csi0_in_mipi_csi2: endpoint {
>  						remote-endpoint = <&mipi_csi2_out_csi0>;
>  					};
>  				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					csi0_out_isp: endpoint {
> +						remote-endpoint = <&isp_in_csi0>;
> +					};
> +				};
>  			};
>  		};
>  
> @@ -703,5 +711,32 @@ csi1: camera@1cb4000 {
>  			resets = <&ccu RST_BUS_CSI>;
>  			status = "disabled";
>  		};
> +
> +		isp: isp@1cb8000 {
> +			compatible = "allwinner,sun8i-v3s-isp";
> +			reg = <0x01cb8000 0x1000>;
> +			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&ccu CLK_BUS_CSI>,
> +				 <&ccu CLK_CSI1_SCLK>,
> +				 <&ccu CLK_DRAM_CSI>;
> +			clock-names = "bus", "mod", "ram";
> +			resets = <&ccu RST_BUS_CSI>;
> +			interconnects = <&mbus 5>;
> +			interconnect-names = "dma-mem";

Same as in previous patch, interconnects properties are not described in
bindings, please update.

Best regards,
Jernej

> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					isp_in_csi0: endpoint {
> +						remote-endpoint = <&csi0_out_isp>;
> +					};
> +				};
> +			};
> +		};
>  	};
>  };
> 




