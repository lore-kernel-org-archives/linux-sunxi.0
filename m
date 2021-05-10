Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4502670
	for <linux-sunxi@lists.linux.dev>; Mon, 10 May 2021 15:30:48 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id u5-20020a7bc0450000b02901480e40338bso9894329wmc.1
        for <linux-sunxi@lists.linux.dev>; Mon, 10 May 2021 08:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BIpftz5QKaqbdczxyxTMwM8Y/OLzgltNif3KujXG5rU=;
        b=DqkSjiy4YmypNkE5TQC+Wlabp95BO/iGGaqY2XM/1MAevutq75qI++4Ggz0EIsaQzE
         +cruWV04cD0qoKs2VblpL5cWhYq8m74vdt0PmFdwMtc9rt1X9WL4f/tYZPn1QWF+ZYVC
         3yq+i3dFmtZ6BomH+YVaQ8zuT1rzB+Ve6HC8JOe9oXe3SSWkjh6YmoV+uEMlwrthy5Ae
         nJ3YejhbM47/W+zKt72oss6w/0pnVvoa+f+6jc3Jv7FwgGuIjAGZz7+cp/++U801VsOb
         kkMSBpK0quUyN8HSOGVyFdWfVl1zDn2gM2lMJM+U0lO2Ymub3wWLRmlI2HnYIe19xW9u
         fW1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BIpftz5QKaqbdczxyxTMwM8Y/OLzgltNif3KujXG5rU=;
        b=HDF3erWlOupnXSjh2VofGggitVWmV/NJg1EEg+Pe9OC1OO7VErl7dYZIrAeZoDGQVw
         zSYvlNufyU7q07tfXOdEQJ/YkfWRt5FjVI86sY7TeB+bmf4MSc7Euwfc1W3evCOhpkKy
         FtOEBVuOVotg7sj+Tj9YMV+OKUf4wLF/jGTk+CAavXxEdS3bl7V0S6lzIJ/Vu2P8HeN9
         1gIboUaXEqEEXbegs9z2jeGv2wRqIre4AcPQP041jZiIAOMWihutf3Nu9QZJrFhiyRDh
         +bdvr6rb/zxcP/KgeImMxT2/PW/ASBgwlGsNZ33UMv8qN322OHtzGzR8W9kvVK5QWu9a
         /tYw==
X-Gm-Message-State: AOAM533uJMJ1pNiuMu+oCmCo9JVLpn8x2JQsPUBpynBFigCjOjq3rUY5
	LuY5ihU0E9PLbbCDYWLQbTfOg+v/m1k+iw==
X-Google-Smtp-Source: ABdhPJwZRoaeQtZWSrmI8dVBe7amjp6/ZX2fc1ylbmWzbySigiBRWFKDVeUbBjDHJrAiyhbAKKn6+A==
X-Received: by 2002:a05:600c:154a:: with SMTP id f10mr27351030wmg.31.1620660646776;
        Mon, 10 May 2021 08:30:46 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-17-133.cable.triera.net. [86.58.17.133])
        by smtp.gmail.com with ESMTPSA id 61sm25983049wrm.52.2021.05.10.08.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 08:30:46 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Andre Przywara <andre.przywara@arm.com>
Cc: Icenowy Zheng <icenowy@aosc.io>, Samuel Holland <samuel@sholland.org>, Corentin Labbe <clabbe@baylibre.com>, =?ISO-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] arm64: dts: allwinner: Pine H64: Enable USB 3.0 port
Date: Mon, 10 May 2021 17:30:44 +0200
Message-ID: <2288435.7XXmsQVVxE@kista>
In-Reply-To: <20210510130119.6534-1-andre.przywara@arm.com>
References: <20210510130119.6534-1-andre.przywara@arm.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Andre!

Dne ponedeljek, 10. maj 2021 ob 15:01:19 CEST je Andre Przywara napisal(a):
> The Pine H64 board features an USB 3.0 type A port, which works just
> fine.
> 
> Enable the controller and USB PHY in the .dts to make it usable.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts b/arch/
arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
> index 1ffd68f43f87..9061c9913f4c 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
> @@ -89,6 +89,10 @@
>  	status = "okay";
>  };
>  
> +&dwc3 {
> +	status = "okay";
> +};
> +
>  &ehci0 {
>  	status = "okay";
>  };
> @@ -332,3 +336,8 @@
>  	usb3_vbus-supply = <&reg_usb_vbus>;
>  	status = "okay";
>  };
> +
> +&usb3phy {
> +	phy-supply = <&reg_usb_vbus>;
> +	status = "okay";
> +};
> -- 
> 2.17.5
> 

Exactly the same patch was already proposed by Icenowy. In short, PHY is 
powered by internal power and doesn't need phy-supply property. It's connector 
that needs power supply. One of her latest attempts can be found here: 
https://lore.kernel.org/patchwork/cover/1058917/

Best regards,
Jernej


