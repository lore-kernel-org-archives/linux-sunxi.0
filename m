Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCA22F80
	for <linux-sunxi@lists.linux.dev>; Mon, 24 May 2021 12:51:51 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id h16so31787070edr.6
        for <linux-sunxi@lists.linux.dev>; Mon, 24 May 2021 05:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dD9JUS/9clmQAwtTw0oy+Y0L6eGW7GOSlCzKvAfOcqI=;
        b=uXZObOQAWLi+UqUELweUTgzr0xS+D+JIv93PqQnNec9m1DWvK3ICqM51zXr3H1LNYr
         niW8fRxeIc6J8YtGGWrvJBOLrerpqW314Klei3EwcaLDhhac5I5dcMSMok8WaKoH2AuX
         LGVvbwYGNZEn2k/XNFTXFa6YWl2fdccjLZ9dLzgsUWMhoLktKRLUdGC0J5w+3U2SqgPv
         +BQhqksplDDFCbLkURCCWhxg5XeZez34ewqV9eMPcoh9HFkEr+tQ89VS2EPTjJA+PwvF
         hrDIBl/uE8oybSgvxlaOLY8vpWrfyxawVPh3gTz+4SfBcQoQ4nEVnOgrr0OvFjFgYyLH
         onjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dD9JUS/9clmQAwtTw0oy+Y0L6eGW7GOSlCzKvAfOcqI=;
        b=o7RA3mUpUiWOaKi1/lINKwa4vXYYtMRHuk8SclfDYULSIb9IkgH3CXgeaOzndb8Q/X
         9HWEESWNcH5kD7M2KPweJAdIjcKgsWe696r4uFwiVkmVxjab9/Win802/UpEkXOwjoVR
         0aTQmP/ug3cMJLjHpmr1hLUzevL4zshDjUgsmW2MdEVDzg4UaMk3VER4hjh4HSFCKzd8
         LZ8VVI4JY4QLox+cLCdtPTbdABYCR/oaUogkiMrbjJTsL1rhrDwEKq8+2w3EkJaUAMcO
         BO8iK5hh0ZoCNyecp7rSmuQoKrd6VTcUxrTFfDra1ykpcoJyluBOnye1w2jj+Bx+WIBh
         E03w==
X-Gm-Message-State: AOAM533I1wYnxYsfjFayAMZoYXisFaSvu7xKEGnh925wZxDPmFUEO2hf
	gIW0b5UhJwW8a/m1qO247zc=
X-Google-Smtp-Source: ABdhPJyMEkKmMiyUQ3uf21R2RgYMv75IOOJQ9W04QhJLUu7XPaq6mnxSqiA+tfBvgJn1FPWNjpSyNg==
X-Received: by 2002:a05:6402:35c4:: with SMTP id z4mr25067694edc.362.1621860709805;
        Mon, 24 May 2021 05:51:49 -0700 (PDT)
Received: from jernej-laptop.localnet (cpe-86-58-17-133.cable.triera.net. [86.58.17.133])
        by smtp.gmail.com with ESMTPSA id u1sm9282891edv.91.2021.05.24.05.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 05:51:49 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>, Maxime Ripard <maxime@cerno.tech>
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh@kernel.org>, Icenowy Zheng <icenowy@aosc.io>, Samuel Holland <samuel@sholland.org>, Ondrej Jirman <megous@megous.com>, linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v6 12/17] phy: sun4i-usb: Introduce port2 SIDDQ quirk
Date: Mon, 24 May 2021 14:51:47 +0200
Message-ID: <2348352.12aM7klthN@jernej-laptop>
In-Reply-To: <20210524115946.jwsasjbr3biyixhz@gilmour>
References: <20210519104152.21119-1-andre.przywara@arm.com> <20210519104152.21119-13-andre.przywara@arm.com> <20210524115946.jwsasjbr3biyixhz@gilmour>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 24. maj 2021 ob 13:59:46 CEST je Maxime Ripard napisal(a):
> Hi
> 
> On Wed, May 19, 2021 at 11:41:47AM +0100, Andre Przywara wrote:
> > At least the Allwinner H616 SoC requires a weird quirk to make most
> > USB PHYs work: Only port2 works out of the box, but all other ports
> > need some help from this port2 to work correctly: The CLK_BUS_PHY2 and
> > RST_USB_PHY2 clock and reset need to be enabled, and the SIDDQ bit in
> > the PMU PHY control register needs to be cleared. For this register to
> > be accessible, CLK_BUS_ECHI2 needs to be ungated. Don't ask ....
> > 
> > Instead of disguising this as some generic feature, do exactly that
> > in our PHY init:
> > If the quirk bit is set, and we initialise a PHY other than PHY2, ungate
> > this one special clock, and clear the SIDDQ bit. We can pull in the
> > other required clocks via the DT.
> > 
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> 
> What is this SIDDQ bit doing exactly?

If this is similar to Rockchip USB PHY, then this bit takes care for powering 
up/down analog parts of USB PHY:
https://elixir.bootlin.com/linux/latest/source/drivers/phy/rockchip/phy-rockchip-usb.c#L83

Best regards,
Jernej

> 
> I guess we could also expose this using a power-domain if it's relevant?
> 
> Maxime




