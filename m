Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443A7D52D
	for <linux-sunxi@lists.linux.dev>; Wed, 16 Nov 2022 18:54:44 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id c3-20020a1c3503000000b003bd21e3dd7aso2373272wma.1
        for <linux-sunxi@lists.linux.dev>; Wed, 16 Nov 2022 10:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ybyDfMaptLNYKWD0owp2GZmuItR1V5USB+ky4BlQ1A=;
        b=m57mzC8x4EHy9wnOUTbmr5oByjJbg4hWZTLniudXGnhzS8eDLGMtVAMcytNLnF+H/V
         EQtO6ntAziH8YfUOLxUQjHZJvHPrtpbDc9A1cpF5ELFLJ9pk5E/u6W8biAGff5h+BOCk
         dzcuwgz8LzbGN/E22k5xsjIN9Rh+W2qkde7aiyaDZFZGYKShPg1i0NzHg4PioNc4TrtW
         y5qRhV5F463VgZgJ13o9pXYOyi7jWkKmXN5pQgPEq7I6Cx/cZi/tUV0mPK7jOFYu19WG
         Ihr2VfC69YhVOZseqnkF9MDlCQNklCee736kCJoxCdLH5ufL8GiZ2ouCtYAfGGC+DY09
         xRYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ybyDfMaptLNYKWD0owp2GZmuItR1V5USB+ky4BlQ1A=;
        b=n9JgoSvgLpU8hZTDrilELnT46raUfeHHK21VE/Z7wJmlbxRxXPv83PJDEBJusQ3sD9
         5qw+IJOzPJ2lvacE8WVj6Fi3p1TdvR6C3Z1/LNc9mF/6YoNSl93wBtGp8x6CLKyhhOOX
         r8Llxl1aT08+mNKd32nB7VlFFgXVxNW8cDrUZTDsUQwTRYyl/yxQZFJ9PWTqJMY4GOnE
         njrQGn2z/lx3TGhB5JOP8jck5LJwuLG2Oj1qaG5XM7X/GwApJqC9PMAmDPSEnOXCcabV
         7rBpRAho06s01PkPrrs1bRIWN5kt7stl9ZbaPCB8ksnig0Fnv+c3cyFZLl+T3adUxiVa
         WtDw==
X-Gm-Message-State: ANoB5plXlACRz7LKX/uny+ENIQ2wCXb2O4BmWl6VnlwRzqqGoC0viMF2
	l1eNxhLD2KuA56LvXuey7Ag=
X-Google-Smtp-Source: AA0mqf6ghleNAdh1yxVRZLLOw9YwnmvyHS2SCQYUTSX34rkHE7Eqi+hHbt2a9W/AYOiRADQLswPV/w==
X-Received: by 2002:a05:600c:4e51:b0:3cf:713a:c947 with SMTP id e17-20020a05600c4e5100b003cf713ac947mr3152876wmq.40.1668624882609;
        Wed, 16 Nov 2022 10:54:42 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id 9-20020a05600c228900b003b3365b38f9sm2909469wmf.10.2022.11.16.10.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 10:54:42 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: Icenowy Zheng <uwu@icenowy.me>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] ARM: dts: sunxi: H3/H5: Add phys property to USB HCI0
Date: Wed, 16 Nov 2022 19:54:41 +0100
Message-ID: <13140087.uLZWGnKmhe@kista>
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

Applied, thanks!

Best regards,
Jernej


