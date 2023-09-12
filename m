Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C4D179A0
	for <linux-sunxi@lists.linux.dev>; Tue, 12 Sep 2023 15:54:15 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5230a22cfd1so7429072a12.1
        for <linux-sunxi@lists.linux.dev>; Tue, 12 Sep 2023 08:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694534054; x=1695138854; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=naPTFvozAWXUQ+jkhhTxqmTnrRwIprjMkqTTFQTivH8=;
        b=d8wZmwn/mtZ4AGIPIiL0EIdneO1bfmVYUJEGYgeekgpSjfVnM7jPqeEfs0YLZT+lth
         2ftNkgeM1v+HQC3eYDchRf9IZbbS2VrIJzgYeGp2pEg4U/swU+3s+DNcwptMpee2nWHY
         cYoZXVR0dAxKJicUEx4sma1VhwGWnxHzCMHinuMmSuymOlHrgVV2r0Y1KXqR3kbeVJWs
         bpVOZegYfGPT3+N7OBNQLHY4e2MdzVr4rktwf7ZcN+Pz4qiCzKtGLnePMwkrx7Y2jk2h
         8Jmd4Hmm9IqR0QXivVXHLzIFTGEsoXUWJDmvKkZeIYXr6xbn5L34LHoXJAxuoefy8pXw
         4gLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694534054; x=1695138854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=naPTFvozAWXUQ+jkhhTxqmTnrRwIprjMkqTTFQTivH8=;
        b=tixSEJlPUG3D0d25ZdslUvQCbsId4aDvkr9x8N8rq0ZLLGcxbvLDvus/OjIo7rbQGS
         P3z/ZD6QRcbpnQpIg0ZmXOg/1YxYqjZ0AUkmG9tQyw4GU7s6vkf9KyAM3ydZx0Ec3EPl
         wT+Ey3uQtO1rPwpHG9cK6lYeBf8mHGo5SV9+hkKF0NRCaFgtr9pcO9qiuzT7Kyv7oYjr
         HdBpc1o3qiX5CJq0p0a1Cd2owsZV629vAQnlo5s19XIoooLOEesobYbjIgpo14bmjtd7
         vYTtwLJp7Rd4+QLcODngxwEudEjBlN2AxFK2pVxiSZgaoSmdEMO8ySvshc2afQZH44jO
         ePBA==
X-Gm-Message-State: AOJu0Yyz203H8dcGFm4f4KzwqTFkudxrhL9pftRG5WKQppOgCpoox5gU
	Uw3nvojviiq7nhqAdaa+Rfc=
X-Google-Smtp-Source: AGHT+IGpuGAmmqRAkGB3XMTjinl3XRgL9kG9WDlXhj6mSNKbT2TUCt11mIr4e50oihi2f8L+s6Hu6A==
X-Received: by 2002:a05:6402:1843:b0:527:251e:1be7 with SMTP id v3-20020a056402184300b00527251e1be7mr45463edy.11.1694534053828;
        Tue, 12 Sep 2023 08:54:13 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id g2-20020a50ee02000000b0051e2670d599sm6134972eds.4.2023.09.12.08.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 08:54:13 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 Martin Botka <martin.botka@somainline.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andre Przywara <andre.przywara@arm.com>, Alan Ma <tech@biqu3d.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Martin Botka <martin.botka@somainline.org>
Subject:
 Re: [PATCH v3 2/2] arm64: dts: allwinner: h616: Add SID controller node
Date: Tue, 12 Sep 2023 17:54:12 +0200
Message-ID: <3181319.5fSG56mABF@jernej-laptop>
In-Reply-To: <20230912-sid-h616-v3-2-ee18e1c5bbb5@somainline.org>
References:
 <20230912-sid-h616-v3-0-ee18e1c5bbb5@somainline.org>
 <20230912-sid-h616-v3-2-ee18e1c5bbb5@somainline.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 12. september 2023 ob 14:25:13 CEST je Martin Botka napisal(a):
> Add node for the H616 SID controller
> 
> Signed-off-by: Martin Botka <martin.botka@somainline.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi index
> 74aed0d232a9..d549d277d972 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> @@ -133,6 +133,13 @@ ccu: clock@3001000 {
>  			#reset-cells = <1>;
>  		};
> 
> +		sid: efuse@3006000 {
> +			compatible = "allwinner,sun50i-h616-sid", 
"allwinner,sun50i-a64-sid";
> +			reg = <0x03006000 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +		};
> +
>  		watchdog: watchdog@30090a0 {
>  			compatible = "allwinner,sun50i-h616-wdt",
>  				     "allwinner,sun6i-a31-wdt";




