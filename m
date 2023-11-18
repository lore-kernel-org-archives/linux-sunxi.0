Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968D01E502
	for <linux-sunxi@lists.linux.dev>; Sat, 18 Nov 2023 21:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eFH8etG3"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-543456dbd7bso8186664a12.1
        for <linux-sunxi@lists.linux.dev>; Sat, 18 Nov 2023 13:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700344194; x=1700948994; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tu8B/DrosgiV85GSiOsUY9FsBSgQ5Nsx1mRRxIDJDOU=;
        b=eFH8etG3guFqZwrs6xxSEypVY4DEZ6/8WeNsdKJl07mi6UB2/KgdqsZ2HBX6RsXn/P
         PFMktoPwnP3JcUZhIk9ZhPjhaQM4B4wjBut3IRxVbBORuhnYAtkDhFFQnGpGLVmWYaTJ
         jRw20xsQP7NVVE14tY1iXMm7EJJufCbZeiQMqMpJMsayVNjQcAnkaddu1UzIba/8RrQY
         /lJihTeeqwohWQ4qq/hqk4mRCBGl+x7vXaOvLVKcPt56pajiOoM6eQ5/4eZxWJ+wR47q
         jGXhsZLqcE40ubY0GLFQvgfjgzSSKcv6n3sutRcdr4e3JVWnj3K+BM+WYYKhiOBtzNtO
         QroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700344194; x=1700948994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tu8B/DrosgiV85GSiOsUY9FsBSgQ5Nsx1mRRxIDJDOU=;
        b=b1LNN5ZUQtF23WUY4krdtSclQwszNnBEwOLQn4zUvp1sKt84r0HiMeQxOs095+o+UY
         uzTdpE5cqH+cS2tOmzbCnf+ncqCB51zfnPGlaetZXCfBwMs7pgHgCAfcG53hVDBP3PlS
         Ktv/z/Xd/xfUzPHFOn/k7iope9XNhkdf0b9U7gAWi5xa+o4tGNgsPz5wUfEt6g9eNHUy
         t3NWnB5e3dMloJZY4+6WUBO20l8/MNo2H54O5vG2R2EUxy67n0XSlBOxlI1feJOHQMYm
         UZnick6SUC1+qU2s4T36IiTxrQdh1Vigux6Y9awA+lqPpREm1FFP0QZfbOCXqP538xNo
         iITA==
X-Gm-Message-State: AOJu0Yz1BRPAlRJDjCU5BbfjyMcBe0Kneh2f/HmLBoRKzz1XEcSJvHxL
	92MRi6p+Zbie5vx+vX2bqQ4=
X-Google-Smtp-Source: AGHT+IGvGe/YhVqfTTgGOZH6rxAZKgoCFGPA+F4kHVoXMK1rmU/eIymVSurR+kzjcJHGaQ8dnTci8A==
X-Received: by 2002:a17:906:38da:b0:9ae:50ec:bd81 with SMTP id r26-20020a17090638da00b009ae50ecbd81mr6889839ejd.21.1700344193504;
        Sat, 18 Nov 2023 13:49:53 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id cm7-20020a170906f58700b009e5e1710ae7sm1028955ejd.191.2023.11.18.13.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 13:49:52 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Wolfram Sang <wsa@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-i2c@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Samuel Holland <samuel@sholland.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 04/20] drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c: remove
 I2C_CLASS_DDC support
Date: Sat, 18 Nov 2023 22:49:51 +0100
Message-ID: <2705713.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20231118174221.851-5-hkallweit1@gmail.com>
References:
 <20231118174221.851-1-hkallweit1@gmail.com>
 <20231118174221.851-5-hkallweit1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 18. november 2023 ob 18:42:04 CET je Heiner Kallweit napisal(a):
> After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
> olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
> Class-based device auto-detection is a legacy mechanism and shouldn't
> be used in new code. So we can remove this class completely now.
> 
> Preferably this series should be applied via the i2c tree.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> 
> ---
>  drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c |    1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c
> index d1a65a921..f5f62eb0e 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c
> @@ -302,7 +302,6 @@ int sun4i_hdmi_i2c_create(struct device *dev, struct sun4i_hdmi *hdmi)
>  		return -ENOMEM;
>  
>  	adap->owner = THIS_MODULE;
> -	adap->class = I2C_CLASS_DDC;
>  	adap->algo = &sun4i_hdmi_i2c_algorithm;
>  	strscpy(adap->name, "sun4i_hdmi_i2c adapter", sizeof(adap->name));
>  	i2c_set_adapdata(adap, hdmi);
> 
> 




