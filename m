Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF1A4C89
	for <linux-sunxi@lists.linux.dev>; Fri,  2 Dec 2022 16:52:58 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id bp12so2295633ilb.9
        for <linux-sunxi@lists.linux.dev>; Fri, 02 Dec 2022 08:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pt4n+Bc+eDdCru9ZY4GLZ4Q8PtpiBAtoUiS2Dufe20M=;
        b=RDLXegfhfNzZVOEiLG3Xs6+uYe8OAYXU1MhaAQWOrsBarzTzN/dPBkKdAMqADWe2BN
         LwZgOtZEsPva5jY9b0sxLN3yFrNv9HZT5LaXky9DGBme+/+K7aU705E2+llHmX0iIhAj
         Jn7EY8sIHWNTUGBvJ2wA2W0dzkUc+D8PHjYQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pt4n+Bc+eDdCru9ZY4GLZ4Q8PtpiBAtoUiS2Dufe20M=;
        b=zeKiNPBzd1qZaGmPwAwvjtzH+b/zCgqZv3OFUPgDNjkhUXFlxw3JWLLrlInzvP/cnF
         Uys2WIHNfZqLZOTtD8CketsJyr1NsEcjjZ7GuNSA0zhFihIawxvYMy/AHd3f4dXKmQ0F
         BeFI9SdT1QtNK4u3ONKZBbjnA7bFwgZU4yREf7EJp8O2Edxt+2fE02qzHSrf9sKyI/9H
         2MLGc+AU97BG1s+e6WJn0SkHUgHc4I5m7svNlkDn8/jPuXAmnFkuHrA6stlb37EkInt3
         cElDGtp11ClERu/ZvITMbvADDCOkacXlxSWVX4l1La7R5E7xGcFpSWUr1obXCkxnRRZ5
         wf6Q==
X-Gm-Message-State: ANoB5pmCgqo+VFrLfGfXdP2QmZY1efi6M3bGoJXxZjWl/Ax77TUQt3FC
	sCBx4ehT2yllGd/fTJCPPDaBHw==
X-Google-Smtp-Source: AA0mqf5258QR3nGa5TuixpgHlPAodopMppWne3AWeZO4Dc+3ajcjKPVWFgo23JOBLlXdud+lP5NhhA==
X-Received: by 2002:a92:504:0:b0:303:634:b07d with SMTP id q4-20020a920504000000b003030634b07dmr13958276ile.25.1669999977388;
        Fri, 02 Dec 2022 08:52:57 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id f3-20020a05660215c300b006dfd3599b60sm2326297iow.26.2022.12.02.08.52.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 08:52:56 -0800 (PST)
Date: Fri, 2 Dec 2022 16:52:56 +0000
From: Matthias Kaehlcke <mka@chromium.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 3/6] usb: misc: onboard_usb_hub: add Genesys Logic
 GL850G hub support
Message-ID: <Y4otaPmwWfJ24I7k@google.com>
References: <20221202081647.3183870-1-uwu@icenowy.me>
 <20221202081647.3183870-4-uwu@icenowy.me>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221202081647.3183870-4-uwu@icenowy.me>

On Fri, Dec 02, 2022 at 04:16:44PM +0800, Icenowy Zheng wrote:
> Genesys Logic GL850G is a 4-port USB 2.0 STT hub that has a reset pin to
> toggle and a 3.3V core supply exported (although an integrated LDO is
> available for powering it with 5V).
> 
> Add the support for this hub, for controlling the reset pin and the core
> power supply.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>

Acked-by: Matthias Kaehlcke <mka@chromium.org>

> ---
> Changes in v2:
> - Sort things, by names or vendor IDs.
> 
>  drivers/usb/misc/onboard_usb_hub.c | 2 ++
>  drivers/usb/misc/onboard_usb_hub.h | 5 +++++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
> index d63c63942af1..94e7966e199d 100644
> --- a/drivers/usb/misc/onboard_usb_hub.c
> +++ b/drivers/usb/misc/onboard_usb_hub.c
> @@ -331,6 +331,7 @@ static struct platform_driver onboard_hub_driver = {
>  
>  /************************** USB driver **************************/
>  
> +#define VENDOR_ID_GENESYS	0x05e3
>  #define VENDOR_ID_MICROCHIP	0x0424
>  #define VENDOR_ID_REALTEK	0x0bda
>  #define VENDOR_ID_TI		0x0451
> @@ -407,6 +408,7 @@ static void onboard_hub_usbdev_disconnect(struct usb_device *udev)
>  }
>  
>  static const struct usb_device_id onboard_hub_id_table[] = {
> +	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0608) }, /* Genesys Logic GL850G USB 2.0 */
>  	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2514) }, /* USB2514B USB 2.0 */
>  	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x0411) }, /* RTS5411 USB 3.1 */
>  	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x5411) }, /* RTS5411 USB 2.1 */
> diff --git a/drivers/usb/misc/onboard_usb_hub.h b/drivers/usb/misc/onboard_usb_hub.h
> index 34beab8bce3d..62129a6a1ba5 100644
> --- a/drivers/usb/misc/onboard_usb_hub.h
> +++ b/drivers/usb/misc/onboard_usb_hub.h
> @@ -22,10 +22,15 @@ static const struct onboard_hub_pdata ti_tusb8041_data = {
>  	.reset_us = 3000,
>  };
>  
> +static const struct onboard_hub_pdata genesys_gl850g_data = {
> +	.reset_us = 3,
> +};
> +
>  static const struct of_device_id onboard_hub_match[] = {
>  	{ .compatible = "usb424,2514", .data = &microchip_usb424_data, },
>  	{ .compatible = "usb451,8140", .data = &ti_tusb8041_data, },
>  	{ .compatible = "usb451,8142", .data = &ti_tusb8041_data, },
> +	{ .compatible = "usb5e3,608", .data = &genesys_gl850g_data, },
>  	{ .compatible = "usbbda,411", .data = &realtek_rts5411_data, },
>  	{ .compatible = "usbbda,5411", .data = &realtek_rts5411_data, },
>  	{ .compatible = "usbbda,414", .data = &realtek_rts5411_data, },
> -- 
> 2.38.1
> 
