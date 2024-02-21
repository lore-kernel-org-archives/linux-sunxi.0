Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCC483A1F
	for <linux-sunxi@lists.linux.dev>; Wed, 21 Feb 2024 21:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708552440; cv=none; b=keX6UH1IL+sanGXhErCh60W4j9PbvDc6EUDyHJAbDX4BgJVvgfDSvQUlg/4NNxfKoYeF1bTh/SQGHnuam8xUm2iPv5UaxS5oxETpr7z/hAVsUYyKhG3oMjEo3EGyf7ov5F8j0Bv0Iw7/90ZZ+Dl6rEEPlIuCTmNGTK4W41yDeTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708552440; c=relaxed/simple;
	bh=4yH6g5tamOusVbcyW0SRdI3swoDz3DS9OYnuqNk6+z8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Eo6gfBZyckemM9lceXhxOT44oR2qX2MyqLdMcyYLOArqfbXRuMIeZr6yVbVrDcUIBmxNLDcnoMZSKJL1CHn+8fvAxwU32jUBqkr8inl5g/N+i3+adKXLf4qsK+sn5QScl3GBGl5xmrKBpG1odsdUxuujR8vIke9dzhiZbAaPqeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D+ZzqPYX; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+ZzqPYX"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-33ad9ec3ec2so1126739f8f.1
        for <linux-sunxi@lists.linux.dev>; Wed, 21 Feb 2024 13:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708552437; x=1709157237; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PFRJDpPchYGhggcYn82/GAyKEim/RW8WyZ7494NwPio=;
        b=D+ZzqPYXWaYKobA22Z28dK7Y+Iowv+6ouzdDcxjOfCAxlZN1Ig3rZhrjh9ND7z5G3i
         mhZ32E0JfSZ2RCrEh/woO+OJ9Qmk++b1QvN3lgKLjL1F5VZ04Vbwa093l2zLL03pL2hf
         aaMEbtlTujzjmURpUQ7hxZ445U/kTxdn26YL+wsfXjE5196yfeKrYU9iMy300AoA38Dx
         XuEsuLbiJoRojscemahWaruqRs5Z7Nkq5sEW0D9KVY18POG7OSVL0m1v4Z/mtRBrwMeY
         WfBgHS13LCw+IORHAzV/M5OHI7kixEmARAJdl8FamIkIOUUcFGXjoOIkOIXwW9MJzydw
         PQnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708552437; x=1709157237;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PFRJDpPchYGhggcYn82/GAyKEim/RW8WyZ7494NwPio=;
        b=E2cnMAnbC5wysimMVry6Wmht3GlsJspS0yCvP4zBzwCaC+Csl0BSXQiel0NyNq6SHO
         Qp1UOjrpuQGNU7hTlowmCv5jOW3C/AWF00431ekO1nqBo7/38/WnIUq6PvfhENZ4wnlA
         8cCkgKmg5yXgLHqqLe8VPrUlBPqtu5bekutgk0rdGH1bLBNvmFysO9ZIPykRmlZGBwkn
         Z80sXO9vH6+96McYFv2MwyGOdb3G8UiTKKUgciCAdVl53/ST6FY1GTb8tmoOY+jccjQl
         6zLCKi4dGZz4njcxw1LX85cMaOJt/my+693DFFhtt14QN1rH5lJ3ubFGN4wYdMKLUw76
         KlTQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3ec+lsF3vhvUmuygWxeWMpmMke7p3zU4GW8v3QTiLy7yAHwQyNtPeYL7te9bQ+ESVbou6E0i8u2gQGzTrHyuocnclAiGJMWzGmak=
X-Gm-Message-State: AOJu0Yw+PsHYztEMTzUEFYyPznroMH3/I9vfY5aREE07eJriv4ajvqH/
	8OGqmZkmNoMObNeOdKcsMP1nKHO4p6JzZnVGpcCodkQNr7npVu6vRMIBaz6n6nKEEJKWkBL+Lp9
	04/SutALN+lb5BAaC3KeX+MmRAnc=
X-Google-Smtp-Source: AGHT+IHV55akNwFuAIFfQvhZOuT8lK5D89kMCL3mGgzrAcnXttcgmEDXvmr7PnYnEg/aTKh3F7l+YPToHA0Ndcz8jzo=
X-Received: by 2002:a05:6000:71b:b0:33d:32f7:c85 with SMTP id
 bs27-20020a056000071b00b0033d32f70c85mr8694215wrb.0.1708552437408; Wed, 21
 Feb 2024 13:53:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240219153639.179814-1-andre.przywara@arm.com> <13c957a9-6021-46a7-9243-b3658c26a333@linaro.org>
In-Reply-To: <13c957a9-6021-46a7-9243-b3658c26a333@linaro.org>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Wed, 21 Feb 2024 13:53:30 -0800
Message-ID: <CA+E=qVeMnQNrT8tNnHBnCL2Efy3VjbRAYQGMXstziCThRsiBDw@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] add support for H616 thermal system
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Martin Botka <martin.botka@somainline.org>, Maksim Kiselev <bigunclemax@gmail.com>, 
	Bob McChesney <bob@electricworry.net>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 21, 2024 at 5:43=E2=80=AFAM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
> On 19/02/2024 16:36, Andre Przywara wrote:
> > Hi,
> >
> > this is v5 of this series originally by Martin, only some cosmetic
> > changes this time, for instance  mentioning experiments with the SRAM
> > controller registers to confirm that it's not an SRAM region which fixe=
s
> > the temperature reporting issue.
> > See the Changelog below for more details.
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > This series introduces support for the thermal sensors in the Allwinner
> > H616 SoCs, which includes its siblings H618 and T507. The actual
> > temperature reading turns out to be very similar to the H6 SoC, just
> > with support for two more sensors. One nasty complication is caused
> > by reports about temperatures above 200C, which are related to the
> > firmware being run (because the vendor U-Boot contains a hack avoiding
> > this problem). Some investigation and digging in BSP code later
> > we identified that bit 16 in register 0x3000000 (SYS_CFG) needs to be
> > cleared for the raw temperature register values to contain reasonable
> > values.
> > To achieve this, patch 1/7 exports this very register from the already
> > existing SRAM/syscon device. Patch 5/7 then adds code to the thermal
> > driver to find that device via a new DT property, and query its regmap
> > to clear bit 16 in there.
> > Patch 4/7 reworks the existing H6 calibration function to become
> > compatible with the H616, many thanks to Maksim for figuring this out.
> > This makes the actual enablement patch 6/7 very easy.
> >
> > The rest of the patches are straightforward and build on Martin's
> > original work, with some simplifications, resulting in more code sharin=
g.
> >
> > Please have a look!
>
> Thanks for the detailed explanation.
>
> I'm willing to pick the patches 1-6 and let the last one to go through
> the allwinner tree.
>
> However I need the blessing from the different designed maintainers for
> the thermal driver and from the sunxi_sram

For sun8i_thermal:

Acked-by: Vasily Khoruzhick <anarsoul@gmail.com>

> Thanks
>
> --
> <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for AR=
M SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog
>
