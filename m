Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4670272
	for <linux-sunxi@lists.linux.dev>; Thu, 29 Jul 2021 22:39:50 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id f6so3276502ioc.6
        for <linux-sunxi@lists.linux.dev>; Thu, 29 Jul 2021 15:39:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XlptD/tZIHvjx581AafuTapU2M/nw56BX9ZwEjQcLOM=;
        b=L2UAGOibiz7YoosqX1kAq5iAc5Ugc54DQD8+aZJVtq0BmQthrUzaiARTXvrsHSBw5J
         R6H7zfTY9flq2Jhf+CWxplEzB1HPgRXG+YrKwBowSGQcItXstncWeca1kUifjFbPVqiV
         2aPllWtyu1JGx7tF3+tgbDq8Pt78EL1RuHT8Mi3CImAIq7vfRydXtHr9xn7wW3FmQiPb
         knv1YxavsykzIcc4DRouseviyAv5HkacPW2CYEnWkKyd/RmJV9Vuk3EOhzujpEdZElEP
         6KzWzKds0Whn0taa7zZC7lkZ8EnJ/SfrslkCKIRpIpdsECzXfj8klywBc06y0kt62w53
         pRrw==
X-Gm-Message-State: AOAM530Fw3c5V+nAjPsLaCkjiaydKd8WbPV4jCkl8Z5wsdaYgOpy7pHH
	7cTToMzKt9nnnsmx5dh8ng==
X-Google-Smtp-Source: ABdhPJzJOkvgxA1BTZ4PAi4OWpI9cFABggjmNMgJcaQ7V8JKyLgCLbuj+pSyPTNZmoVNLJoo924bRQ==
X-Received: by 2002:a02:90cb:: with SMTP id c11mr6480022jag.53.1627598389390;
        Thu, 29 Jul 2021 15:39:49 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id w14sm3078200ioa.47.2021.07.29.15.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 15:39:48 -0700 (PDT)
Received: (nullmailer pid 1035245 invoked by uid 1000);
	Thu, 29 Jul 2021 22:39:47 -0000
Date: Thu, 29 Jul 2021 16:39:47 -0600
From: Rob Herring <robh@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Samuel Holland <samuel@sholland.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: watchdog: sunxi: Add compatible for D1
Message-ID: <YQMuM2McwNGzqAhe@robh.at.kernel.org>
References: <20210726035143.53132-1-samuel@sholland.org>
 <20210726035143.53132-2-samuel@sholland.org>
 <20210729042449.GA1716994@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210729042449.GA1716994@roeck-us.net>

On Wed, Jul 28, 2021 at 09:24:49PM -0700, Guenter Roeck wrote:
> On Sun, Jul 25, 2021 at 10:51:42PM -0500, Samuel Holland wrote:
> > D1 keeps the same register layout and clock sources as the R329, but it
> > adds a key field which must be set to update the watchdog's "CFG" and
> > "MODE" registers. Therefore it is not backward-compatible.
> > 
> > Signed-off-by: Samuel Holland <samuel@sholland.org>
> > ---
> >  .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml   | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> > index 853ceb1b7c0f..756e6ab99860 100644
> > --- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> > +++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> > @@ -29,6 +29,7 @@ properties:
> >        - items:
> >            - const: allwinner,suniv-f1c100s-wdt
> >            - const: allwinner,sun4i-a10-wdt
> > +      - const: allwinner,sun20i-d1-wdt
> 
> Alignment is off.

No, it's correct. It's not part of the above list, but a new 'oneOf' 
entry.

Rob
