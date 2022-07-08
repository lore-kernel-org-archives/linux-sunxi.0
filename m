Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411ED2563
	for <linux-sunxi@lists.linux.dev>; Fri,  8 Jul 2022 14:14:36 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id j22so11681883ejs.2
        for <linux-sunxi@lists.linux.dev>; Fri, 08 Jul 2022 07:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z0XOec91623/KuMv+Ej/7gZUuHsCJ62v6usunFr5b6A=;
        b=f6IhZTBULbQ7llaZot4o9crrDH/bVkSBG4cnMtEpeURfPACgFjn6vJq/r5K9ktnt1p
         LERVggmRob4jL/GCkTX2w7v74r1KkY3FTdHWj4yihWbrOZUOANV5aUCghGUOwU0dnxko
         /PZTw+0EqCC4O3OgTunDclurFhOm+fOeM7DwyLzfawWZNxV75iEId53Bz12llAwF3zZA
         CxlP1Y+szHux5dgocUVRRMZVsnAep+OILxAx64nCQmbv+MyobgioKifPwL4r/ZjZE8Ln
         pQduBNe9DY1hriNkcdpRfW0SVuCcc5CUW3dFFnTn/mtPcA5nKFiMo8hNefUcad7CmpbW
         7uVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z0XOec91623/KuMv+Ej/7gZUuHsCJ62v6usunFr5b6A=;
        b=jQoarcajgQz/zNKFCwUyE5/0qH0MkjJgq4lVuLKriMLJdzwBaBaT8qWGbDmmlVGGMs
         NjqVhQ4iT19NH54h/o031nhJGpQE709bqQGVRyQLqzqTlwqtLthaN5XCIZJU7QeHZKPV
         7RpKjgSX2shbHYaLO2XRIBlV1I/pw12fr677ryFzUtTzmEO6cHbWiMSOqk6Y6mC6LTnO
         fGq9ujyaozQo6InbwuFAFUhXHgaQ2z+Vj7e/aH0cVthkr5cQiRPd8TLDXser1uQZSvdQ
         uSrWISkG1+TUkJamfS7H8wiAskxz+nL2tRUJyz6Gl9T3k/rg8i1HN5IaFoUZL9LS0lpw
         hwdA==
X-Gm-Message-State: AJIora/ujY92EQfNAgs2FrKMOj6B3ltNs1kKrmE3Q+cLWxAa+WShUrqI
	IPPJdFh8PwsZe30GUTN2R5A=
X-Google-Smtp-Source: AGRyM1v6rPWBPZilFN90Jv15KQMt+j6kMHP6jk8djEs05COCTktH+9O11oNXRuqjRUVfaq+6AN/t3g==
X-Received: by 2002:a17:907:3dac:b0:722:e6ab:8d9 with SMTP id he44-20020a1709073dac00b00722e6ab08d9mr4190126ejc.20.1657289674494;
        Fri, 08 Jul 2022 07:14:34 -0700 (PDT)
Received: from jernej-laptop.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id q2-20020a170906a08200b006fed93bf71fsm20603401ejy.18.2022.07.08.07.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 07:14:34 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michal Suchanek <msuchanek@suse.de>, Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev, Icenowy Zheng <icenowy@aosc.xyz>, Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] sunxi: dts: Fix SPI NOR campatible on Orange Pi Zero
Date: Fri, 08 Jul 2022 16:13:11 +0200
Message-ID: <10106175.nUPlyArG6x@jernej-laptop>
In-Reply-To: <0c575068-abd7-c69a-e59c-3140f8cb7813@sholland.org>
References: <20220707174801.36e010da@donnerap.cambridge.arm.com> <20220707170721.20225-1-msuchanek@suse.de> <0c575068-abd7-c69a-e59c-3140f8cb7813@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Michal,

sorry, but I was a bit too quick with giving r-b line. See comments below.

Dne petek, 08. julij 2022 ob 09:36:26 CEST je Samuel Holland napisal(a):
> Hi Michal,
> 
> The subject prefix should start with "ARM: dts:" (e.g. "ARM: dts: sunxi:").
> Generally it is a good idea to look at the log of the file and follow the
> pattern you see there.
> 
> On 7/7/22 12:07 PM, Michal Suchanek wrote:
> > Without "jedec,spi-nor" compatible the flash memory cannot be probed by
> > u-boot. The macronix part is what is shipped on the boards that come
> > with a flash chip.

Please reword this a bit. DT isn't user specific, so U-Boot should not be 
mentioned. But you can write about compatible being wrong. According to DT 
bindings, it should be manufacturer specific compatible, followed by 
"jedec,spi-nor".

Once both issues are addressed, you can keep my r-b tag and include fixes tag 
posted by Sameul.

Best regards,
Jernej

> 
> Fixes: 45857ae95478 ("ARM: dts: orange-pi-zero: add node for SPI NOR")
> 
> Regards,
> Samuel
> 
> > Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> > ---
> > 
> >  arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
> > b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts index
> > f19ed981da9d..3706216ffb40 100644
> > --- a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
> > +++ b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
> > @@ -169,7 +169,7 @@ &spi0 {
> > 
> >  	flash@0 {
> >  	
> >  		#address-cells = <1>;
> >  		#size-cells = <1>;
> > 
> > -		compatible = "mxicy,mx25l1606e", "winbond,w25q128";
> > +		compatible = "mxicy,mx25l1606e", "jedec,spi-nor";
> > 
> >  		reg = <0>;
> >  		spi-max-frequency = <40000000>;
> >  	
> >  	};




