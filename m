Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B0772617
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 15:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785772650; cv=pass; b=VuEM+FL84jsd845XH2cZ4A8KucGL/TcM7jw4DuPhkQdmWs8UR+BENqHS4cmLSnBZcV8wA4VothTFxNrLvaCE2NnpImqMTr9HQ6seXl4Zin/+EInQX4mD92yoiRzb7URvD48bgA8baDXfP8TrvKY0Z4zIdqPslhrDNktNRMLtxas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785772650; c=relaxed/simple;
	bh=fZ8BuOv3ILCmNDbfVHwiSe/Itiuz/HLNsG0RZrH9AfQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ilcOsyNJ6l9UEd6Uiqt5PZfdIGioT54I7qcFSgcnz3cN2snsDqj2x21Nciq1faDbiPVUiq4v0+H4zOw6NRFVr5EPvYAdYU6GTM2VqY9Q0loSqZ+6Mh315DfvStWxgniSwn+KdW65yyRmNmRSrYxnXTCZCCES3cvjFGSZp52+AWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LRZa9NK8; arc=pass smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LRZa9NK8"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9667ea2fc22so514867241.2
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Aug 2026 08:57:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785772647; cv=none;
        d=google.com; s=arc-20260327;
        b=DgD25LW3mBiR8eDJZRuMD+c3YamD9uBkaD9LE26uyN3Qzwe01r2NXntro56E9MfANV
         Y0G7Yj2w7Tf3MTYnaxO4/2bWd/OU8Rw++JuoeBL7Un6z2T6VJuT1nhs9HrrwZjdsSPiz
         ouFfY820AWtfooEISgeOWRc9Xah7g9LUskJIS79aSYtwj9kPHP1YqLtXEdQnd05uc/CF
         jaW1qJTlPKEuqwUiiTgyZPQpZcaO1Li/hs2XkmVs/3pCWoJVE7zwzgI1aveTxepid7Wc
         LeJ2n9shD8X6NiuqgampXP3BE1epktNFaMpaO2BtS/GUyBA6c4u33/8XgvFPqdCxt6WV
         SSqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N0JlmS2gNslt5buGhuv7J6Rqxg7nw4cpe34TAqatS1E=;
        fh=p71jNt4zMW1Lupptx/a7yh/LVVKpqVm0XU2Ga7MBJoU=;
        b=bzTnsgj6fWrWRFWES2LAo78P9YZOiMTz9WcGHpkQrDRQX80cS4dkkrejX9vfbXXMP1
         dOpG36eTZpAKKnJDailMha744tkv/JiUCb7DGjya3R/ed7zAXwybC4elNkk4/un74NHh
         sESaociqrbiPbSBlN7gybh+jTs24yOfkfO5pw9RhCZFozk3zXqDlQEEbevnq77c0bE7y
         xiWLE0KkRQ7CulEbfgdg9bdbzD7o3PjjZB4nApQhPvm39ZvJCA/8zg/FD0jFsPuekPp8
         m2laELmoJjQqqp5rUJHXXew8zdBDv4f5C2300zIyF9PeA5PYi1unzjZF/Q2rfTDqKMMI
         rIXw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785772647; x=1786377447; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N0JlmS2gNslt5buGhuv7J6Rqxg7nw4cpe34TAqatS1E=;
        b=LRZa9NK88DPIqzRGLUUVLKDRl+SU+/Vx0X8dBg0VeNW+86w/VU0Bplw0Zi4TXXcU25
         tDOJQJPf4zVFG0QFneaONBtKMq0Xh1F432WJn0wSbb6QvyOGc5/kW9K2PTcXBXFJOfC5
         oEPcMBq0AgoRI5V2jLTO2n6DTjd0Da0257NXTLG3VlkqdeR+HwJNsAsquOi1pWgzkvNc
         +odel3hY0uPjqcQchHsgaba/DmRIkmUPLZwSTGpOt9tsgrK4zz3qpntaWR1sdDQTt7/w
         3qmexr09jkjmlnuYmRdUNvIE3d4K6MlRWyNzHGy6nhI2imciMhBSc29JDZwtFfxewoI4
         XlLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785772647; x=1786377447;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N0JlmS2gNslt5buGhuv7J6Rqxg7nw4cpe34TAqatS1E=;
        b=cIbvzFtUovTOO3XpMJuHbGIBZrUxJRusPY2fBxYP2ml0wZl//PgDN9CX6AaEu154Zu
         dl2Uqiab3I+GPFqRasADGaRMpQNwkNKxuSF+9qn5owCTC0hjQ30ySY3TQHbaihcWAGCH
         +Uk0/ELiIvh3uUZOMn2X2m3KfEuwfuHB9Ya0RTSaZ37Ts8Dxi0CPAULTEjWWrMLcfXw6
         MaaDhiHWzpzpZ9Nt9mySy5ZKbxonUiEdyV7zEsWCTZzOYK8gQaYyM1DJgG/ZJelm9vD7
         PFpFzRgF5n/dwBZMFfgtn0HZcoFVvvMDcgW1mAlDRRzDGFieRNwQqHI4DkUgVV07eQqP
         ilKQ==
X-Forwarded-Encrypted: i=1; AHgh+RoUGMzCxZZe91lTU5yMXz6mr4TIEeM7vY8IigC/IRO3iAQ04duJufiIt1/u2WkQzics7mSUvZXzgM86Tw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwjLn1qWMcbNLHNolcDS1LfZ1up3fd53+ixqMTddfjaoGYETvRV
	1yyiFZYdt/KVPEBDBOkU/GmNQ+GkQUrGNi80WLl4a34qJklDFVFY5FUO/ngdqROHEdJpdn5dTjP
	7rZDyh/IL04Z01/sBuFsHR7ZXDhT1Er8=
X-Gm-Gg: AR+sD13sGP/XKr2lDZduh82F04xz4s0T7YLMzqyWNMf/gIH9jpNeaZcWLCnpKeoVMRf
	7zVyfDtQteL4s9YC7Hr9329j//BawHpwaFqzUaOZcPmi8BjQ//thKh3q7nRoZELLI2WD11rsR1M
	rJTO0vzfqxa2Bvs779mWbvJpWLfAGDuKJw962qmaqmkRRKIyBIK3XZjuPH7O6EsshR9VqNtDbby
	4RiKrdK6EDS7slblpw/rk26L9GyXCAWD2UUjnpnFLi9z1gq6rrgIGFFpyZ09S5PFAZEjyDDQUHy
	gTuSwsK6N4X3D9zozIGQYj5j3IpPTcQNssWkYlA6YZfk55/VdQwwuxzOwpsUXLt8cJN007LfWqO
	5C+8/klZhittELm9PihZI+fnh+fvqweS81lGITFAP01aTwE3TjD4QMsHU6teYCST6YVogSaXwvO
	jd6p8KMMOJrDMi7QLLu0ASeGzp/AA0xHLtSw3u
X-Received: by 2002:a05:6102:3ec1:b0:740:177:f357 with SMTP id
 ada2fe7eead31-75b21b5cddamr7901767137.6.1785772647108; Mon, 03 Aug 2026
 08:57:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com> <aaec8809-8218-4412-a60d-931406dbf287@arm.com>
In-Reply-To: <aaec8809-8218-4412-a60d-931406dbf287@arm.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 3 Aug 2026 09:57:15 -0600
X-Gm-Features: AUfX_myOaFTmy1w_XsU_xICVSFiXSt1enMYBuh0WDNCP9gRZxCQ8cKkbteQKJ94
Message-ID: <CADvTj4qCYjQHOQn1jRTHNNL=xeX6z3Dgc-PLwOBUvX34AU6cuA@mail.gmail.com>
Subject: Re: [PATCH 00/21] net: phy: add X-Powers AC200/AC300 EPHY support
To: Andre Przywara <andre.przywara@arm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Richard Genoud <richard.genoud@bootlin.com>, 
	Maxime Ripard <mripard@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	mfd@lists.linux.dev, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 7:26=E2=80=AFAM Andre Przywara <andre.przywara@arm.c=
om> wrote:
>
> Hi James,
>
> thanks for sending this to the list, but as Andrew already mentioned:
> this is quite a beast, and would need to be broken down.
> Jernej and I created some patches just for the AC200 PHY on the H6,
> which Jernej recently revived, and IIUC, wanted to send to the list.
> This would probably be a more workable route: start easy, then add
> support for more SoCs (H616 depends on the WIP PWM driver) and more
> variants (AC300) later.

Well, I wanted to validate that the overall driver design is suitable for
the H616 which has to support both PHY variants at runtime effectively
since that is the most complex use case, I also don't have a H6 board
to test with myself at the moment. I think being able to see a more
complete implementation like this is helpful as it can better inform how
we can tie the different control interfaces to the link PHY in a way that
works for the more complex H616 case.

> Which also brings me to some attribution questions: If I understand
> correctly, this has been written mostly by some LLM? I think you would
> need at least to disclose that, if not even add an official tag?

Some patches were, sure, my understanding is that it's not required to
explicitly call that out but I can add more info if that helps, this was
tested/validated using a heavily automated hardware in the loop
testbench setup on an AC200 and AC300 variant H616 board.

> Also I wonder how this relates to the patches floating around for a
> while already: https://github.com/jernejsk/linux-1/commits/ac200-v4.
> This branch is relatively new, but the ac200-v3 branch for instance is
> much older.

Yeah, parts of this are loosely based off of some existing patches that
were floating around like those, although it has diverged quite a bit as
well since this series is designed to handle both phy variants.

I guess I should link to some of the earlier work in the cover letter?

> On 8/3/26 07:14, James Hilliard wrote:
> > The Allwinner H616/H618 secondary EMAC is commonly connected to a Fast
> > Ethernet PHY in an X-Powers AC200 or AC300 companion package.  The two
> > packages expose the same link PHY ID and largely compatible link-side
> > registers, but require different control paths before those registers c=
an
> > be accessed: AC200 is initialized through its I2C MFD, while AC300 uses=
 a
> > non-PHY Clause 22 control endpoint.
> >
> > Some H616-family products were shipped with either package under the sa=
me
> > board identity.  For those systems, this series uses a SID NVMEM field =
to
> > select the control provider at run time.  With CONFIG_OF_DYNAMIC, the l=
ink
> > PHY enables only the selected fail-needs-probe provider, so an AC300 bo=
ard
>
> Just to bring that shallow discussion we had on IRC to the list: I
> wonder if this is the right solution? Alternatively I was wondering if
> just patching the DT in U-Boot would simplify things, and also help
> other DT users like *BSD or U-Boot (proper) itself, to not boil the
> ocean, but just allowing them to follow a standard DT description.

This can be used either way, CONFIG_OF_DYNAMIC isn't a hard
dependency with this design, aside from adding CONFIG_OF_DYNAMIC
support for mdio the dynamic enablement of the correct phy control
drivers is relatively simple with this architecture.
