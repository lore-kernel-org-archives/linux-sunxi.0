Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D62127719
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Nov 2022 21:46:57 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id 46-20020a9d0631000000b00666823da25fso32637otn.0
        for <linux-sunxi@lists.linux.dev>; Wed, 02 Nov 2022 14:46:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GEKx0Shm1UKG9N4dHMtDn/VoOtRRsP7HnRMJ8KxzNPs=;
        b=UqWuPqInQdiCEAzTuDrg1ltybjxACWYEvl7+o4IfdgHoNzB4Dc+FOb4lMs+aytP8qW
         3QMjIUbKAovSfkFosks98M4frLOvF9G7LIxCc+ToJjA1qweoGb+Yg8Vg79a7ZUk3s13D
         yyPpdXEr839NQZV4p91bG5gk5r1VjSU8PtrqCHUCnwR+2/LGhXCblLzO1lvHUNs8xK6w
         rLNrpoOj3KWl55O72dainFXcRa6ObiK3YpQUIP3CTFCoLLnAhpNQQY2rA3QfhSVzIEZb
         xkqIjLEJ1sO1NgS0DrN9nitsevvFMkx0b5EIfa84BH24HFSr2OyFcpIE0UIC0cnklv0i
         /N5w==
X-Gm-Message-State: ACrzQf1rmnermHzjjSIu130L4zvTVxZzucPY/A5cJyMZfoe391LnKtXf
	wR59XWtDGgVkkahxQbRvrg==
X-Google-Smtp-Source: AMsMyM4ufTiUMCMAGmLmron3x5FQ9kYiwpyqxeU/VVzQh3J8El2uRf5SIGCRwa9kgLnn77z1Y9oBkQ==
X-Received: by 2002:a05:6830:4409:b0:66c:797d:5e07 with SMTP id q9-20020a056830440900b0066c797d5e07mr2098928otv.57.1667425616611;
        Wed, 02 Nov 2022 14:46:56 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id k6-20020a056870148600b0011f00b027bdsm6503172oab.45.2022.11.02.14.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 14:46:56 -0700 (PDT)
Received: (nullmailer pid 524395 invoked by uid 1000);
	Wed, 02 Nov 2022 21:46:57 -0000
Date: Wed, 2 Nov 2022 16:46:57 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Naga Sureshkumar Relli <nagasure@xilinx.com>, Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, Maxime Ripard <mripard@kernel.org>, Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 05/12] dt-bindings: mtd: onenand: Mention the expected
 node name
Message-ID: <20221102214657.GC459441-robh@kernel.org>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
 <20221028235933.934850-6-miquel.raynal@bootlin.com>
 <20221031205442.GA3307775-robh@kernel.org>
 <20221102175007.4a4db2c9@xps-13>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102175007.4a4db2c9@xps-13>

On Wed, Nov 02, 2022 at 05:50:07PM +0100, Miquel Raynal wrote:
> Hi Rob,
> 
> robh@kernel.org wrote on Mon, 31 Oct 2022 15:54:42 -0500:
> 
> > On Sat, Oct 29, 2022 at 01:59:26AM +0200, Miquel Raynal wrote:
> > > The chip node name in this driver is expected to be different and should
> > > be prefixed with onenand instead of the regular "flash" string, so
> > > mention it.
> > > 
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > ---
> > >  Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml b/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml
> > > index a953f7397c40..8a79ad300216 100644
> > > --- a/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml
> > > +++ b/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml
> > > @@ -15,6 +15,9 @@ description:
> > >    as child nodes of the GPMC controller.
> > >  
> > >  properties:
> > > +  $nodename:
> > > +    pattern: "^onenand@[0-9],[0,9]$"  
> > 
> > I don't think it is worth enforcing node names that we 
> > haven't defined in the spec. Wouldn't 'nand-controller' be appropriate?
> 
> Actually I've added this pattern here because there are several users in
> the arm/boot/dts/ directory which use it, and the example below in this
> file also uses onenand@xxx.
> 
> I can either fix the example to use nand-controller or add this pattern
> (I guess "deprecated: true" would not mean anything?). What do you
> prefer?
> 
> If we decide to switch to the nand-controller@ name, shall I change the
> DTS as well?

I guess I'd just leave it as you have it.

Rob
