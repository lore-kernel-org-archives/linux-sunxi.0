Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D519C2C83
	for <linux-sunxi@lists.linux.dev>; Tue,  9 Nov 2021 15:19:29 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id o4so34268732oia.10
        for <linux-sunxi@lists.linux.dev>; Tue, 09 Nov 2021 07:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=v5BQ5l9cKZf8ByTelTtXctDUQ32GQGxJhk2sWcu98+M=;
        b=R9Mhl8UrOxMO+lRTCh2r0MM5vKZ9Kqxm/N9gE46LLwN1DHYZS2DvGP/mFnERF5p2tL
         oM7g4+TaVjZS0GN8rxV9LPZd2X+NUeQNDEXY2ZzKGMRLxfOMnDEf5mgky0a++SQzxYcS
         9m3Qnu7+RhB2mCx+lJRO2GXgcs2zBrsblrrrcsPWizd2cXiGO4sbZvMFmG5tkU6LlVP+
         /rZvdvA6SLBn/l0TVA3kupegWLSSpq/zkOMdJsoCMPBedhT4FnPKAeBFQCvky1zGSxWs
         RKEf5qy60pjYGylPnFYDdRE7vYvbOkBik1TT34e9ygsS2hpoAM+jmYDrB5fgqphK8RWL
         8rKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=v5BQ5l9cKZf8ByTelTtXctDUQ32GQGxJhk2sWcu98+M=;
        b=P0jPUlagZwwwQdBO8EMllPgHdVS2WkS4aL7I7xMiY12RlrAw3BbvTOdhVIA101whqh
         3cuN7/7UmZXVGanYu5xHjgPVV1ZZZGdZLzQGvyZnsjkNruJmExPUPGgIWdiONJPZNscw
         Q2MEQ9t034+oe7we6tB1/0S3JYWBLrtsIKSnDEN7FK2qnL5IfRZQv6g9pspFEgnVkuaN
         OneXhtK7i2l6pEGQpfqz5CYNlE9qmB6Id0YdzF0vqjVxrN78I+Gu3MKce8Ts9mJ3zvW5
         jkbkMN2Eqwaqr8MzG/gS394zWosJgiRjE4DYt8a3Y6cZOVgb3O6yA7630yHQ2/pV4pQm
         Zo4Q==
X-Gm-Message-State: AOAM532w4jPw8WMPYky1UEM2mySbGypPgvndVgYMpw/TNpAd5OS18Nlp
	lGOulRNip/qhQ6Cxrv9KPP8=
X-Google-Smtp-Source: ABdhPJx8AUDYzRWR0GvZWi7FHCTBT3AknltsiAAbbCJVTuQzz3rzEl95Zi4VutFjyBWR90Du11ruag==
X-Received: by 2002:a05:6808:199f:: with SMTP id bj31mr6426970oib.98.1636471168993;
        Tue, 09 Nov 2021 07:19:28 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e21sm2129211ote.72.2021.11.09.07.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 07:19:28 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 9 Nov 2021 07:19:26 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: David Heidelberg <david@ixit.cz>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	~okias/devicetree@lists.sr.ht, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: watchdog: sunxi: fix error in schema
Message-ID: <20211109151926.GA3059256@roeck-us.net>
References: <20211029142443.68779-1-david@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211029142443.68779-1-david@ixit.cz>

On Fri, Oct 29, 2021 at 04:24:42PM +0200, David Heidelberg wrote:
> "maxItems" is not needed with an "items" list
> 
> Fixes:
> $ DT_SCHEMA_FILES=Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml make dtbs_check
> Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml: properties:clocks: {'required': ['maxItems']} is not allowed for {'minItems': 1, 'maxItems': 2, 'items': [{'description': 'High-frequency oscillator input, divided internally'}, {'description': 'Low-frequency oscillator input, only found on some variants'}]}
> 	hint: "maxItems" is not needed with an "items" list
> 	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
> ...
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml   | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> index 44cad9427ae6..43afa24513b9 100644
> --- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> @@ -40,14 +40,12 @@ properties:
>  
>    clocks:
>      minItems: 1
> -    maxItems: 2
>      items:
>        - description: High-frequency oscillator input, divided internally
>        - description: Low-frequency oscillator input, only found on some variants
>  
>    clock-names:
>      minItems: 1
> -    maxItems: 2
>      items:
>        - const: hosc
>        - const: losc
