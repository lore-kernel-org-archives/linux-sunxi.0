Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E57D532
	for <linux-sunxi@lists.linux.dev>; Wed, 16 Nov 2022 18:43:06 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id l14so31395434wrw.2
        for <linux-sunxi@lists.linux.dev>; Wed, 16 Nov 2022 10:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LBaY/WJzVWLKKpmx/+z8bD3CIwXoF9pDegWY/faLe6Y=;
        b=HbTr+ZXEhEtQWkZTJ0mRjOoV4Xux9aiWlecBD6Z2x2HzL6nBaUlB7TowUoq/hFQohc
         Pb+57O2/D1s7mN6RjZxE50ruzL+9dAastX4Lmub6itxhBEwgfPb/ckKUxnmOUns/fgVq
         KAb8jMQsHPmGOxAb5PUCwvh907hk4Be8GipvRKFbuhEyhuRL0Oaoc8FsGOvi0fP1tMAG
         RKfMfNHVSSVkAymvUe270FkFgR7XtXRNYdVN5rKm42c7224sOmBRyCKDPNhwU39SBMdv
         xr/585rT9b8HmTilDqyOW9MA/gpLh6Afur/TLvvwrTVp2c4sqfjD3zVYPIXbmnZ9A3wb
         d/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LBaY/WJzVWLKKpmx/+z8bD3CIwXoF9pDegWY/faLe6Y=;
        b=sz9j1YosUcLAYt9qA13XhRGOYnAUTBmNTgB7JTm1vG/Ce7jjNqRQJuRYhz3A6jszr/
         fG+nvE/fEFbfWTPlc18VMwiBEg9ATz7yscZRy8ZC4dhaU7y33xl5+2+URINUOvWyP/VF
         YvtqDTkBN/xoHEuXnO/ew+AM5IX45xkgZ1acIB7djVuxyw8XQhjs4UAkHaXq0LN8DVcE
         kzZLMOviYp8Lke/V2+xqg4z+50mtpZYQ+n/YOtevH/IxuEwTLaCfHlqxwaYQJw54XQtF
         zaCFO2k2Hz/T6Moe/4GNJMottiocd0IcpDEm3/BEtvy4O3G92aHH1ufXcOFnktSlXK9J
         AqeA==
X-Gm-Message-State: ANoB5pnt1enVvh69AFwBa+WIPvOOuF373K1etOzulAMedc/4UOjryH/7
	tvJdYnMZeOLBUCoW+iJ0Qts=
X-Google-Smtp-Source: AA0mqf4KxTiBnxlDFEOhZzRB+kB1sRhxWzJb3nz3Qqe5bT8HaglG/kSj7W8zuIaZXDMf+4zStInFAA==
X-Received: by 2002:adf:cd11:0:b0:236:aacc:ea07 with SMTP id w17-20020adfcd11000000b00236aaccea07mr15176391wrm.36.1668624185131;
        Wed, 16 Nov 2022 10:43:05 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id j6-20020a05600c1c0600b003a3170a7af9sm3306725wms.4.2022.11.16.10.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 10:43:04 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: Icenowy Zheng <uwu@icenowy.me>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] ARM: dts: sunxi: H3/H5: Add phys property to USB HCI0
Date: Wed, 16 Nov 2022 19:43:03 +0100
Message-ID: <4782467.31r3eYUQgx@kista>
In-Reply-To: <20221110005507.19464-1-andre.przywara@arm.com>
References: <20221110005507.19464-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 10. november 2022 ob 01:55:07 CET je Andre Przywara napis=
al(a):
> As many other Allwinner SoCs from the last years, the first USB host
> controller pair in the Allwinner H3 and H5 chips share a USB PHY with
> the MUSB OTG controller. This is probably the reason why we didn't have
> a "phys" property in those host controller nodes.
> This works fine as long as the MUSB controller driver is loaded, as this
> takes care of the proper PHY setup, including the muxing between MUSB
> and the HCI.
>=20
> However this requires the MUSB driver to be enabled and loaded, and also
> upsets U-Boot, which cannot use a HCI port without a "phys" property.
>=20
> Similar to what we did in commit cc72570747e4 ("arm64: dts: allwinner:
> A64: properly connect USB PHY to port 0"), add the "phys" property to
> the OHCI0 and EHCI0 DT nodes in the shared H3/H5 .dtsi file.
>=20
> This is not only the proper description of the hardware, but also avoids
> a nasty error message in U-Boot triggered by a recent patch. (The port
> never worked in host mode, but the error was suppressed due to a bug.)
>=20
> When using the MUSB port in OTG mode, this also fixes host mode
> switching, so people can use OTG adapters to connect a USB device to
> port 0.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


