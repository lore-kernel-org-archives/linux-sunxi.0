Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C382E62E
	for <linux-sunxi@lists.linux.dev>; Fri,  9 Feb 2024 12:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707481362; cv=none; b=YAckH/EXbXHZS86IbJGbsAb0p/Wj8j7+CCzyocUKGRFVw/w8wzVVt1mYXnXCg9rXx3zyFSJL3q4J6LAVrHXEzvDE1DLkH4qVqoorPsHte3TRhfGNDOpinrCAwBWbCnHlseX+Y1sSeR1STDvJHuS/VqygM4CgF2arwjq5TpoOs/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707481362; c=relaxed/simple;
	bh=oFEEbDXfmmzP8QbRnUkcyxwY9mMWHjNhcqwa9mI/lJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YfEyRPXEQ+3Cn+Y4q3hZBjG0L5+3ym3C7EcviSIYpM3NMx5O8p/10FfIrehLqHESa++l1Y2Zt0XbemdbiKf5C3ufhKCl6HL4PS5Pr5HgfC6daLPQ8nKy2CasKdqe+s66CiyeWQNNTGdleTu7nUbdG6lWUwUpUcs5mVC5Z9iLYzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h4RsDfgT; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4RsDfgT"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a389a3b9601so118932766b.1
        for <linux-sunxi@lists.linux.dev>; Fri, 09 Feb 2024 04:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707481359; x=1708086159; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+SoX+X5emKM3HKsN7dxRQvW+2KiX8jUZhrjjzHJukYA=;
        b=h4RsDfgTFoiC+r2tbmwzDkdT5YhiVAJt2dlIQi2sLexYN57mjbUAtf2Vw0HSEyAJOV
         sC+UrqAqnwdw5fM2SYMS1PAQsHeSbpuiDv+3oOcWm0Ds/dJDxdQsb7eIoivOYeQLQD8S
         Dpsf2NZkQ4idnIbxPCnEGL5XzSfRSvx/4Y0l3bib8I5OQK4C/wy9eGnU8zV5K6BUo0Kh
         XovbpPpjrSruKO6VCc0h+Buzz2/oYe1jSfwHoG+lSzWJPfvQ24GX3+6U0H+C9s6Hccq/
         cPfj5zhnV5wWFJmjDIewySQoD0dRwwPH6jVQ6Eix538lTRI9xdy+vxUfYxx3C2IQ+Xy1
         6Dlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707481359; x=1708086159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+SoX+X5emKM3HKsN7dxRQvW+2KiX8jUZhrjjzHJukYA=;
        b=GjtegIFi4TluhmKtE4tQNeGkWFQVUhvdOVTLnfjbZB73Z706dxBekorOtUlwhN+y8c
         GGoy6TD2mfuxmK21bqSerf6qp36cMeDaG3F1IBZP5KKEvyj9Ui/iBzHulMB9PFQV4R1x
         POZpA6dET6KMdDFdpEYV7suM5wsS+bQqO9SskNJAg9VZNhxGWIb3fwd46iGj/MAO2qRO
         eeMFAThMI7ONQXTb1dRYt6MFd0I+vmyD1CHmt1idCtfVA9H47+Guoa2SKUry/kFVlzoO
         YNz2n3OI/LBDlNM2TJAlBpk6HW0Qpd3J16XEMG0Ys2Gyenxt0KTr5a0OZm9rFLbwoyym
         13iA==
X-Gm-Message-State: AOJu0Yz31wPElPrbJJW8fug98/dS2rel1ipmTMVQg+479IUx3PJ12F/A
	DLIxD9iNRpdpQyM4eregTiLnpZMYS9SfUQgvMsfowNx0FVRCuI4P
X-Google-Smtp-Source: AGHT+IFqbq9P0xGdfOKDIJgZO56dR6ZuVyS1Klbpl63+dubhHar/VKQISUEGfcAZg7Y7yv4oLS590Q==
X-Received: by 2002:a17:906:a3cc:b0:a38:1c13:332b with SMTP id ca12-20020a170906a3cc00b00a381c13332bmr1107974ejb.59.1707481358958;
        Fri, 09 Feb 2024 04:22:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVx8NFDf4tLWFDLXdZubliemhHmfEKlUKT6i8BoHLRcZXz4bDCOc/zx0Hnp/H1OXNtRyCYGj4W+2Gi/zOE0h99WxhFH6UfakOP5Dpa2FRcwh6oOhFIKF0AIEGg2nLX2m8HvfTrSdsIfBRf2z3AytG+FAULzCzIB2jMocDipOGTxO4jVZaf4ON7hFxbTWtMr/SQg90XOroLzxCYAW7muMzncs4rIqXoDhTIQfe50QbtRUHC/iL5TalQldHMdgbZddDhGrwSwrIOBAaHDF6Hpt0fFA0mi/Owj516ODQkaIjnDBtDH8sV5QnueghHxp5PXVGidc9QrCwZfj+nrKk1kQA==
Received: from jernej-laptop.localnet (APN-123-244-98-gprs.simobil.net. [46.123.244.98])
        by smtp.gmail.com with ESMTPSA id un8-20020a170907cb8800b00a37669280d1sm709075ejc.141.2024.02.09.04.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 04:22:38 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andre Przywara <andre.przywara@arm.com>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Nick Alilovic <nickalilovic@gmail.com>
Subject:
 Re: [PATCH v2 2/2] arm64: dts: allwinner: Transpeed 8K618-T: add WiFi nodes
Date: Fri, 09 Feb 2024 13:22:36 +0100
Message-ID: <4894722.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20240209115759.3582869-3-andre.przywara@arm.com>
References:
 <20240209115759.3582869-1-andre.przywara@arm.com>
 <20240209115759.3582869-3-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 09. februar 2024 ob 12:57:59 CET je Andre Przywara napisal(a):
> In contrast to other devices using Allwinner SoCs, the Transpeed 8K618-T
> TV box uses a mainline supported WiFi chip: it's Broadcom 4335 compatible,
> packaged by Murata.
> 
> Add the required DT nodes to let DT users know about the SDIO device.
> There is an otherwise empty MMC device node, to receive the MAC address,
> that firmware might want to write in there.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../sun50i-h618-transpeed-8k618-t.dts         | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts
> index 8ea1fd41aebaa..7ec4098e707bf 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts
> @@ -16,6 +16,7 @@ / {
>  
>  	aliases {
>  		serial0 = &uart0;
> +		ethernet1 = &sdio_wifi;

Ah, this is not sorted alphabetically. I can fix this while applying.

Best regards,
Jernej

>  	};
>  
>  	chosen {
> @@ -39,6 +40,15 @@ reg_vcc3v3: vcc3v3 {
>  		regulator-max-microvolt = <3300000>;
>  		regulator-always-on;
>  	};
> +
> +	wifi_pwrseq: wifi_pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		clocks = <&rtc CLK_OSC32K_FANOUT>;
> +		clock-names = "ext_clock";
> +		pinctrl-0 = <&x32clk_fanout_pin>;
> +		pinctrl-names = "default";
> +		reset-gpios = <&pio 6 18 GPIO_ACTIVE_LOW>; /* PG18 */
> +	};
>  };
>  
>  &ehci0 {
> @@ -60,6 +70,19 @@ &mmc0 {
>  	status = "okay";
>  };
>  
> +&mmc1 {
> +	vmmc-supply = <&reg_dldo1>;
> +	vqmmc-supply = <&reg_aldo1>;
> +	mmc-pwrseq = <&wifi_pwrseq>;
> +	bus-width = <4>;
> +	non-removable;
> +	status = "okay";
> +
> +	sdio_wifi: wifi@1 {
> +		reg = <1>;
> +	};
> +};
> +
>  &mmc2 {
>  	vmmc-supply = <&reg_dldo1>;
>  	vqmmc-supply = <&reg_aldo1>;
> 




