Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5872E2FAD
	for <linux-sunxi@lists.linux.dev>; Wed, 26 May 2021 17:07:27 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id b17so2466047ede.0
        for <linux-sunxi@lists.linux.dev>; Wed, 26 May 2021 10:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z91dBCewH/Na03knGSApB4/TS7eLMhK4Q7bnZYb8DG8=;
        b=FFhSe4bzOzHL9l4wbuEwGz+lZ6O5iUfkHHd82mf4Yusy5LGFw2iJD6rg1LZjc+KKNQ
         06w0yiWLXTZMI7eqfb1FSvEusdOkKsNskXdngD39l+uZrwVkh+JotIfIpD/jg2AEi2zh
         YBMr0FyEpzBFAwqDbt8UgiLx6zXSac1jlRyrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z91dBCewH/Na03knGSApB4/TS7eLMhK4Q7bnZYb8DG8=;
        b=QN3jul9nXXBSXAidbhtPMLZCxHhy5BgVhYE0H3cR/7w4t67dXSjP6ZrUbEOgHzhs+p
         NmqXFaExSaf26B9DVpZ8Tuizp8ozSnX74/RCQ+WDqkKve7E4fQdWqEfbz9IRuUjAIKeR
         kWQ8E5nN+cntgbSHysYrRJKy4YMi2H71RgF3JmAeVZIPTgykO9Ay4R/kY5oUVkSmaVky
         yoD+a6l9zp3wyfSpsLnSReIFkI5f+eb0Bf/dRbqBmgt8W4KtK7MZxg7S8rT9Y6iK7RNS
         357khpGVN1CPYF4FLnq0EoHH0NhrMfsCP0op6bkMCr2i5HoH8XPMb1jsfxGEtUiBa4VP
         tujg==
X-Gm-Message-State: AOAM532EP1xLLd32enagfDlxembD4ppcDpQ/s9FwIQAGTMibt4AAgRtp
	KK3/BNjlcPA0PMwpzFxZZ6e+Pyg3Rg5XTHyqB1OgJBX0nNMEmkJP
X-Google-Smtp-Source: ABdhPJwBj91M+VGoD1WN1RRXQeienipIOV6VOnqWs8e4kBVR5Bg1mXLNpYCR2sadHx19+r64APWnmgA42yNlfV5rlfM=
X-Received: by 2002:a50:c09a:: with SMTP id k26mr39080769edf.27.1622048845570;
 Wed, 26 May 2021 10:07:25 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210526005718.23767-1-andre.przywara@arm.com>
In-Reply-To: <20210526005718.23767-1-andre.przywara@arm.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 26 May 2021 22:37:14 +0530
Message-ID: <CAMty3ZC+8up9TPDVjPJPzico4gWQ7zJOG9t4Pcrrq1u7Pqpuow@mail.gmail.com>
Subject: Re: [PATCH] phy: sun4i-usb: Fix PHY0 routing and passby configuration
 for MUSB
To: Andre Przywara <andre.przywara@arm.com>
Cc: U-Boot-Denx <u-boot@lists.denx.de>, Paul Kocialkowski <contact@paulk.fr>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Icenowy Zheng <icenowy@aosc.io>, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, May 26, 2021 at 6:27 AM Andre Przywara <andre.przywara@arm.com> wrote:
>
> From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
>
> Recent Allwinner platforms (starting with the H3) only use the MUSB
> controller for peripheral mode and use HCI for host mode. As a result,
> extra steps need to be taken to properly route USB signals to one or
> the other. More precisely, the following is required:
> * Routing the pins to either HCI/MUSB (controlled by PHY);
> * Enabling USB PHY passby in HCI mode (controlled by PMU).
>
> The current code will enable passby for each PHY and reroute PHY0 to
> MUSB, which is inconsistent and results in broken USB host support
> for port 0.
>
> Passby on PHY0 must only be enabled when we want to use HCI. Since
> host/device mode detection is not available from the PHY code and
> because U-Boot does not support changing the mode dynamically anyway,
> we can just mux the controller to MUSB if it is enabled and mux it to
> HCI otherwise.
>
> This fixes USB host support for port 0 on platforms with PHY0 dual-route,
> especially on boards like Pine64 (with only USB-A host ports) and
> TV boxes without OTG ports.
>
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> [Andre: tweak commit message, use IS_ENABLED()]
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
> Hi,
>
> for H6 boards to work this requires a DT update (to get the <&usbphy 0>
> links between HCI and PHY), which I will send later.
> Tested on Pine H64, Pine64-LTS, OrangePi Zero, OrangePi PC 2, BananaPi M64,
> BananaPi M1.
>
> Cheers,
> Andre
>
>  drivers/phy/allwinner/phy-sun4i-usb.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
> index 5723c980323..e6ceafc7648 100644
> --- a/drivers/phy/allwinner/phy-sun4i-usb.c
> +++ b/drivers/phy/allwinner/phy-sun4i-usb.c
> @@ -313,9 +313,21 @@ static int sun4i_usb_phy_init(struct phy *phy)
>                                     data->cfg->disc_thresh, PHY_DISCON_TH_LEN);
>         }
>
> -       sun4i_usb_phy_passby(phy, true);
> +       if (IS_ENABLED(CONFIG_USB_MUSB_SUNXI)) {

I believe i did comment this before to use driver_data flag as this is
full dm driver instead of macro style.

Jagan.
