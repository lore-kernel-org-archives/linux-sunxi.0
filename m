Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D041DF27F
	for <linux-sunxi@lists.linux.dev>; Tue, 12 Aug 2025 04:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754971203; cv=none; b=j1qGTET6ugcUBvWeEFz0wY7LuVDD8sUw/xH0J7jz/MNq+dnqdG1kwJ1Q2YoWlVY4yW/aMEHNkDfAWFIHIelrGG6NplvAdg8u9DR0U2jIkPGOT8i5DVA02UULVux+l2YMPYVrXbmgv6ayvjOxbygcoZhR2TnR/9Ut9LPlHXkB1Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754971203; c=relaxed/simple;
	bh=GMnYprDJn/vkh70LTMjOLb44+LyuQLrEoG31BXbq35M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NB0epKrDTzJp0GqN8fiPS4vmxneK3M8omW+GV/MyshQrz8jIJZbT+HRP8uexfITuYYP+8sEoVP1CeHrhavAej/ZYPU5EI7Nkl8OE9mWye7q3H1oaTkmVqd0wFyj7RaTfeuYaK+IMdxCP6tkw8KpXfhOMcQ05vQfspjO/uIrYMSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VlzCn+6X; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VlzCn+6X"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-458b49c98a7so31712905e9.1
        for <linux-sunxi@lists.linux.dev>; Mon, 11 Aug 2025 21:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754971200; x=1755576000; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0c1GMSRzJgw1VyGTUJNouoNdUcXSTz0PpZU4PZzYAas=;
        b=VlzCn+6X1q9nvvmlMGv2Pz2nqrVoXeU1dUENVZlvXsYWmDmpq1zMHsEmmgIE8yzr6s
         KMzJQ5ghFS5SjsgtlzkAixl68ete/PoyAGlNZitXhanzZeM7gBypbPkSFbLoVoEk+3XL
         xlOMLqU9OrLTDJ5cit7gwuy2YlXK/wDI0FXWcu8S3KXMZU+EofYBdCQKHN+TZRtgBFxH
         c67Axf7FjchLfJJuZrjFFDnCefbKqA34fr7JEzXtMRnmX2KSAdey6XjrBnfWjw4gv0pW
         aDooq0dTVCcp4vJpBh+2M3ctEUEIXzvuIg1pHTMbOdsYFpcu7kV5h8VzYGZ13on2l3Np
         1c6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754971200; x=1755576000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0c1GMSRzJgw1VyGTUJNouoNdUcXSTz0PpZU4PZzYAas=;
        b=ceD6m+8zvnIF3uwvm7jedYgctfd42mi8noJ+yNCj+j5vYnbGwvlzSWzeWooOfPQnCG
         uwut+ll7dUky7WfgrvX2jedte6nDeyK6JvY4KkbyDI8/CUhJPRHbKsNTqZVSPoZxRld6
         sYXSfiG6VdFZMt6nRTVMzoQLYMHacI46SjfWIh+iXkcmLBO6oUubBTFy3qavy9WSjA+P
         0ln0TSyR4D+gg6f00sYgkBknp98xcZgf0WR8ZlnOstLuEGSbWtjXXJtKey4TgiwjVrBp
         plsNnY3SMPdrq/V0IsQW9wGNVMMdiumjxcvS8ywZ+pwiWw+uPyzWjsnduWxj6nuw920L
         95lQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiWTIW6injB7ZoiIBYh2WzaSMMJDvkQokh8qDnSCO4ji9FVPNiMxt3n0C8MK+/WbbkA0dtKeWKltGJhw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9ZVe0fNFs00/eSmPhDGjBk/PNmnF/XqmDGMOwWdKCnfIfmV63
	dfJSPs0G+cbk85q/ypSbBKQkrllCAr4Z5/Gwu0Bh4ctPOkxU1/dg0jfaWAncQ5J9+xg/ghH74nB
	MDp86+/H4rdZeUZBKPNuAPijdUaAOIFg=
X-Gm-Gg: ASbGncva6Mfv0VJsGSr+9R18MmU0p/I5eW35ZPr97v5jNFSQJ+4l3LxsBIe9o844rfn
	gu+WQqL3Ax3wVVtSJyx0kUwhyC5ZDj4FwVYQQkpYShGZfZXyTDBijMRQDulRvaLP4Zc4YPh8gsu
	a19NrXNLMl9TeVPbRtjUGDhRGBbhfYYwgHFnk9i0gp/j5azmukEnNR3tRSF+e+hc9YrLOUJE/u8
	LqvOqIR/aax2XPxCX8ACNf/b2+/CAKgl5Ja70z8
X-Google-Smtp-Source: AGHT+IFAHjifxEPFvVM9RtM81jQ6M0pqG97zHgGcyrSvgAJHJSdAmE/eFdbmTa6DzZMNTZx9s5GL1xb9M3rQXLygrJY=
X-Received: by 2002:a05:6000:250a:b0:3b8:d1a4:bab9 with SMTP id
 ffacd0b85a97d-3b9110323c1mr1444691f8f.45.1754971199470; Mon, 11 Aug 2025
 20:59:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250713002741.367252-1-ejona86@gmail.com> <20250812003057.0068a65e@minigeek.lan>
In-Reply-To: <20250812003057.0068a65e@minigeek.lan>
From: Eric Anderson <ejona86@gmail.com>
Date: Mon, 11 Aug 2025 20:59:48 -0700
X-Gm-Features: Ac12FXxskpIDlwSu6B_XSY4PEZxpved26US70OVdyT5AWMcq6rZnhhkVR2K6L7w
Message-ID: <CAFyMnzY1+e814mVek2GczOpX16TySVT2mdAvbt3x7jz3JVAdBw@mail.gmail.com>
Subject: Re: [PATCH] sunxi: Enable SPL/SPI boot for OLinuXino Lime2
To: Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.denx.de, linux-sunxi <linux-sunxi@lists.linux.dev>, 
	Stefan Mavrodiev <stefan@olimex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2025 at 4:33=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
> But actually I wonder why Olimex has two different DTs for the
> eMMC-less boards and the board with eMMC.
> ...snip...
> So I wonder if anyone wants to clean this up, because I think we would
> only need the A20-OLinuXino-Lime2-eMMC_defconfig,
> A20-OLinuXino_MICRO-eMMC_defconfig and a64-olinuxino_defconfig.

I had wondered the same, but expected I'd not understand. Looking just
now, it sounds like it doesn't mix with the NAND variant (-n8G) well?

https://github.com/torvalds/linux/commit/27dd9af6bc000ab21fdd41e58e3dddedba=
57ab92

It looks like the emmc DT has gotten slightly slimmer since being
introduced. It doesn't seem the eMMC DT turns off any part of the NAND
DT, so I might try to poke at this some. But I don't have a NAND
version of the board to fully test.

> >  CONFIG_SPL=3Dy
> > +CONFIG_SPL_SPI_SUNXI=3Dy
>
> This needs to go further down below. After configuring for a board, run
> "make savedefconfig", then compare the generated "defconfig" file
> with your ..._defconfig version (or just copy ./defconfig over).

Oh, right, the tooling would know the proper order. I just sorted it,
but I forgot I had wondered earlier how things were ordered. Thanks
for the explanation.

Thanks for fixing it up.
