Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA6529A0
	for <linux-sunxi@lists.linux.dev>; Thu, 16 Jun 2022 15:59:37 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id f7so1221525ilr.5
        for <linux-sunxi@lists.linux.dev>; Thu, 16 Jun 2022 08:59:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=9X8XVpxanme0vyK5ZysC7xWSiXXF1IS6YVmw346xm58=;
        b=aihQKZjNPro4xLvc2BMswAgssixpI0T2nn+60O4R1M92EJGVhTQARvrP/ZgcmZbI7s
         PMpkXN3lEVLr4WO68qIL+1TULowl+EDK9T3MAhcsq0mzKoRaoFsLZ3X05z0skvVg9qL9
         EF6X39ChWbXmxtGysga2PBHs+X/JtRRJQ5k5FPUOn+s0WwMA+C8w2l05q4r0iLV6p9rR
         xBZV8dFWlVEYvGq/WyGr8sd3/mxhmZBVFJuectMXf4UK1zECKE4fxigKaclfJ7XX4Z2p
         6SDvRkDPoIFjqy534vrkr1uXfWfipWEj1BcPxgwl720U/uIMZPpYHnuR2jEpsg0MMn3b
         6uUw==
X-Gm-Message-State: AJIora8kqufS/3weMMl0iLuss34eRJf+RhvI1etAVnXKt1oZpPoaioL5
	sWDBA3FORAOro1enhsNOpQ==
X-Google-Smtp-Source: AGRyM1tsF2fjNAC99BuE4yG5HgXIsLOoQnQ86Je1QQ5KdittiSk3qv10mDZg/0Ysw1DP6C4MAwPFUQ==
X-Received: by 2002:a05:6e02:1521:b0:2d1:5e40:b94b with SMTP id i1-20020a056e02152100b002d15e40b94bmr3152904ilu.182.1655395176743;
        Thu, 16 Jun 2022 08:59:36 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id c9-20020a6bb309000000b00669ae49f762sm1311642iof.19.2022.06.16.08.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 08:59:36 -0700 (PDT)
Received: (nullmailer pid 3554362 invoked by uid 1000);
	Thu, 16 Jun 2022 15:59:34 -0000
Date: Thu, 16 Jun 2022 09:59:34 -0600
From: Rob Herring <robh@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bin Liu <b-liu@ti.com>, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/7] dt-bindings: phy: add binding document for Allwinner
 F1C100s USB PHY
Message-ID: <20220616155934.GA3543984-robh@kernel.org>
References: <20220608070452.338006-1-uwu@icenowy.me>
 <20220608070452.338006-3-uwu@icenowy.me>
 <20220608144939.GA1366879-robh@kernel.org>
 <3628fbc2eb9a8c21dc0742b929ee14da76f9adf5.camel@icenowy.me>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3628fbc2eb9a8c21dc0742b929ee14da76f9adf5.camel@icenowy.me>

On Wed, Jun 08, 2022 at 10:52:52PM +0800, Icenowy Zheng wrote:
> 在 2022-06-08星期三的 08:49 -0600，Rob Herring写道：
> > On Wed, Jun 08, 2022 at 03:04:47PM +0800, Icenowy Zheng wrote:
> > > Allwinner F1C100s has the most simple USB PHY among all Allwinner
> > > SoCs,
> > > because it has only one OTG USB controller, no host-only OHCI/EHCI
> > > controllers.
> > > 
> > > Add a binding document for it.
> > > 
> > > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > > ---
> > >  .../phy/allwinner,suniv-f1c100s-usb-phy.yaml  | 83
> > > +++++++++++++++++++
> > >  1 file changed, 83 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/phy/allwinner,suniv-f1c100s-usb-
> > > phy.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/phy/allwinner,suniv-
> > > f1c100s-usb-phy.yaml
> > > b/Documentation/devicetree/bindings/phy/allwinner,suniv-f1c100s-
> > > usb-phy.yaml
> > > new file mode 100644
> > > index 000000000000..180fa8840bf7
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/phy/allwinner,suniv-
> > > f1c100s-usb-phy.yaml
> > > @@ -0,0 +1,83 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> > 
> > Dual license please.
> 
> I am based on another Allwinner USB PHY binding file in the same
> directory, and that file is single licensed. I created a new file
> because each variant of the PHY has a single file now.

Okay, describing the source and the differences in the commit message 
would be helpful.

> 
> > 
> > > +%YAML 1.2
> > > +---
> > > +$id:
> > > http://devicetree.org/schemas/phy/allwinner,suniv-f1c100s-usb-phy.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Allwinner F1C100s USB PHY Device Tree Bindings
> > > +
> > > +maintainers:
> > > +  - Chen-Yu Tsai <wens@csie.org>
> > > +  - Maxime Ripard <mripard@kernel.org>
> > > +
> > > +properties:
> > > +  "#phy-cells":
> > > +    const: 1
> > > +
> > > +  compatible:
> > > +    const: allwinner,suniv-f1c100s-usb-phy
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +    description: PHY Control registers
> > > +
> > > +  reg-names:
> > > +    const: phy_ctrl
> > > +
> > > +  clocks:
> > > +    maxItems: 1
> > > +    description: USB OTG PHY bus clock
> > > +
> > > +  clock-names:
> > > +    const: usb0_phy
> > 
> > *-names is not needed with only one entry. Plus, just using the
> > module 
> > name is not a great choice.
> 
> However the driver expects it...
> 
> Should I patch the driver to use no name on F1C100s?
> 
> > 
> > > +
> > > +  resets:
> > > +    maxItems: 1
> > > +    description: USB OTG reset
> > > +
> > > +  reset-names:
> > > +    const: usb0_reset
> > 
> > Same here.
> > 
> > > +  usb0_id_det-gpios:
> > > +    maxItems: 1
> > > +    description: GPIO to the USB OTG ID pin
> > > +
> > > +  usb0_vbus_det-gpios:
> > > +    maxItems: 1
> > > +    description: GPIO to the USB OTG VBUS detect pin
> > > +
> > > +  usb0_vbus_power-supply:
> > > +    description: Power supply to detect the USB OTG VBUS
> > > +
> > > +  usb0_vbus-supply:
> > > +    description: Regulator controlling USB OTG VBUS
> > 
> > Why the 'usb0_' prefix?
> > 
> > Are these GPIOs and Vbus supply connected to the phy? If not, these
> > all 
> > belong in a connector node (as that is where they are connected to in
> > h/w).
> 
> Well these are historical things of phy-sun4i-usb driver too.

Okay, there should perhaps be a common schema so this sharing is clear. 
Though longer term there should be a move to the common way of handling 
these for new platforms.

So I guess in summary:

Reviewed-by: Rob Herring <robh@kernel.org>
