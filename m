Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E8247F70
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Feb 2024 18:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707156854; cv=none; b=FUm3u/ZlGEw/33nFIBIBHYt8wYqq0e1yqPZFwcCOa5h03cdGdA9bXDmI3euKjRm+dxCS8U/rWPUWRbCqZzuLB1IZ4MwogAgOmBt0roTzONS2kbyhl8QzcoWr9U/ANnzEeC+z5kW6af5j2KiyPVN0su/6zGvnYcj2ZaDpoOp+64E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707156854; c=relaxed/simple;
	bh=EY4hs20oX0mr1gYQJEJz+1Hmu7pWTI0ZEk8DKNCayfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rM3FKm3PDpLAubEYh9iorznpRChQp0zmvk7Lb5XpegWqax6vDz/pUPfSq2OvfjqQHwleZ9+pVjEyHdRyduXFnFY4OAa4mfItGlkeOoNgBD3xvvar/F4qWwkUuNY+tIqqG7XLPgPdfjlVxO6VzucsxPUgssXPHuhErZaT7RCrN/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hi4GpGlK; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hi4GpGlK"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40fe076f911so730455e9.1
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Feb 2024 10:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707156851; x=1707761651; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qr+Vq/S1r4X6aZjVDF0PrU45ogtRloS0UmBuISXNtMI=;
        b=Hi4GpGlKVaelS+BglIfPEPGpcYVg0XGKsotVI7SKoNy+cfbPGxQnsigwZYtzTGLRaM
         B5xojj+THQjI3WjUnFKIjKJyqWPMwUJ+Q2kMUj+w4n9msZkPdCbYJD96WmeYva9rnuxW
         6nMGK4owWHSOlZbMjP5foZ8nkbOx937xe/K5cbhHGdsI7iEztRRtueW+p4+tlo3YyKTq
         ZawrtzlkdbFAo+tXV9VLs44Dyx5cR0E2NZidI3Gg+JvyhOMGnBpLhMAk451rCmwiVWNJ
         pc//037oZIcOtrWrXstq+poDa9OoJiSOP3YDvJonvRkgf6B3dbl9Tbvv1AwoX0ETtDgf
         p1kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707156851; x=1707761651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qr+Vq/S1r4X6aZjVDF0PrU45ogtRloS0UmBuISXNtMI=;
        b=ExL0ukgkeKS/lU76/eC6oyQNPifC5t0ufw6iTv3ShD+eQGSQJiecx1h9YTIn8JErKB
         hr5VT7l7Xm1gDauK72i54O2nQZBpygYW3IobyafvxAC6LAczDxzaKma4Wz5/jXGlJBb5
         tKIDFAZBbhTB4a07gBgsaUyf7PI8sV8sjz6T8mOrHZdxKtY5KicfD/6PQ1x+3TQ0aVct
         L6Yoech/YWMF0XhuCE0+ku8hDz6LvWS2fpiyqLbxkKGo8dIYjDHSDMzgiDCeQn1IxIa0
         9bMdh0fwiIuDfdRlSMImoCKJhQbO0riCL1QfLbRtag3RyK2GbBduCqzq8NeMnJHmRAB9
         wfug==
X-Gm-Message-State: AOJu0YxTwoMP5XsHezgd0BBNJKaE0+QSS9qOWifoCoKONUrYyiLrB1qr
	Ws7p9XBJCvoej9g7m2zxwqyT59kVPDYdkoPJP8pohJX2LuSCPNfN
X-Google-Smtp-Source: AGHT+IF0wujzR+3gQ56QlL+FI5opt3CJKtvlwe+T2+Vdq05+o2wxVVN/hC3axtbK0Rj9lxWUjg/8kw==
X-Received: by 2002:a05:600c:19c8:b0:40e:f557:738d with SMTP id u8-20020a05600c19c800b0040ef557738dmr383821wmq.26.1707156851150;
        Mon, 05 Feb 2024 10:14:11 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVqIDzbypmAayHCkhdRi5vwvjHNh2aKNp3koseOzKUJx1C6WLjwtBw10a38BZZ+ME81zmG6yoeqO0QH49yXF17+q1Bq5DNFVhKbPGNn+IiGir6kyWCt7r/7J7kFe1Mjg6BO16OkPkrP6J825lsMBh+jENEbf9ivCWqsdAQyHqICoXSgD7/9+0Li1xtkjkJ98iqJNMdNW89e8zsWGohMesN2YeKkXI+fuEoYjr4VGLQd/g==
Received: from jernej-laptop.localnet (82-149-13-182.dynamic.telemach.net. [82.149.13.182])
        by smtp.gmail.com with ESMTPSA id h2-20020a05600c350200b0040fd24653d4sm558504wmq.36.2024.02.05.10.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 10:14:10 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Ricardo B. Marliere" <ricardo@marliere.net>
Subject: Re: [PATCH] bus: sunxi-rsb: make sunxi_rsb_bus const
Date: Mon, 05 Feb 2024 19:14:09 +0100
Message-ID: <10412979.nUPlyArG6x@jernej-laptop>
In-Reply-To: <20240204-bus_cleanup-bus-v1-1-bda309c4b829@marliere.net>
References: <20240204-bus_cleanup-bus-v1-1-bda309c4b829@marliere.net>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne nedelja, 04. februar 2024 ob 16:56:44 CET je Ricardo B. Marliere napisal(a):
> Now that the driver core can properly handle constant struct bus_type,
> move the sunxi_rsb_bus variable to be a constant structure as well,
> placing it into read-only memory which can not be modified at runtime.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/bus/sunxi-rsb.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/sunxi-rsb.c b/drivers/bus/sunxi-rsb.c
> index fd3e9d82340a..1e29ba76615d 100644
> --- a/drivers/bus/sunxi-rsb.c
> +++ b/drivers/bus/sunxi-rsb.c
> @@ -128,7 +128,7 @@ struct sunxi_rsb {
>  };
>  
>  /* bus / slave device related functions */
> -static struct bus_type sunxi_rsb_bus;
> +static const struct bus_type sunxi_rsb_bus;
>  
>  static int sunxi_rsb_device_match(struct device *dev, struct device_driver *drv)
>  {
> @@ -177,7 +177,7 @@ static int sunxi_rsb_device_modalias(const struct device *dev, struct kobj_ueven
>  	return of_device_uevent_modalias(dev, env);
>  }
>  
> -static struct bus_type sunxi_rsb_bus = {
> +static const struct bus_type sunxi_rsb_bus = {
>  	.name		= RSB_CTRL_NAME,
>  	.match		= sunxi_rsb_device_match,
>  	.probe		= sunxi_rsb_device_probe,
> 
> ---
> base-commit: 38ed19495066966979ba821b9e0f549ad5ea620d
> change-id: 20240204-bus_cleanup-bus-de90b25d7ce6
> 
> Best regards,
> 




