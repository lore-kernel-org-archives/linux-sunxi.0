Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D4F7A
	for <linux-sunxi@lists.linux.dev>; Tue, 17 May 2022 00:47:07 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id e189so20652213oia.8
        for <linux-sunxi@lists.linux.dev>; Mon, 16 May 2022 17:47:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iJgSIj5Vbgqm2lP3FwW0wvqzkGV+5Vch0R+WtavPeG0=;
        b=w1gIUc+drpv99/cozd3KKXOqVPszngYlcwnHbU3u8QMTSQiH63xkJyfJAx5eUOWVKO
         msOOwBUdT0KpGXhP70YznpWjlvZyxnwWlS0Iq9t0Csu24csYBkMpigAQumhlxDIIGfLR
         hVxVX0AjsmQjsNl5w78f/9veV2a//yoqtg6wFPC7b0vyHlzN1XMIMbkzlRQGiUzu1yql
         UADxKRvmQ/Bc+nXXYDnhocYcjPnXKl4ufMb4WfFs6M1CPeV/SfPGIVOjldqIjzmaAuGa
         MJV/ZhHDDCGx7m3FLFj1DZZDfbJAYQ4VGMpI3ltDmoWYqkS1buITOb8CVCwZEvexuTm4
         OsYg==
X-Gm-Message-State: AOAM533jgLqNtzT7mQry6y1uzMLc5AXsddPMJsNQMtWu7QOZi6PFe6Qv
	xI93rGEJ7fK837oER7LzBg==
X-Google-Smtp-Source: ABdhPJzxUe7lRWwSsk4LYTIlf0trAXfo6l1O3t5y3u2IE0dc+3FfnlSJCRjFtF4GffGFbK7487ochw==
X-Received: by 2002:a05:6808:1585:b0:326:6477:64b2 with SMTP id t5-20020a056808158500b00326647764b2mr9172703oiw.173.1652748426873;
        Mon, 16 May 2022 17:47:06 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id g9-20020a05683030a900b0060603221248sm4499696ots.24.2022.05.16.17.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 17:47:06 -0700 (PDT)
Received: (nullmailer pid 3682863 invoked by uid 1000);
	Tue, 17 May 2022 00:47:04 -0000
Date: Mon, 16 May 2022 19:47:04 -0500
From: Rob Herring <robh@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Mark Brown <broonie@kernel.org>, LABBE Corentin <clabbe@baylibre.com>, alexandre.torgue@foss.st.com, calvin.johnson@oss.nxp.com, davem@davemloft.net, edumazet@google.com, hkallweit1@gmail.com, jernej.skrabec@gmail.com, joabreu@synopsys.com, krzysztof.kozlowski+dt@linaro.org, kuba@kernel.org, lgirdwood@gmail.com, linux@armlinux.org.uk, pabeni@redhat.com, peppe.cavallaro@st.com, samuel@sholland.org, wens@csie.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 3/6] dt-bindings: net: Add documentation for phy-supply
Message-ID: <20220517004704.GA3654797-robh@kernel.org>
References: <20220509074857.195302-1-clabbe@baylibre.com>
 <20220509074857.195302-4-clabbe@baylibre.com>
 <YnkGV8DyTlCuT92R@lunn.ch>
 <YnkWl+xYCX8r9DE7@Red>
 <Ynk7L07VH/RFVzl6@lunn.ch>
 <Ynk9ccoVh32Deg45@sirena.org.uk>
 <YnlDbbegQ1IbbaHy@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YnlDbbegQ1IbbaHy@lunn.ch>

On Mon, May 09, 2022 at 06:38:05PM +0200, Andrew Lunn wrote:
> > No, that's not a thing - the supplies are individual, named properties
> > and even if there were a list we'd still want them to be named so it's
> > clear what's going on.
> 
> So we have a collection of regulators, varying in numbers between
> different PHYs, with different vendor names and purposes. In general,
> they all should be turned on. Yet we want them named so it is clear
> what is going on.

In what order do we turn the supplies on? How much time in between each 
one? Does an external clock need to be running before or after (and how 
long after). Oh, and what about resets and the order and timing of them 
relative to everything else?

This always happens in the same order. First, it's just one resource 
like a regulator or reset. Then one more. Then another device with some 
timing constraints. If we wanted a generic solution in DT, it would need 
to be able to describe any power sequencing waveform. But we don't have 
that because we don't want it. 

> Is there a generic solution here so that the phylib core can somehow
> enumerate them and turn them on, without actually knowing what they
> are called because they have vendor specific names in order to be
> clear what they are?

Other devices have specific compatibles so that the device can be 
identified and powered up. Once again, MDIO should not be special here.

> There must be a solution to this, phylib cannot be the first subsystem
> to have this requirement, so if you could point to an example, that
> would be great.

Well, no one seems to want to make non-discoverable devices on 
'discoverable' buses work. Still an issue for PCI and USB. I thought 
MDIO had a solution here to probe any devices in the DT even if not 
discovered.

Rob
