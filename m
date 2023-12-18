Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AFC6FA4
	for <linux-sunxi@lists.linux.dev>; Mon, 18 Dec 2023 05:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6d267461249so1098924b3a.3
        for <linux-sunxi@lists.linux.dev>; Sun, 17 Dec 2023 21:47:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702878466; x=1703483266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rrx4x4gxOs9//fUQ/qtU4i8IyAsgdyeWOL5Kwx7Cc4o=;
        b=XwqdJ+Wu4UhQtVmfbnD/DCGgt0jIPu5twJ34vlPJ+VM6k6plJAejEyW1yaFLHBPZ3a
         P3QQiiw6oaKfSsXHy6sqA/hl/GA+jFY/H6ZGQe3rujSDaQxeTDxeT+/YOGxy+XyN5eaI
         iaAFQnR3p75SjZPFo7WgAqr+B3sfiQqqAU/aVR96YIsf1ParCw1t5YRbVaU1FzdpBLBw
         p61xcas0jkuFC+7wTB3z+FUQ1P7gFppvYjILGE5b7wCHIYY/S/9UMUzMRF7vxL6+FNzP
         fKBVgDLkQ6pzW/nTp/P+8s4WwyAYYqLPg1FLQPhf452QV7Q5I0P0/F4DFgODYqAtU6j0
         DOKQ==
X-Gm-Message-State: AOJu0YyXaeR7QgvqKGSqV06tODRGQOqB758DaFpHV1bkGL+dQFpwLDo2
	MlgMS1OuSRhguOYe3u0ZtXdV794pLobW7g==
X-Google-Smtp-Source: AGHT+IHxUAnRTrjIJWpOD40A2mx4lwdVDkfW7DmBcWtWnXYEjVQUByZtrOmnum6eoLkKtTCpckYDmw==
X-Received: by 2002:a05:6a21:999c:b0:18f:97c:5b99 with SMTP id ve28-20020a056a21999c00b0018f097c5b99mr7332750pzb.103.1702878466112;
        Sun, 17 Dec 2023 21:47:46 -0800 (PST)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com. [209.85.216.54])
        by smtp.gmail.com with ESMTPSA id jj18-20020a170903049200b001d3650256fdsm5088521plb.294.2023.12.17.21.47.45
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Dec 2023 21:47:45 -0800 (PST)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-28abca51775so884164a91.1
        for <linux-sunxi@lists.linux.dev>; Sun, 17 Dec 2023 21:47:45 -0800 (PST)
X-Received: by 2002:a17:90a:9dc9:b0:28b:2640:c5f4 with SMTP id
 x9-20020a17090a9dc900b0028b2640c5f4mr1445658pjv.28.1702878464920; Sun, 17 Dec
 2023 21:47:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231217232405.302-1-andre.przywara@arm.com>
In-Reply-To: <20231217232405.302-1-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 18 Dec 2023 13:47:33 +0800
X-Gmail-Original-Message-ID: <CAGb2v67hmuHTQmGCWuop1xag7PJRd5+aTDJb8pHAhTh3V-Cy7w@mail.gmail.com>
Message-ID: <CAGb2v67hmuHTQmGCWuop1xag7PJRd5+aTDJb8pHAhTh3V-Cy7w@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: dts: allwinner: Add BananaPi M4 Berry
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Icenowy Zheng <uwu@icenowy.me>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 18, 2023 at 7:24=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> The BananaPi M4 Berry is a development board with the Allwinner H618
> SoC. It comes with 2GB DRAM and 8GB eMMC flash, with the usual suspects
> like HDMI, SD card, GPIO headers. There are four USB ports connected
> via an on-board hub chip, and a Gigabit Ethernet socket. Also there is
> a USB WiFi chip soldered on the board.
> More details: https://linux-sunxi.org/Sinovoip_Banana_Pi_M4_Berry
>
> I don't have this board, so this is a "call for testing".
> One thing to consider:
> - The USB WiFi chip has a CHIP_EN pin, which can turn the chip off.
>   It is pulled up by a resistor, so works out of the box, but is also
>   connected to a GPIO (PC2), so the chip can be disabled or reset via
>   this pin. Since this is a USB device, we don't have a DT node to
>   announce this pin. Any ideas how this should be handled? At the moment
>   I ignore it, but it could also be modelled as a USB VBUS regulator for
>   USB port 1, to which it is connected.

There was a talk on this topic at Plumbers:

https://lpc.events/event/17/contributions/1507/

So I'd say a proper solution is being worked on.

ChenYu

> When testing this, please have a look at:
> - Does the eMMC work in HS200 mode? The vendor DT described that as a
>   3.3V controlled eMMC only, but clearly the schematic uses 1.8V, which
>   allows faster transfer modes. "hdparm -t" should suffice for a quick
>   test.
> - Do USB full-speed (aka USB v1.1) peripherals like keyboard or mouse
>   work on the USB ports? I disabled the OHCI node, since the hub should
>   not need this, but it would be good to double check.
> - Similarly the USB WiFi chip probably doesn't need USB 1.1 modes, so
>   please check this still works.
>
> Apart from the missing audio and video support (which are due to missing
> bindings for the H616/H618 SoC), most of the peripherals are supported.
>
> Patch 1/2 adds the board compatible string to the bindings, patch 2/2
> adds the actual .dts file.
>
> Please have a look!
>
> Thanks,
> Andre
>
> Andre Przywara (2):
>   dt-bindings: arm: sunxi: document BananaPi M4 Berry board name
>   arm64: dts: allwinner: h618: add BananaPi M4 Berry board
>
>  .../devicetree/bindings/arm/sunxi.yaml        |   5 +
>  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
>  .../sun50i-h618-bananapi-m4-berry.dts         | 229 ++++++++++++++++++
>  3 files changed, 235 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h618-bananapi-m4=
-berry.dts
>
> --
> 2.35.8
>
