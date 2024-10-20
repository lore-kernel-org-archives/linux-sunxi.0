Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8113FE4
	for <linux-sunxi@lists.linux.dev>; Sun, 20 Oct 2024 04:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729396951; cv=none; b=dNSbyzUK+f0LoNz+MwqvUWwztCFgwYHnOqkH8LjkNHmZSaG5s+vyz1iOVLiNnrGCMqRJQ69iW3+/Uo5lzRRSXfuF0YrqfZs8F7XtgjpM9rs+3HzFxJiz2oGg6aJ1pdZOIy/HxfP5BPLGy6eTjk18iXLtEFwcMBGPwKFzH4i5oHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729396951; c=relaxed/simple;
	bh=87GUOWtGFJL4r8wkrlY7qHZioHY2givk4h9dhgi19xE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VQXaSvQM/rPG17ClxPMCA/eY9R0P/cqU2nSf3UFz55BWOlBBhEOjyBSQ4Fp90KbHt0DaELPomTJrSun47oi7bovonRFsH2gpqek4trzPYUF9bf7QFfqHWaogsPqa8h2vPKVapYIfVq+SHoSUNGO3Uppg+74FTlpijqcrxunERG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RfBjD+nl; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RfBjD+nl"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20cdb889222so34042675ad.3
        for <linux-sunxi@lists.linux.dev>; Sat, 19 Oct 2024 21:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729396948; x=1730001748; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j8Igh/6IvzPQAQpSsK6rU33pFUeTm6llxlXdk0W6E3c=;
        b=RfBjD+nlwlJu60sJm5sPTLQ+1A7y7p/37OTyd5AUd0bjRMNIAx7j+fO7Lh/XImXIIL
         dGe0X6TKjRYKaNEzWUpmm76bpAoamZJYkRFu5+4T+dtUYpVGdtj8kgQoGU6vCxZjdrFR
         ag31wrpUDQ0T4VV88xZ6DfBkJ0vuvzDqxbMLlzX0FVvvTKi5FNswB7c+g+ejbDJyc8C+
         yHJWphgn9e2of2mBWfJPrQ9o4aofc+eqYFXak9q4h6tuRVRpBi0zRZi0ypAnrkZWZQQr
         V0CuZemt7ATrdsm5gNKysi0wcKL0+tZ4dE9Dp0JvLrxUhY0xA4rwIF4hU5gRMC5aLPBe
         /mHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729396948; x=1730001748;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j8Igh/6IvzPQAQpSsK6rU33pFUeTm6llxlXdk0W6E3c=;
        b=ciPV6pFvrLxi1dThCONoj8RT8AVadSje5EB9sETrhgEhNjDlsgVTgTUH01Q+ZQOakY
         kQ1zXBotbX5sRE8P/pBHf7xPjZlIE3Mj3N7e59g6rmneDg51aZkZdzzQyPx9KYeFTs+A
         Xot01EE7lidzVpe8xoGJ9H3bjoaVbQALhVvzoLlvY75HQ7e4rWvhPAEOb8YsVRjvxxUc
         5PxVdp6QazD4vArhjuojUfEeuCI1652MG/8016Tp2HCdkiB3+0UmB4fbx8HCLZaUwuyc
         RC1jezHo0mMAoAGNuNGNbAcxWWfJfjt2m7Pf7oo72K50p5TOfJx0NotFPyWIcLHFPJ8b
         e31g==
X-Forwarded-Encrypted: i=1; AJvYcCVytnZY3I93DAGn4O3or4e6Rx5NQ+pafg9QIpCEyHkXry3uW7GA4XdCIK0Cx87Y81nX3VZx0UzjltgAsw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxd8r0M2Et2EUpfr1FMZtwqU0Sd958TGDlMxOGdg6ABv0nD+h+e
	i6T74pGBlxUHKn+1Ws3ocHC/65/QENdAeERan/S4s6RCV9IGSJNx
X-Google-Smtp-Source: AGHT+IGmRe4gQ21zX8zFRCJZgS26LdpMMQu5DBpW8q3ltXUlMNmmTnmFWbMA1K68qw41N+h09JW/dg==
X-Received: by 2002:a17:902:f68f:b0:20c:ce1f:13bd with SMTP id d9443c01a7336-20e5a75a5b9mr92035705ad.18.1729396948526;
        Sat, 19 Oct 2024 21:02:28 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:2ce:a853:5ea4:fdb6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eaeab581b1sm519692a12.45.2024.10.19.21.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 21:02:28 -0700 (PDT)
Date: Sat, 19 Oct 2024 21:02:25 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH 03/10] Input: sun4i-lradc-keys - switch to
 for_each_child_of_node_scoped
Message-ID: <ZxSA0YF3f7Q86pRV@google.com>
References: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
 <20241010-input_automate_of_node_put-v1-3-ebc62138fbf8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010-input_automate_of_node_put-v1-3-ebc62138fbf8@gmail.com>

On Thu, Oct 10, 2024 at 11:25:53PM +0200, Javier Carrasco wrote:
> Use the scoped variant of the macro to simplify the code and error
> handling. This makes the error handling more robust by ensuring that
> the child node is always freed.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>  drivers/input/keyboard/sun4i-lradc-keys.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/input/keyboard/sun4i-lradc-keys.c b/drivers/input/keyboard/sun4i-lradc-keys.c
> index f304cab0ebdb..f1e269605f05 100644
> --- a/drivers/input/keyboard/sun4i-lradc-keys.c
> +++ b/drivers/input/keyboard/sun4i-lradc-keys.c
> @@ -202,7 +202,7 @@ static void sun4i_lradc_close(struct input_dev *dev)
>  static int sun4i_lradc_load_dt_keymap(struct device *dev,
>  				      struct sun4i_lradc_data *lradc)
>  {
> -	struct device_node *np, *pp;
> +	struct device_node *np;
>  	int i;
>  	int error;
>  
> @@ -223,28 +223,25 @@ static int sun4i_lradc_load_dt_keymap(struct device *dev,
>  		return -ENOMEM;
>  
>  	i = 0;
> -	for_each_child_of_node(np, pp) {
> +	for_each_child_of_node_scoped(np, pp) {
>  		struct sun4i_lradc_keymap *map = &lradc->chan0_map[i];
>  		u32 channel;
>  
>  		error = of_property_read_u32(pp, "channel", &channel);
>  		if (error || channel != 0) {
>  			dev_err(dev, "%pOFn: Inval channel prop\n", pp);
> -			of_node_put(pp);
>  			return -EINVAL;
>  		}
>  
>  		error = of_property_read_u32(pp, "voltage", &map->voltage);
>  		if (error) {
>  			dev_err(dev, "%pOFn: Inval voltage prop\n", pp);
> -			of_node_put(pp);
>  			return -EINVAL;

I wonder if it would not be better to return the real error rather than
clobber it with -EINVAL, but I guess this should be a separate patch.

Applied, thank you.

-- 
Dmitry
