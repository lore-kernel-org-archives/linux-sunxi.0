Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EE1A939
	for <linux-sunxi@lists.linux.dev>; Tue, 14 Mar 2023 19:58:28 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id y4so37344937edo.2
        for <linux-sunxi@lists.linux.dev>; Tue, 14 Mar 2023 12:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678823907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xqwHb3pl10s7quxiCLdge3d3HiQ2kieNQ2q19oo8kDs=;
        b=kCsABlT+HkwgRsyKMRlCb41qMBQ1GsJeb1u/zUZGfUsAzgBXSebzj7zTIdHOMUZ4hm
         Jddh/W1F1qfjhpUOo0OHPBm+37Xkubd46bVkGO+nzkvBHmgWXgYJxLvi2CIGm3NkwLtt
         kTUFSwRuOG4YU3Y11mcrYUcfx9+a1mAo3RXJ4kCw3cmIAjNz7A4g6IB638HJRaArVmGZ
         FkELAXbvLbkwoqaBGrGROnDFSrfeEb/heIyC0YFgIstC2AE3Yw9l6BDMbblzJgcit2De
         eaOyNCNGLDVUabserU/ISATGn9ccpbBAh0xp94IoBx925GjvIaAd//hykfRIi5NliUk6
         SMTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678823907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xqwHb3pl10s7quxiCLdge3d3HiQ2kieNQ2q19oo8kDs=;
        b=cN1SGXqFFGpn8cXZfeAQaZfJ3Uhf18J44kkRSRFa/hoaEbZkZC49yvpzyX5/up6NT6
         17G1j1EhIamHpxU3QXShtjoblpxlCn6RnseW6eEAXrXYwRABvmHoQNLCYlHQRDUWiRZo
         7/oAIHYFoIvmHELcdyyxpsASrKY1wupiGKcKMoCOLMzqYD24C/2uQzaV7AFFVO6r+6Si
         I6znkw8IShyTz9tqEk1Ib0Br+KmKOaGamNaokDCtHMnzjv/FNMN/Hj4icgXbOsKopDhr
         /WfqCGwKTYjhe2o53ShtZq5PD5q5K3VxGZodzYIpHtBxThIJcJDZ+dF5b9qN8Gqx/PzC
         Einw==
X-Gm-Message-State: AO0yUKUAjrabBIe9NNUF6wdDI6qJAxlN5EPrRZ0qYxeZcNVsv1E4Wc/l
	0NX2aR6H1fKEIjA1XoPSdDU=
X-Google-Smtp-Source: AK7set+c9gXFRmjVi6fFDbFdISN4aKZTF0Ediiw5KyDrz4H9I2ZmJcurfv6q47uliZL8XXT7wR5jVQ==
X-Received: by 2002:a17:906:6b0c:b0:8aa:be5c:b7c5 with SMTP id q12-20020a1709066b0c00b008aabe5cb7c5mr3670395ejr.41.1678823906634;
        Tue, 14 Mar 2023 12:58:26 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id de11-20020a1709069bcb00b008d1dc5f5692sm1514491ejc.76.2023.03.14.12.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 12:58:26 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] rtc: sun6i: Use of_property_present() for testing DT property
 presence
Date: Tue, 14 Mar 2023 20:58:25 +0100
Message-ID: <1845104.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <20230310144736.1547041-1-robh@kernel.org>
References: <20230310144736.1547041-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 10. marec 2023 ob 15:47:36 CET je Rob Herring napisal(a):
> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties. As
> part of this, convert of_get_property/of_find_property calls to the
> recently added of_property_present() helper when we just want to test
> for presence of a property and nothing more.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/rtc/rtc-sun6i.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
> index 7038f47d77ff..dc76537f1b62 100644
> --- a/drivers/rtc/rtc-sun6i.c
> +++ b/drivers/rtc/rtc-sun6i.c
> @@ -260,7 +260,7 @@ static void __init sun6i_rtc_clk_init(struct device_node
> *node, }
> 
>  	/* Switch to the external, more precise, oscillator, if present */
> -	if (of_get_property(node, "clocks", NULL)) {
> +	if (of_property_present(node, "clocks")) {
>  		reg |= SUN6I_LOSC_CTRL_EXT_OSC;
>  		if (rtc->data->has_losc_en)
>  			reg |= SUN6I_LOSC_CTRL_EXT_LOSC_EN;




