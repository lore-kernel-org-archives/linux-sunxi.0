Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD85C2C81
	for <linux-sunxi@lists.linux.dev>; Fri, 12 Nov 2021 04:19:42 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id x19-20020a9d7053000000b0055c8b39420bso12121306otj.1
        for <linux-sunxi@lists.linux.dev>; Thu, 11 Nov 2021 20:19:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qxOn87ULPwV2ERYJX91GmCv249cvAtIa56rKI6JKMzk=;
        b=NKAqdZLfVm5QkPJ6DJ1eWVR8u5H1arADki8SGweemdXApnNeHAvo1Wu0j83AHVcbrX
         eW5oX3cVbVKTjxxpjyX3gzxDkqwW/eScYNSFWD68q191n/NfBm6MP6L1pLScZCMbz6KT
         O3yay8ouLzLlns030PvYoZ0d7lcFtq5p8IOjWM+nc755CgyjGgFZtU0PiCra+9HQVgcs
         uVQ3ElhjnX84PokBg4wuL+ZOIEuum/M/Q7be24a6YPdmup35afW5usz8U65FdzHFr6sP
         9MWbzByWxdlcF+eXDIaKvLaY5Kt4ETuWIXFiSz8ONPKs4ZS2DxBcYwZQ93V6uKdeEMig
         atjA==
X-Gm-Message-State: AOAM531Fsomq229eikJmlvh2+GijI9Wey7wP1kpG2jscdZjxIRthUqrS
	JR89kSzT0YH6Qku1Z8D/TQ==
X-Google-Smtp-Source: ABdhPJwcK2aLTenLOImwG5si5qgq36w7YMDwGzNedczDclnQAxDotdfG+bzfTYlQD4IWl7Ex88oHCw==
X-Received: by 2002:a05:6830:22d8:: with SMTP id q24mr9908105otc.170.1636690782006;
        Thu, 11 Nov 2021 20:19:42 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id 62sm922824ooa.47.2021.11.11.20.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 20:19:41 -0800 (PST)
Received: (nullmailer pid 756536 invoked by uid 1000);
	Fri, 12 Nov 2021 04:19:39 -0000
Date: Thu, 11 Nov 2021 22:19:39 -0600
From: Rob Herring <robh@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: linux-sunxi@lists.linux.dev, Wim Van Sebroeck <wim@linux-watchdog.org>, Chen-Yu Tsai <wens@csie.org>, ~okias/devicetree@lists.sr.ht, linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, linux-watchdog@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: watchdog: sunxi: fix error in schema
Message-ID: <YY3rWykk1lIjPVe8@robh.at.kernel.org>
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

On Fri, 29 Oct 2021 16:24:42 +0200, David Heidelberg wrote:
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
> ---
>  .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml   | 2 --
>  1 file changed, 2 deletions(-)
> 

Applied, thanks!
