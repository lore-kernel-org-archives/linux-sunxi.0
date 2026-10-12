Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E1E44CACA
	for <linux-sunxi@lists.linux.dev>; Mon, 12 Oct 2026 08:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791795429; cv=pass; b=uGy3UAeAEGCQxaJ3Q2jrRy4EkJ0hy7KTAvlNjHmGUeRZe8ENWS6UWxTB/Fq5mkxEG8A/GKM3KJUm17yzD1A9s2ivm9kQYxkQA1VRA9XXTlcohvnY+8AeC0rZiPshL2utV4yyeEJs40mB9ehQWIAWpyim0GRS7QKCdBW+i58b7F8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791795429; c=relaxed/simple;
	bh=+hsanqcaRD8wERt3PKwcrFG5KTWWy58uIS8hjI8nI1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DLzd7ZrDb/eUBmUfLgNg8HesrveIPB4GHuRrH9/u6XN5gkSPuf9IUBf6HZVpem9wDjpiEkKFBmo0QvBr3KqsSB+qMGYLuWKcbBeCNtsB3NZXoxnoTSt/V72Bk2ynpxFG3cU8vXhSdYezF4DpP7kYof4v2A+UhV64pfRlxjlAvjY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h7ZFytjP; arc=pass smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h7ZFytjP"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7c02791cadcso436545137.2
        for <linux-sunxi@lists.linux.dev>; Mon, 12 Oct 2026 01:57:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791795427; cv=none;
        d=google.com; s=arc-20260327;
        b=DM3W1DxeGf3YpOLvUyyyZKYDT8fBJ5VRomioOBhQFE13CWOum8hZXynSufmFluyqGH
         hvgeHDWpMrGxt0QitavGaGCfq6ZTv3mddjUyWJvWG3BO1BT+Xr2m9YFAzKRhmCalrfn/
         1+oP6W17PWP0XFiAyeuHArdwSQ6/YCLyu4ujGkyK/mfQ3uocqEsggaryDqr+EAL2A012
         TuWkXj/EfHACVmGaOqcWxe7bWYAeCXQtGKFTt9mi86r1M7WFNN/EErx8/0GQuCuayKr6
         PaiuvpVch1VaxuBBGOsWZM5hmwn6RG5dvPrDsH2PMUcKoiFcSspTuR5A8mqubbd0yRM1
         Xyfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+hsanqcaRD8wERt3PKwcrFG5KTWWy58uIS8hjI8nI1M=;
        fh=U9m2uzZbRg+syEtDwMktn6LzkpR6c1dkni8Xoa6Q4pY=;
        b=ZCsK/1f1EGUToHZyKmhN6s0bkXkG93rG4vcKv8GuhGovvoa3xKSx6CROZ+4sAhX5eT
         kAW1hs/qnPuzxyg1dc36nAGyImdaP1621pLGVzvm6Xvg5hh/uwXQJsvUizgzrGuuVx1O
         dBVgHoOaiwXD+4RyYvTDRAfA0dZSWK2xe6pfwOiJ+E8qiXqeJVJ0pJoSO8E5V3fKnR5i
         VDjmUzZ3hQawd/3RuSpqno3A48gpufZcFcnE2MAeg9YLtbxUj07YwRgEdmqbXE/OZVqE
         95T/j0ZFnoDFsScMhAppO8iqdcatOrLbEMqNEFEewm1gyl7DUjeZkeA/85lnLPwjjEux
         9Wbg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791795427; x=1792400227; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+hsanqcaRD8wERt3PKwcrFG5KTWWy58uIS8hjI8nI1M=;
        b=h7ZFytjPTTGN9KG2M6xRO0vpqPEcoXJlFJuxkR0HI0/zLAfJGQNWrGbPw7BAAPnOVM
         TqQMTNCjKWTcK+seN3sEBWJsEfrbvnZQzu+G4h3fZMLizipaEQ3NLp4XSMu0sQVdL76W
         oMenNO0GP1uxHoURnV/RMwSnS56rK2CDrzk3YubgJKO7FiuBN0VzL+2Zb1F2Xg3Tq4sE
         sRCiOok4zUxhAKhJhvLhaGBWg5AfG4dMm86UPiZZR28qrZjh7fSeeswf/ZwmSOAVyki1
         GnYJchql34jVWJZjMfYRro3FS8NzOJYR9gmum1TGukxuHsAGXO3J14PbyEjT88iENXL0
         e14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791795427; x=1792400227;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+hsanqcaRD8wERt3PKwcrFG5KTWWy58uIS8hjI8nI1M=;
        b=MwOcUHKWNXm3wQqS1efFesaJXbfvze9RMx7DWDaZfCWXdpsGVbSTQUN0dMJSQMRCuP
         WLE/qolebp12sKgqNuekQKbuAn9GqfhX0+I5EtjnLEP29nZxeMKV1/hjSG+IJOXBx10s
         ivjDRCvQLVbWIrJ7eKQbW74PWd5yeEAI1XH+f2OJPbxkAPEaeiUTBIAAJ/b3w/h0q29q
         j7zkJmf4SqKQlIJmDVnSfZViuAk2TYxp4FaBGqBTs0ytS0d3gulhZdEtKJAF6LKADnS3
         fD+1pVMIIE+OVLdlMSbHSgzCvP6Vu4sFri/bWn5pW+rCcbqPaxftDyxFHZFS6KwFvhfK
         kBhQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0EJ3jRB8HRyHmIIfVAX4AjFJh4bLQG9SIb6ppqQMrZrw/JRSHu7jubu5+jHa1R98Fy0Y5QAtFrYcfIg==@lists.linux.dev
X-Gm-Message-State: AFq9FYLyjJgMe0PRZ2AT0A/bHr++GweRf+4VsTOD0TN7MzrxfQAyDJLa
	1noaDSQ7t7sR3tSImu6nXTv/4EHLsRT41OSuK3t/mqc8NBOltgwFtoCnlQdb+eQeCBeDdVylpr0
	eBRSk+f4aYBIiv7tmt2RQbkCzY3137y4=
X-Gm-Gg: AYBFou18IK2yRfJZxQJ5emwbpDuIj/pavdyw0fzX2ma2fg2zMP5PP1NRAE51Iawg9+X
	OvVgbMqqebWC1gzkKgUaYtkjgg6c4Heesx7wKLNP6CswTRKlshtQpNUNieDTrpahn8BawDNCdgI
	VZEziLkTYXWzKCEZCpjdBrujSO9EPTKNWllRAh+31co4WZyqQ6FQj2rl7gm93AhTNw1VgwhbG8s
	yYeVpfHE9L+zJ4Miqr5Plcw2I7tIFyiqQ8b4jHWe54aYPvpgQryqSSAMlpZ9iIyyzMvxrMU7Zj1
	o1UddXY1+zoyQkJ+8uXSDqiv4sILVXlTf1/7fI2VFCBdZDUPf2mhjQgy4btnwg5yGJCJxOJOYtX
	X+cO5W/M6HfGByI5FhLM1PRVZ2Eiz7qgHmuAN5Pm6Vekt+RDX0vlmyvIAdGyyrgNzCfmlx0Dc30
	0c9Dp8G1GTl0C1aW9mXwj1r5/xK0d5Yc0/BbInR+0RD0W8
X-Received: by 2002:a05:6102:80a3:b0:7af:4843:5ec9 with SMTP id
 ada2fe7eead31-7cb3728268emr2044842137.8.1791795427219; Mon, 12 Oct 2026
 01:57:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
 <871p9v4a1x.fsf@bootlin.com>
In-Reply-To: <871p9v4a1x.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 12 Oct 2026 02:56:55 -0600
X-Gm-Features: AclHuK9PgSRU-9yDfcYymMtt4yQDEEGqg1HXAOlwk0cudjnkkhK9ivdvdn9hMz0
Message-ID: <CADvTj4pZEH2wj2aHSL+S+jO-MeFjRx+XMqhv+XGLiiukvf28vQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/18] mtd: rawnand: sunxi: support the Allwinner
 randomized OOB format
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Richard Genoud <richard.genoud@bootlin.com>, 
	Masahiro Yamada <yamada.masahiro@socionext.com>, Boris Brezillon <bbrezillon@kernel.org>, 
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 2:06=E2=80=AFAM Miquel Raynal <miquel.raynal@bootli=
n.com> wrote:
>
> Hi James,
>
> On 14/09/2026 at 15:09:46 -06, James Hilliard <james.hilliard1@gmail.com>=
 wrote:
>
> > Allwinner NAND firmware leaves the bad-block marker in the randomizer
> > data stream. On H6/H616 it also places all protected user data before t=
he
> > first ECC step. These choices differ from the mainline format, which
> > keeps the physical marker plain and maximizes the H6/H616 user-data are=
a.
>
> [...]
>
> > Assisted-by: Codex:gpt-6-astra
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
>
> I am sorry but I do not want to proceed further with this series.
>
> Even though I am not capable of finger pointing what is wrong in the
> diffs nor in the commit logs, I do not understand most of it. I cannot
> clearly explain why, but I have had a hard time trying to understand
> what the commits were doing. The risk is that nobody would then be able
> to further maintain this driver and I am not willing to take that
> option. The kernel policy so far has been to ensure readability and
> maintainability, and my gut feeling is that this series is going
> sideways wrt this major constraint.

Just to clarify all known real world usage of these devices requires
the vendor layout due to BBM's themselves being randomized.

From a practical point of view I'm not aware of any way to avoid
this constraint for any existing hardware.

I mean, without the vendor OOB being in mainline it's likely maintenance
will just be abandoned due to the mainline driver being incompatible with
real hardware so that doesn't seem like a very good tradeoff. As-is the
existing code has received very little maintenance overall likely due to
this issue.

Is it better to have a more readable driver that's effectively non-function=
al
since it's incompatible with the hardware or a less readable one that can
actually be used in the real world?

Keep in mind the patch adding the actual vendor oob format support is
only 270 additions and 10 deletions and is fairly cleanly separated from
the other format handling via the sunxi_nand->randomized_oob flag so
I'm not sure it's really as bad as you are making it out to be in terms of
maintenance burden:
https://lore.kernel.org/all/20260914-submit-sunxi-nand-vendor-oob-layout-v1=
-v6-13-2fb084fe0751@gmail.com/

This code may not be the easiest to understand without LLM assistance
since the vendor logic is somewhat complex but since those tools are
only going to get better as time goes on it seems unlikely to me that this
would end up being unmaintainable and regardless most of this series
is unrelated to the vendor oob format and is just bug fixes or optimization=
s.

> Also, from a Linux kernel point of view, we generally just do not
> support vendor specific layouts. I already told so Richard Genoud back
> when he was working on H616.

Hmm, I'm seeing plenty of mainline drivers with vendor specific layouts:
https://github.com/torvalds/linux/blob/v7.2/drivers/mtd/nand/raw/rockchip-n=
and-controller.c
https://github.com/torvalds/linux/blob/v7.2/drivers/mtd/nand/spi/gigadevice=
.c

> With this added to the pile, I prefer not to merge the entire series. I
> can still take some of the fixes if you feel like they would be relevant
> anyway. In which case I invite you to send a v7 with just the few fixes
> you think are actually relevant outside of the randomized layout
> support.

Patches from [PATCH v6 11/18] and earlier are unrelated to the vendor
layout change so you should be able to take those as-is. I deliberately
structured the series to put all the bug fixes ahead of the vendor format
changes. The ones after are mostly just optimizations that didn't make
sense to implement before adding vendor oob support but for the most
part probably still make sense to add either way to some degree. All
changes
