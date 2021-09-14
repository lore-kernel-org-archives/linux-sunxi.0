Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421503FC4
	for <linux-sunxi@lists.linux.dev>; Tue, 14 Sep 2021 20:26:54 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id e21so1019335ejz.12
        for <linux-sunxi@lists.linux.dev>; Tue, 14 Sep 2021 13:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ny9V3/mCs1gXy/RCoJNt43WdA8dbZAMsrJUkH0JBUJY=;
        b=NkdKj97ea/mAtodeeaU63NlQQwyU5y1/jGRGOH8nhiK9E/uk5WFP+LiSdeEnbatGDa
         8Cvu2QhaX9f57Y8Sb/bLsAznlks6mSmlKqPdHLYnFbTdNqQ5ho2TAC3Fi1x/wpiyZqKH
         0iXZE5ldX7i/ebGW+L4Q3GzFLcCyUj2mzKkjE8zuh6gdVwGSvQOqb/Ko8PLxaehfvRLy
         qkbFAtPW4Mfuu3xZ96IEDdBSZvK3nTCSNNeupYlSmjW84oJRnbpTcmiIdiH/tC5OYFZL
         59tVcwCmrCX1QIyWoyMl4W74LGOxoEgBDsk9Ql7eDv9Q5Cv3OBgsgMQYT8prOkgK3M97
         DFOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ny9V3/mCs1gXy/RCoJNt43WdA8dbZAMsrJUkH0JBUJY=;
        b=vfMNEKcPP+S1tkWGDkZFQAy2IwDTYU4eDBfT7CmBoJIJY/wzNeFeLEqsDN+O0B7eAV
         /A1Pq2jZLv2UHv7YWIQp2sY12M8VbdhnqgsR7Eqvm2TQi6ed8KA5BuTDZkI7jkSQLO6i
         bwJ/+8sMfBumF+JCdnwmgDxNH1fIjA3rCxuP3kBf8i38HYtuD1r1U/wqWVriNAEay6Xx
         Pcp21Ptvz9xyZRnqyMlxWJjaJyV4ep9m8t4j6BH4NhDroBuj5lxluZ5R+2DiAOy3rY55
         STT7x5NVsLtortQy96jEAj7HxYhmSNHQFi5P8zV6Y/j3u/uwPygVmQRlSMIDyoIYblW1
         fQcA==
X-Gm-Message-State: AOAM531XJ1pXc6WOV3t11ZdlSvqKG646HrqbAAJJ0ogMdq9EURaaxy3P
	nF5lGou9DPMZpj0hjnNB6V4=
X-Google-Smtp-Source: ABdhPJzx2FUqHRpbL4wRfDRv1SBt2WsH8dhPqtgeJpH2RsP4C2x1Ad9tyzm7idxgezXB6udMRenyjw==
X-Received: by 2002:a17:906:cc57:: with SMTP id mm23mr20825666ejb.540.1631651212574;
        Tue, 14 Sep 2021 13:26:52 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id g10sm5327677ejj.44.2021.09.14.13.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 13:26:52 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Dang Huynh <danct12@disroot.org>
Cc: danct12@disroot.org, Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: allwinner: pinetab: Add HDMI support
Date: Tue, 14 Sep 2021 22:26:51 +0200
Message-ID: <2558517.IGp7HM5rsX@kista>
In-Reply-To: <20210914193732.3047668-1-danct12@disroot.org>
References: <20210914193732.3047668-1-danct12@disroot.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi!

Dne torek, 14. september 2021 ob 21:37:32 CEST je Dang Huynh napisal(a):
> This patch enables HDMI display on PINE64 PineTab.
> 
> The PineTab has a HDMI Type C (mini) port.
> 
> Signed-off-by: Dang Huynh <danct12@disroot.org>
> ---
>  .../boot/dts/allwinner/sun50i-a64-pinetab.dts | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dts b/arch/
arm64/boot/dts/allwinner/sun50i-a64-pinetab.dts
> index 6a4af14718f5..adb0b28b06d8 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dts
> @@ -35,6 +35,17 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	hdmi-connector {
> +		compatible = "hdmi-connector";
> +		type = "c";
> +
> +		port {
> +			hdmi_con_in: endpoint {
> +				remote-endpoint = <&hdmi_out_con>;
> +			};
> +		};
> +	};
> +
>  	i2c-csi {
>  		compatible = "i2c-gpio";
>  		sda-gpios = <&pio 4 13 GPIO_ACTIVE_HIGH>; /* PE13 */
> @@ -410,6 +421,21 @@ &reg_rtc_ldo {
>  	regulator-name = "vcc-rtc";
>  };
>  
> +&simplefb_hdmi {
> +	vcc-hdmi-supply = <&reg_dldo1>;

You have to set status to okay here.

With that fixed, you can add:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> +};
> +
> +&hdmi {
> +	hvcc-supply = <&reg_dldo1>;
> +	status = "okay";
> +};
> +
> +&hdmi_out {
> +	hdmi_out_con: endpoint {
> +		remote-endpoint = <&hdmi_con_in>;
> +	};
> +};
> +
>  &sound {
>  	status = "okay";
>  	simple-audio-card,aux-devs = <&codec_analog>, <&speaker_amp>;
> -- 
> 2.33.0
> 
> 


