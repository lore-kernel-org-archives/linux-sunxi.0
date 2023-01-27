Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9613D8C
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Jan 2023 20:22:12 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id n6so3108258edo.9
        for <linux-sunxi@lists.linux.dev>; Fri, 27 Jan 2023 12:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mqf3tpDJNX5sIiyTeIYmTr7VbjdNQeu0rlBoqz1e+Q0=;
        b=KjwD47Qr6iZP/O9PFJhqPa4DXwn1l74X3nfx6kTwt+q9S7DkJW1ctaL1SAg+HarvRo
         E8mVvJB8G0aM4EzQmGTh0uF45yjqn+nDVC0/6eAe57kksR2S6u2qqOIwcSZgWdFW3Ic+
         ppvwB8u8v0YZuLJ/M88zYnWPZDekyWFImeo5gxaj3lMv1qmVWE33IHZYMQ8JX0vjY640
         2FRiGOVg4AjznpAz8uS+VyysPYvPVhD9Uo/KGFEpLBFv3PmdhrOKmeNOTasLzM2Qmb4L
         fqVMz85pS9/47JF/mmoSYodYM0xJpTbVeWczW1yEX5X21Ww0sQpz4eoYcNIdbzTf+3fs
         QRvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mqf3tpDJNX5sIiyTeIYmTr7VbjdNQeu0rlBoqz1e+Q0=;
        b=ZuO2sOY8l6caqa7Uw5DQLT8Q/0hQh1bCGZuEL4bOPt3QVSY/ZqYgS1lu8gDA10IkMS
         C4P+92iOMXw6mlhLT2FCWPUP1J7pPmKno2Dw9QQh8sENwfnIyzVwHJxitapiEl4lLQdl
         +kUjv3zPCRcOFAJem9Z76tLYEBHIQP1whxtatAWPrr/BW66wxeEMqiRfUF+YRX5iawtS
         kCQ24gHRPtCIWZBZygF6mnc1sTh7Gy4s5Iv6t8T0y+PU6FF2jeK8+M6NY3tlvSN8kiaC
         lWU3A6pyQVrvaAiBvhgIw239GOfQy4Wlki/+AmzNdqX5eGlhytjF1cxhWq3Taw5Xml0v
         b37g==
X-Gm-Message-State: AFqh2kozJ21kWMSAAdI1m+QhiDujX/t8aSdoLLXsfp3FVPaSz7OKISRW
	EPcEUi7JkbrK1+q5E935p/A=
X-Google-Smtp-Source: AMrXdXslchCqGmh70f80P2YbvDJBdxIzu+HfPexB7WQFcZPWKwYNQ5BuM/fuJwEdI0F73cI7vK1NlA==
X-Received: by 2002:a05:6402:28c6:b0:49b:98be:c38 with SMTP id ef6-20020a05640228c600b0049b98be0c38mr44822085edb.11.1674850931014;
        Fri, 27 Jan 2023 12:22:11 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id f5-20020a056402068500b0046dd0c2a08esm2861517edy.36.2023.01.27.12.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 12:22:10 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bin Liu <b-liu@ti.com>, Andre Przywara <andre.przywara@arm.com>
Cc: Icenowy Zheng <uwu@icenowy.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org,
 soc@kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v5 03/11] usb: musb: sunxi: Introduce config struct
Date: Fri, 27 Jan 2023 21:22:08 +0100
Message-ID: <12138531.O9o76ZdvQC@jernej-laptop>
In-Reply-To: <20230111015332.172021-4-andre.przywara@arm.com>
References:
 <20230111015332.172021-1-andre.przywara@arm.com>
 <20230111015332.172021-4-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sreda, 11. januar 2023 ob 02:53:24 CET je Andre Przywara napisal(a):
> Currently the probe routine explicitly compares the compatible string of
> the device node to figure out which features and quirks a certain
> Allwinner MUSB model requires. This gets harder to maintain for new
> SoCs.
> 
> Add a struct sunxi_musb_cfg that names the features and quirks
> explicitly, and create instances of this struct for every type of MUSB
> device we support. Then bind this to the compatible strings via the OF
> data feature.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


