Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2C0A461
	for <linux-sunxi@lists.linux.dev>; Mon, 28 Nov 2022 18:01:54 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id f6so5394204ilu.13
        for <linux-sunxi@lists.linux.dev>; Mon, 28 Nov 2022 10:01:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xmy4KXaQFNlqj17WY1ADV6bqsA77u7z6qE1PaxwlJXo=;
        b=utt0iIQLBL7LruwXcZgWUHwQQ/CS5IS8uuGThkqakpKnUV4507QnK/j72vIlSkRmhr
         HoWMHCfAdNB0iNB2i6cYCc7ptfGKVSJNyRVnImKEZd0HS8WJVO9M9insVKdA2Pi49tc1
         MVa2ii0fPJ15FeLxUzIZJfYn0r7jJTgx4rTiljD9jrp5iv9XjWNRrSPKB7Qimofnmvi/
         1G7+xEaGqpRXjMaAwVIoRFJd/3fRdlPQhR0o9ie09jH3BAq89f52FN0OROht8Ls/Hya2
         2zyz0TodYdTX1N4tzFEqDESYAHTLUm0NJiZFgPlODrKvVG2VLe9SkC25Z9gKh4k5Njri
         CgqQ==
X-Gm-Message-State: ANoB5pm2wUXPP5uYZRlXP9xG/O/9mH8qmh5Snvvl3JPv7tElg2bujFH6
	OTpyQHW5D4rIRKE+z1ga3HDleg==
X-Google-Smtp-Source: AA0mqf70pG2zhhWmQ9tBm9b/zMsiZnG4JD+s+a0G/ChoykXinRgJm8GCPsBwkj7EV/Ro3wduiUVaCA==
X-Received: by 2002:a05:6e02:c65:b0:302:f4f5:8691 with SMTP id f5-20020a056e020c6500b00302f4f58691mr9364754ilj.206.1669658513537;
        Mon, 28 Nov 2022 10:01:53 -0800 (PST)
Received: from google.com (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with ESMTPSA id o3-20020a02a1c3000000b0037477c3d04asm4326772jah.130.2022.11.28.10.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 10:01:52 -0800 (PST)
Date: Mon, 28 Nov 2022 18:01:50 +0000
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
Subject: Re: [PATCH 3/6] usb: misc: onboard_usb_hub: add Genesys Logic GL850G
 hub support
Message-ID: <Y4T3ju7FTb6994HT@google.com>
References: <20221127073140.2093897-1-uwu@icenowy.me>
 <20221127073140.2093897-4-uwu@icenowy.me>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221127073140.2093897-4-uwu@icenowy.me>

On Sun, Nov 27, 2022 at 03:31:37PM +0800, Icenowy Zheng wrote:
> This is a 4-port USB 2.0 STT hub.

The commit message is supposed the describe the change, which
is almost certainly not a 4-port USB 2.0 STT hub :)

It could be something like "Add support for the Genesys Logic
GL850G, which is a 4-port USB 2.0 STT hub."

> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>  drivers/usb/misc/onboard_usb_hub.c | 2 ++
>  drivers/usb/misc/onboard_usb_hub.h | 5 +++++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
> index d63c63942af1..f5c71d724be6 100644
> --- a/drivers/usb/misc/onboard_usb_hub.c
> +++ b/drivers/usb/misc/onboard_usb_hub.c
> @@ -334,6 +334,7 @@ static struct platform_driver onboard_hub_driver = {
>  #define VENDOR_ID_MICROCHIP	0x0424
>  #define VENDOR_ID_REALTEK	0x0bda
>  #define VENDOR_ID_TI		0x0451
> +#define VENDOR_ID_GENESYS	0x05e3

Please insert the new entry in alphabetical order, i.e. before
VENDOR_ID_MICROCHIP.

>  
>  /*
>   * Returns the onboard_hub platform device that is associated with the USB
> @@ -414,6 +415,7 @@ static const struct usb_device_id onboard_hub_id_table[] = {
>  	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x5414) }, /* RTS5414 USB 2.1 */
>  	{ USB_DEVICE(VENDOR_ID_TI, 0x8140) }, /* TI USB8041 3.0 */
>  	{ USB_DEVICE(VENDOR_ID_TI, 0x8142) }, /* TI USB8041 2.0 */
> +	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0608) }, /* Genesys Logic GL850G USB 2.0 */

Same here, the table is ordered alphabetically

>  	{}
>  };
>  MODULE_DEVICE_TABLE(usb, onboard_hub_id_table);
> diff --git a/drivers/usb/misc/onboard_usb_hub.h b/drivers/usb/misc/onboard_usb_hub.h
> index 34beab8bce3d..1ca188713b1f 100644
> --- a/drivers/usb/misc/onboard_usb_hub.h
> +++ b/drivers/usb/misc/onboard_usb_hub.h
> @@ -22,6 +22,10 @@ static const struct onboard_hub_pdata ti_tusb8041_data = {
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
> @@ -30,6 +34,7 @@ static const struct of_device_id onboard_hub_match[] = {
>  	{ .compatible = "usbbda,5411", .data = &realtek_rts5411_data, },
>  	{ .compatible = "usbbda,414", .data = &realtek_rts5411_data, },
>  	{ .compatible = "usbbda,5414", .data = &realtek_rts5411_data, },
> +	{ .compatible = "usb5e3,608", .data = &genesys_gl850g_data, },

These table is ordered by compatible string, the new entry should be
inserted after "usb451,8142".

Thanks

m.
