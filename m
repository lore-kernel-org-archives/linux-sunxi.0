Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C702C650
	for <linux-sunxi@lists.linux.dev>; Tue, 29 Nov 2022 06:49:28 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id o5so11517122wrm.1
        for <linux-sunxi@lists.linux.dev>; Mon, 28 Nov 2022 22:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lmVjYexoERFRLmswRpO1q36g6awLl71zVxT5hQ15vcg=;
        b=ntk/FH9EbBtwfWvoMIOUfe9FsgBTlcvBWzIX7MVys87ufBo39LkWymGd0In84CowLn
         4zIscMlAYgrIwoSOF+t0A6A69nIVOwcJWtvqLCXVF+WvGJg6lhGrIeZHrVfLjjMi+DiQ
         FePqtvkUemS2vBWUoY5IqccNWo2ZWvZKSCjxRPxvwRRL8KzlFdWaOiu6Obii7UrRHdD+
         99DKQaDAmDwjsGwa3aCftxFFGOloKd6RJ9Fq0hTCNQtIkqFPShRiwzHkJhPhv2o+LkDb
         naMDb4HwaV4/wuRCq7L1tBrOqdE/S8gfkRyZ+BULYGMGvE08GSql13KsaLpwTZIFhchP
         Q3LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lmVjYexoERFRLmswRpO1q36g6awLl71zVxT5hQ15vcg=;
        b=pJuPtaEoJgoIYTDZLHlw3lNeNmHdBQFtCFMM0Wn5v0cICDmNYtylbBzdpKcKtAQ+s8
         ZU6Uq2kkX04aCoxwKpfpCNujrLCxeAeKVZR7Q8YiD/Q0XRWX37lUIaOWcyyL5fwqet9Z
         0k78W/5pKKzoS4NYhVgoDVyMbigsvVQYt9C8BFofjhPYriaIU8P2kJzwoBokn08Nv/xq
         pkzbXrQ8A/FhDxEi9kTtt9DNakZWSgXWQQ4MRaU5rcVudhR5iXbboyJ84oOqJDXnJapD
         /z4YvfNvXdQkOUt7bUcfKRGz4dYH//TJOZDSWLDZM3jTuLGTfznJx41yY0eCDgiKOyZY
         Nofg==
X-Gm-Message-State: ANoB5pltbcnBJnu4vElhWPATMXT5DLzWk0OiHoeMNRW/VawAp5RJtz/W
	8kN/aybRbY61y2y6hDgz3C+6pA==
X-Google-Smtp-Source: AA0mqf5dlqn3HBjFPq2nAmDpPb3yIbAlXddjpobxrmlhDjs9DMdVfaLD9GLImkT+T+Q53hDWdMOb6g==
X-Received: by 2002:adf:ee8a:0:b0:242:2d:c679 with SMTP id b10-20020adfee8a000000b00242002dc679mr14065313wro.369.1669704567012;
        Mon, 28 Nov 2022 22:49:27 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id i18-20020adfb652000000b0022e36c1113fsm6071466wre.13.2022.11.28.22.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 22:49:26 -0800 (PST)
Date: Tue, 29 Nov 2022 07:49:25 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
	Samuel Holland <samuel@sholland.org>, palmer@dabbelt.com,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Stanislav Jakubek <stano.jakubek@gmail.com>
Subject: Re: [PATCH v2 12/12] riscv: defconfig: Enable the Allwinner D1
 platform and drivers
Message-ID: <20221129064925.kjjqrzmi3fm67akt@kamzik>
References: <20221125234656.47306-1-samuel@sholland.org>
 <20221125234656.47306-13-samuel@sholland.org>
 <Y4JBa52o4Yemv/uj@spud>
 <11740765.nUPlyArG6x@diego>
 <6aad3b63-498e-b13a-af49-b5af0d4e721e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6aad3b63-498e-b13a-af49-b5af0d4e721e@kernel.org>

On Mon, Nov 28, 2022 at 09:17:38PM +0000, Conor Dooley wrote:
> On 28/11/2022 21:11, Heiko Stübner wrote:
> > Am Samstag, 26. November 2022, 17:40:11 CET schrieb Conor Dooley:
> >> On Fri, Nov 25, 2022 at 05:46:56PM -0600, Samuel Holland wrote:
> >>> Now that several D1-based boards are supported, enable the platform in
> >>> our defconfig. Build in the drivers which are necessary to boot, such as
> >>> the pinctrl, MMC, RTC (which provides critical clocks), SPI (for flash),
> >>> and watchdog (which may be left enabled by the bootloader).
> >>
> >> All of that looks good.
> >>
> >>> Other common
> >>> onboard peripherals are enabled as modules.
> >>
> >> This I am not sure about though. I'll leave that to Palmer since I'm
> >> pretty sure it was him that said it, but I thought the plan was only
> >> turning on stuff required to boot to a console & things that are
> >> generally useful rather than enabling modules for everyone's "random"
> >> drivers. Palmer?
> > 
> > Isn't the defconfig meant as a starting point to get working systems
> > with minimal config effort? At least that was always the way to go on arm
> > so far :-) .
> > 
> > So having boot-required drivers built-in with the rest enabled as modules
> > for supported boards will allow people to boot theirs without headaches.
> > 
> > Disabling unneeded drivers if you're starved for storage space in a special
> > project is always easier than hunting down all the drivers to enable for a
> > specific board. 
> 
> I wouldn't mind being able to turn on all the PolarFire SoC stuff and
> yeah, that would be the way that arm64 does it. But I do recall hearing
> that I should not turn stuff on this way, when I initially tried to
> turn stuff on via selects, got a nack and asked if I could do this instead.
> 
> But it may be that I misremember, which is why I appealed to the Higher
> Powers for clarification :)

FWIW, I don't worry too much about modules in defconfig because I always
immediately apply a 'LSMOD=$PWD/L localmodconfig' to it, where the L
file is an lsmod output which only includes modules I need.

Thanks,
drew

> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
