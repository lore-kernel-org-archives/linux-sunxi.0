Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D89320F
	for <linux-sunxi@lists.linux.dev>; Thu, 19 May 2022 20:18:02 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id y66so1734152oia.1
        for <linux-sunxi@lists.linux.dev>; Thu, 19 May 2022 13:18:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cpK/mxaaT61izHttPyCO54/paPZjEWsIdeOzJUvSPcc=;
        b=LJWMIH2pjKEJL2e6+L3aJJdpC7Dqy64nHL8gL4WMXBzd0R/CWzrv3/s39xP9jn1RY2
         aQWq0Aul29OmPpMaz6K96fd/Vhb0lRx3LDly4Lq6KDU2DSxHIk93A3OgQL6c9in8Rpbj
         bkim/XGUMlEpg1GZWi7OYWqHfnixUxcWT6TnRTmAal4TI123RGoYCLIaN7Sn1ORug61X
         jrKK4Ss1bYOxSWn8opTXNGZ4riFIUbMmezuCEJdBxUo0adM594S3VYRkYzE+cIxnpaRs
         xM2RsQMRlWLD8fBlsgctKDnVfZlOKiVcfFU6JXuJrS2qSQ3HP6vUg5REHHq+SytVY8JC
         gsHQ==
X-Gm-Message-State: AOAM530Cso8dnZZsAyLpPTp6V4WWIkQNFpbtjWoeoldmKbyj8Azh7p4o
	93z2Y4eH9Gp0vprKBcGIkg==
X-Google-Smtp-Source: ABdhPJy2uy9qx4ESthKjZkWWf/xwQRdL3or4oVwIkBE3FEdvEGXq0yBS6KMNDhB9omyT6IZBbAg1Tw==
X-Received: by 2002:a05:6808:1b13:b0:326:8545:bc60 with SMTP id bx19-20020a0568081b1300b003268545bc60mr3747171oib.286.1652991481217;
        Thu, 19 May 2022 13:18:01 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id l63-20020aca3e42000000b00326e6ac9f79sm106147oia.46.2022.05.19.13.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 13:18:00 -0700 (PDT)
Received: (nullmailer pid 2122452 invoked by uid 1000);
	Thu, 19 May 2022 20:17:59 -0000
Date: Thu, 19 May 2022 15:17:59 -0500
From: Rob Herring <robh@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Mark Brown <broonie@kernel.org>, Corentin Labbe <clabbe@baylibre.com>, calvin.johnson@oss.nxp.com, davem@davemloft.net, edumazet@google.com, hkallweit1@gmail.com, jernej.skrabec@gmail.com, krzysztof.kozlowski+dt@linaro.org, kuba@kernel.org, lgirdwood@gmail.com, linux@armlinux.org.uk, pabeni@redhat.com, samuel@sholland.org, wens@csie.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, netdev@vger.kernel.org
Subject: Re: [PATCH v2 4/5] dt-bindings: net: Add documentation for optional
 regulators
Message-ID: <20220519201759.GC2071376-robh@kernel.org>
References: <20220518200939.689308-1-clabbe@baylibre.com>
 <20220518200939.689308-5-clabbe@baylibre.com>
 <95f3f0a4-17e6-ec5f-6f2f-23a5a4993a44@linaro.org>
 <YoYqmAB3P7fNOSVG@sirena.org.uk>
 <c74b0524-60c6-c3af-e35f-13521ba2b02e@linaro.org>
 <YoYw2lKbgCiDXP0A@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YoYw2lKbgCiDXP0A@lunn.ch>

On Thu, May 19, 2022 at 01:58:18PM +0200, Andrew Lunn wrote:
> On Thu, May 19, 2022 at 01:33:21PM +0200, Krzysztof Kozlowski wrote:
> > On 19/05/2022 13:31, Mark Brown wrote:
> > > On Thu, May 19, 2022 at 11:55:28AM +0200, Krzysztof Kozlowski wrote:
> > >> On 18/05/2022 22:09, Corentin Labbe wrote:
> > > 
> > >>> +  regulators:
> > >>> +    description:
> > >>> +       List of phandle to regulators needed for the PHY
> > > 
> > >> I don't understand that... is your PHY defining the regulators or using
> > >> supplies? If it needs a regulator (as a supply), you need to document
> > >> supplies, using existing bindings.
> > > 
> > > They're trying to have a generic driver which works with any random PHY
> > > so the binding has no idea what supplies it might need.
> > 
> > OK, that makes sense, but then question is why not using existing
> > naming, so "supplies" and "supply-names"?
> 
> I'm not saying it is not possible, but in general, the names are not
> interesting. All that is needed is that they are all on, or
> potentially all off to save power on shutdown. We don't care how many
> there are, or what order they are enabled.
> 
> Ethernet PHY can have multiple supplies. For example there can be two
> digital voltages and one analogue. Most designs just hard wire them
> always on. It would not be unreasonable to have one GPIO which
> controls all three. Or there could be one GPIO for the two digital
> supplies, and one for the analogue. Or potentially, three GPIOs.

Again, it's not just supplies...

> 
> Given all the different ways the board could be designed, i doubt any
> driver is going to want to control its supplies in an way other than
> all on, or all off. 802.3 clause 22 defines a standardized way to put
> a PHY into a low power mode. Using that one bit is much simpler than
> trying to figure out how a board is wired.
> 
> However, the API/binding should be generic, usable for other use
> cases. 

The binding should not be generic as I explained here and many times 
before...

> Nobody has needed an API like this before, but it is not to say
> it might have other uses in the future. So maybe "supplies" and
> "supply-names" is useful, but we still need a way to enumerate them as
> a list without caring how many there are, or what their names are.

There's 2 standard patterns for how producer/consumer bindings work 
There's how gpio and regulators are done and then there's the
foo/foo-names style. Regulators when with the former and we're not going 
to do both.

You can still do what you want by retrieving all properties ending with 
'-supply'. Not as easy to implement, but works for existing users.

Rob
