Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9DC7F
	for <linux-sunxi@lists.linux.dev>; Tue,  3 May 2022 17:54:37 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id a21so20726224edb.1
        for <linux-sunxi@lists.linux.dev>; Tue, 03 May 2022 10:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DYnWSimLii7XmldXmtY2L01MclTrGLMilzsrbNwgPjk=;
        b=Z7OEEo6j2fNdaFTwVE47DarXux+705QL5n+yJ8Pfvm5DWGEz59nbOyDURUpT9QPHz5
         PNmaG2PCWtkrV1hfpLE5MSTik9c4YHZVObdY1ILBwRldIhLqnEhZvTqYBGWOv1ih49hx
         vYU9jochiOKhn5tin10fSHl0v8sszkDykyhDkmB6OHTGZlp3LdMjSkn3/78BVSBdSGuq
         xOe9zOBlFMrjBGR3rpBndsRjFwJwHY1G+VGjPNFITYgRB7DjnT9WFApeCi6EvRdAYELL
         cCaDNjb/ZlEyMQcQav41fHzmqqzFKM8xWqbJoqC3OmqZfaFLXq3SzzKuheCs9K/wAWQe
         nq+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DYnWSimLii7XmldXmtY2L01MclTrGLMilzsrbNwgPjk=;
        b=a8Up7zgkL2mbAfRzSvJOhM+qhZjhcMSZnFutw5/Ofa2OmFQuC5QzAMpeEIUaps1NZT
         elAAxhL93k/7ZuABPAkS9INunKmAOd+u/rDWk4goy2Dy5nlpQYjhyg8lwS2zSfQVTuyA
         IjaIuDbSL9ft3EK4hI1kj2zSlBv3M3Yz+gkFWnfvaMbhqzad3zSZ/2M3bX/0WAHF3BdZ
         w33ybhaXY0auGdOZ36QUaZVjLQYNkpMhNFQ+VsqrG0VR80OFNZmXSHwlUF+GVnPKQ77C
         JXVg+3zmiYehvRlxGeswLxD92rOlitVm3uBpolUhi4IOBNEk9YL4dv8OfYogYYLdwlao
         GTwQ==
X-Gm-Message-State: AOAM531SzP0slCrB6TlR6DTe0ruEjM+H6JmzBU2Sk+LvST+es6t++N0I
	IOZIQZxjjMvneS/sqvqDUD0=
X-Google-Smtp-Source: ABdhPJxuZO00Q1eHmTZPmNGW7ManjOSzRlW8AwOypcs2vrYzGgOspXEleSxteXoztBVce5zDqER1zA==
X-Received: by 2002:aa7:c790:0:b0:41d:7e0f:f15c with SMTP id n16-20020aa7c790000000b0041d7e0ff15cmr18965786eds.129.1651600476354;
        Tue, 03 May 2022 10:54:36 -0700 (PDT)
Received: from kista.localnet (cpe1-3-76.cable.triera.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id bm13-20020a0564020b0d00b0042617ba63cfsm8234900edb.89.2022.05.03.10.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 10:54:35 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Chukun Pan <amadeus@jmu.edu.cn>
Cc: Samuel Holland <samuel@sholland.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH] arm64: dts: allwinner: define USB3 Ethernet on NanoPi R1S H5
Date: Tue, 03 May 2022 19:54:34 +0200
Message-ID: <4393725.LvFx2qVVIh@kista>
In-Reply-To: <20220502144009.44575-1-amadeus@jmu.edu.cn>
References: <20220502144009.44575-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 02. maj 2022 ob 16:40:09 CEST je Chukun Pan napisal(a):
> The NanoPi R1S H5 has a Realtek RTL8153B USB 3.0 Ethernet chip
> connected to the USB 2.0 port of the Allwinner H5 SoC.
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts b/
arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts
> index 55b369534a08..dd655a491549 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts
> @@ -21,7 +21,8 @@ / {
>  
>  	aliases {
>  		ethernet0 = &emac;
> -		ethernet1 = &rtl8189etv;
> +		ethernet1 = &rtl8153;
> +		ethernet2 = &rtl8189etv;
>  		serial0 = &uart0;
>  	};
>  
> @@ -116,6 +117,11 @@ &cpu0 {
>  
>  &ehci1 {
>  	status = "okay";

You need to add #address-cells and #size-cells properties, otherwise "make 
dtbs_check W=1" generates warnings.

Best regards,
Jernej

> +
> +	rtl8153: device@1 {
> +		compatible = "usbbda,8153";
> +		reg = <1>;
> +	};
>  };
>  
>  &ehci2 {
> -- 
> 2.25.1
> 
> 


