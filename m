Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00052A939
	for <linux-sunxi@lists.linux.dev>; Tue, 14 Mar 2023 20:03:10 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id x3so66787032edb.10
        for <linux-sunxi@lists.linux.dev>; Tue, 14 Mar 2023 13:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678824189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V84C+zNYhTlp2thKSex9zBHkOQB0B2Kt996/f1MwII0=;
        b=pd2f42sABaBIjI1MNHhZXr6SfwcrVdAV3DKrfovymQ9je4mY71Nr9bPNeIWhMNPda4
         Qeeh1t20fBxJqOxLei6KBdiRA0aGPv3pqBMW1kz0qlZ+1ceSdY5h3x7awC7KMsqYtt6Y
         tH64mw5kqiO0OMloPkZ23HBMN7O/lmvSPy8EihuVcwCn2sgQkz+IqJW6s09He6njMcqH
         5c2m7uFn9tICf4U3KZLmdL25Y59FLjOKIR5CJgnirSInsOVfc/rLmOJWQn66ysC+NES5
         B/T7Tvbpiu7GXbDkv78MA97Ae1kQuj6riDeHwLQRk4EcFNl80RKXDYx1i11XyJccSOxU
         2TBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678824189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V84C+zNYhTlp2thKSex9zBHkOQB0B2Kt996/f1MwII0=;
        b=x9HEhS3TR6HsRqVuM3J6SpuZQAdheDduq83INJKL8mh8s+UTOyyAN9g/SbZieOdXUA
         MhCF9IYFaZ2mTA6LExlLrif4nKl1b06snBjfsT4zlbCbFlfw2xeWiNgvgoKPV7X3dOMy
         OFUqtYhLK9O2E2La/44eXjxN6TSeIdJFeZmJSSnIiVTUleQZ37dhSGEXIJJTlabXR5EH
         cY5tXcRn+dDAu5AAdksuMmq1dvTwoHn3UIduGUFF69QzLyOenuyAcmDCZHC4LxBdyh1B
         iTvADPny6qY9USt6G/AWGeuRVKIW9hs69UcLsEcd8ziwFmq1HVljy8C829mqgIseMMJr
         NFRg==
X-Gm-Message-State: AO0yUKWFapMHsxFgIQapS5iPQag9nzLxur3ZCpn6qiaQ3Iq5jcIgqV93
	6pMvHTiNjkUA/02exZAp2U4=
X-Google-Smtp-Source: AK7set/tGK3i4/wh7V/kGHlS+gxB46+6uCjikXR7Cf/3tLigyXQLtTyfHOLyi19AB/HefjV28ihqYA==
X-Received: by 2002:a17:906:edcc:b0:928:a2:904e with SMTP id sb12-20020a170906edcc00b0092800a2904emr3708551ejb.54.1678824188955;
        Tue, 14 Mar 2023 13:03:08 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id jw22-20020a17090776b600b00926a3155fd0sm1548733ejc.98.2023.03.14.13.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 13:03:08 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] phy: Use of_property_present() for testing DT property presence
Date: Tue, 14 Mar 2023 21:03:07 +0100
Message-ID: <8191654.T7Z3S40VBb@jernej-laptop>
In-Reply-To: <20230310144720.1544600-1-robh@kernel.org>
References: <20230310144720.1544600-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 10. marec 2023 ob 15:47:20 CET je Rob Herring napisal(a):
> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties. As
> part of this, convert of_get_property/of_find_property calls to the
> recently added of_property_present() helper when we just want to test
> for presence of a property and nothing more.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/phy/allwinner/phy-sun4i-usb.c  | 2 +-

for sun4i:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  drivers/phy/broadcom/phy-bcm-ns-usb2.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c
> b/drivers/phy/allwinner/phy-sun4i-usb.c index fbcd7014ab43..fc9f6fb447a0
> 100644
> --- a/drivers/phy/allwinner/phy-sun4i-usb.c
> +++ b/drivers/phy/allwinner/phy-sun4i-usb.c
> @@ -758,7 +758,7 @@ static int sun4i_usb_phy_probe(struct platform_device
> *pdev) return PTR_ERR(data->vbus_det_gpio);
>  	}
> 
> -	if (of_find_property(np, "usb0_vbus_power-supply", NULL)) {
> +	if (of_property_present(np, "usb0_vbus_power-supply")) {
>  		data->vbus_power_supply = 
devm_power_supply_get_by_phandle(dev,
>  						     
"usb0_vbus_power-supply");
>  		if (IS_ERR(data->vbus_power_supply)) {
> diff --git a/drivers/phy/broadcom/phy-bcm-ns-usb2.c
> b/drivers/phy/broadcom/phy-bcm-ns-usb2.c index 6a36e187d100..269564bdf687
> 100644
> --- a/drivers/phy/broadcom/phy-bcm-ns-usb2.c
> +++ b/drivers/phy/broadcom/phy-bcm-ns-usb2.c
> @@ -107,7 +107,7 @@ static int bcm_ns_usb2_probe(struct platform_device
> *pdev) return -ENOMEM;
>  	usb2->dev = dev;
> 
> -	if (of_find_property(dev->of_node, "brcm,syscon-clkset", NULL)) {
> +	if (of_property_present(dev->of_node, "brcm,syscon-clkset")) {
>  		usb2->base = devm_platform_ioremap_resource(pdev, 0);
>  		if (IS_ERR(usb2->base)) {
>  			dev_err(dev, "Failed to map control reg\n");




