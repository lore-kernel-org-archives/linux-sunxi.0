Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DCA2C80
	for <linux-sunxi@lists.linux.dev>; Mon,  1 Nov 2021 18:52:37 +0000 (UTC)
Received: by mail-oo1-f52.google.com with SMTP id a17-20020a4a6851000000b002b59bfbf669so6569393oof.9
        for <linux-sunxi@lists.linux.dev>; Mon, 01 Nov 2021 11:52:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ez0ExjaNOgPztd9ik8mcUgxIwkY6xjgLzAofxYvSIf0=;
        b=7SJkx9X72xVo6qgzo12wg15uXRep/ydio5p+jitXYi57s5KKPZTPJDU7yQz7UqBfeQ
         jtl2fMJlF1BO2iGP8aciH0QrUfvtm2ArhD1BzBgUhIYy2+PbvRx6WBd/MjbwGhAj4i63
         dJ88WvLUQR2pcP1jbUSoTToYy8GDe8lkVBluvyv0FAovs+iqFnU9CuZ+DmfJw7IwpYdk
         KG0qjnf+4rr3GzSUuawfNboOybTBkU+TQ8jhtKNl0qDhOIGD8y+0P4a8Tyf6YbpkqmKw
         srsjAXDOGFE/HolTcyENeL6Rc5hEn9/omk72GmqtpdXFauIPMrpghgNive0QmmIWl8N/
         BRcw==
X-Gm-Message-State: AOAM533ZzuMJ7qljifzyQmAmk5hrLJpw5QHDCRCm8dhG3p3ctEWyQgJ/
	28NS9nntY5zMPXLA/Jemkw==
X-Google-Smtp-Source: ABdhPJxtoXJxZs7lFaY7FEDIKbY6oPUmYGlccuoUr1jfHm2e1MPRxljcAxM8pevk4tFiQE5bW3btvA==
X-Received: by 2002:a4a:e681:: with SMTP id u1mr10019234oot.75.1635792756553;
        Mon, 01 Nov 2021 11:52:36 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id s23sm4364436oie.20.2021.11.01.11.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 11:52:35 -0700 (PDT)
Received: (nullmailer pid 819012 invoked by uid 1000);
	Mon, 01 Nov 2021 18:52:34 -0000
Date: Mon, 1 Nov 2021 13:52:34 -0500
From: Rob Herring <robh@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Guenter Roeck <linux@roeck-us.net>, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org, ~okias/devicetree@lists.sr.ht
Subject: Re: [PATCH] dt-bindings: watchdog: sunxi: fix error in schema
Message-ID: <YYA3cqxn7k6p8Iti@robh.at.kernel.org>
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

Acked-by: Rob Herring <robh@kernel.org>
