Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E65EDC
	for <linux-sunxi@lists.linux.dev>; Fri, 28 Jul 2023 20:25:33 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-4f4b2bc1565so4285015e87.2
        for <linux-sunxi@lists.linux.dev>; Fri, 28 Jul 2023 13:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690575932; x=1691180732;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p5zFoHHbl1khNeaZtgyvQfmr2Eml2xUSE31w1MROj8s=;
        b=Mvp+uZ2ubAXR7fJy2rP/rjMADNJ8iWiCFTmuuQLAUa2cvN9t5ZQKVS/Kvjj5FbuH1o
         SkTTPk0FT2yY4AEEZC/R/ouurPlLpT4t/HOq1wUbB+6YMZeIVmPLZvSzpKxD+9K+flOJ
         frJbPrjnz4NZGqIpnaEB6JoNuvD7Upq0U2EM+kErzKEZA5C6Q9TgUv3ttDhDuBCLs01x
         roY2ooPQKOf58tF6n/XA8RqBQnFoF+e1brkbQOD3oCkbSibtAw7uF3jpgiGa20R5gQp5
         VAw3pFMmOtHwl0yl1snJ1oktiNbEFjM9Umo9Fe4J14Bibt083/bxTLsPhvwIEixwsKvb
         sgCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690575932; x=1691180732;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p5zFoHHbl1khNeaZtgyvQfmr2Eml2xUSE31w1MROj8s=;
        b=W0yZsyCrgswcV7JSsK6XBqwoACtvkrN8th/Rd8udDbnF5e6Jz63IVmZxAOiErZXY1F
         5wWqxRfJ5wNNwk0AgRLaIK18UG4sFuCtj5gjobrAyub4xHvKWw1FmIz4l9s4LB6gkBjy
         WBQCDltZ1KV7OjSyXmypaX8u6/kTIMhmRvzZD0oIzfvicKmSNyRlbW1U6UL8z1PZLa05
         bkAPYc9JMobE3s1MF/voUb6qZ2x5d5zGBNCSPT0KlzsaIzGKi8SrpLqb7a4UbJeOL42B
         kzR8k6KjZA2zg1Wp6znaaNC+S9cCPYNv8vZqor6vnuB30ch9IiQmGnD5uNGRW+ynnwtA
         CMNw==
X-Gm-Message-State: ABy/qLYpI51JA3Ad/sUThZdE/blq1B5TtgwHaj1hTzDspYiMnbK87ypJ
	QQoAhlpeJ2FOS+Dve0lsVMo=
X-Google-Smtp-Source: APBJJlGT5wQqKEBo7g6Vlgk7jSYvRDN95uB5jwEuNX9pjmCrlHmNhjuVQwfT9dUq+K8snBX+L9df6g==
X-Received: by 2002:ac2:4e8c:0:b0:4fe:993:2218 with SMTP id o12-20020ac24e8c000000b004fe09932218mr2420186lfr.31.1690575931619;
        Fri, 28 Jul 2023 13:25:31 -0700 (PDT)
Received: from localhost ([2a05:3580:f312:6c00:826c:ae47:61a7:8af8])
        by smtp.gmail.com with ESMTPSA id x17-20020ac24891000000b004fe1960dd7csm854139lfc.132.2023.07.28.13.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 13:25:30 -0700 (PDT)
Date: Fri, 28 Jul 2023 23:25:30 +0300
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Kees Cook <keescook@chromium.org>, Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Jarrah Gosbell <kernel@undef.tools>,
	Arnaud Ferraris <arnaud.ferraris@collabora.com>
Subject: Re: [PATCH] arm64: dts: pinephone: Add pstore support for PinePhone
 A64
Message-ID: <ZMQkOpDzyNx7Y44F@skv.local>
Mail-Followup-To: Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Kees Cook <keescook@chromium.org>, Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Jarrah Gosbell <kernel@undef.tools>,
	Arnaud Ferraris <arnaud.ferraris@collabora.com>
References: <20230724213457.24593-1-andrej.skvortzov@gmail.com>
 <7f4a7739-cb03-bda8-df90-e8eb119b732b@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7f4a7739-cb03-bda8-df90-e8eb119b732b@arm.com>

On 23-07-27 15:57, Andre Przywara wrote:
> Hi,
> 
> On 24/07/2023 22:34, Andrey Skvortsov wrote:
> > This patch reserves some memory in the DTS and sets up a
> > pstore device tree node to enable pstore support.
> > 
> > Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
> > 
> > Gbp-Pq: Topic pinephone
> > Gbp-Pq: Name 0161-arm64-dts-pinephone-Add-pstore-support-for-PinePhone.patch
> > ---
> >   .../boot/dts/allwinner/sun50i-a64-pinephone.dtsi | 16 ++++++++++++++++
> >   1 file changed, 16 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> > index 87847116ab6d..84f9410b0b70 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> > @@ -19,6 +19,22 @@ aliases {
> >   		serial0 = &uart0;
> >   	};
> > +	reserved-memory {
> > +		#address-cells = <1>;
> > +		#size-cells = <1>;
> > +		ranges;
> > +
> > +		pstore_mem: ramoops@61000000 {
> > +			compatible = "ramoops";
> > +			reg = <0x61000000 0x100000>;
> 
> So what's the significance of this address? That's 528MB into DRAM, so
> somewhat in the middle of it, fragmenting the physical address space.
> And is there any other firmware component that needs to know about this
> address?

Hi, Andre,

there is nothing special about this address.
Range from 0x40000000 - 0x50000000 is heavily used by u-boot for
internal use and to load kernel, fdt, fdto, scripts, pxefile and ramdisk
later in the boot process.
Ramdisk start address is 0x4FF00000, Mobian initramfs for PinePhone
for kernel with some hacking features and debug info enabled can
take more than 100Mb and final address will be around 0x58000000.
So I've picked address that will most likely not overlap with
that. Probably it can be moved below 512Mb. If you have address
suggestion, I'd happy to check it.

-- 
Best regards,
Andrey Skvortsov
