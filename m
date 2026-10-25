Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792937944;
	b=M3VItFZNm0nA76oZvQ47IninXZJl3MENUlIvZWnjr2DEFmnor0OqaCg97YbxX6379/Cu
	 K2TS5JaBu8Fm8DS04jFI1nEIXgOAfNUg8irQhZIbhQzJBZdwXrS35wqeE3zzfnqFiS+9g
	 8frICQ7GJDy3phTa4BhvmVbltIVVrKAD1yh0OqgETJMfaPV1dQKB+JfCW3L02yL385iti
	 xRWOp9BYSW3WOMbXEFOE4KHGKTuwRvbz/Wfcbx3hyTIt4kZVYKiZAPi1dRFM+vk8/ORKE
	 GBruVfRqhr6Ob0fWVx93EyVdM7ioKaJ3a1r2huLx5LhDfzTzpQ1mSND7pAV3BBLK9TQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792937944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TZluPrXQwqjXtBahn5BT9paHFwK9CvKp93YvhUt5EeI=;
	b=aDbZUxZqAhpwQx/UH5+sf4F7QNrpU8T2zmR3WzDB1QbruFI0nqa/7uDJlAQf5gjucgYo
	 3BlC9zdR+ea9b0n6ke0+sZaABVC7m/0iU76jOdUfen7Gizu+mzIBSysMZLcEI6WwNwZt1
	 VQiYTFPm8pbm7diC9xroWDEV9LvaQI5LY53A/AFzL9zLZ6/mWx1VHnMOfY4GCsBVOH/4K
	 ttOBVQi96EG16rvaanJZKqODyOpApDPrAoJ88yT3zztNeAFMu9EI2Qc3/PhbLEu3Rtu5l
	 4N9n2LPzYUCxBQsTEpYmHUsOeOk9quQaL79+Tkx/cr4wncdlTjJhSocUOpvqys4sdog==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TRWsl8LM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE795606A324
	for <linux-sunxi@lists.linux.dev>; Sun, 25 Oct 2026 14:19:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE795606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TRWsl8LM
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e9ae391a05so14902085ad.1
        for <linux-sunxi@lists.linux.dev>; Sun, 25 Oct 2026 07:19:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792937943; cv=none;
        d=google.com; s=arc-20260327;
        b=oVvovyV+yN7IuX8GBn0EzBHPIbzwUdWapyEhGiyTHsWexJs8qg44H7/6Mz5zo2CFpb
         Eer3YmRuHmp6spkWzMQ/yqc2KLcpF9MfeOiAEp2DlUQTyqvF34vGmg9rn6t9E6vpYuGn
         knQc/pEx4Q0K53PaOulTZB/s9M1zqhpjBIyYX2tksbpUPiZ9JPlc4bplyI7du+d1/agC
         ZEA2oncVsqTSPd9BdK7I5vF7SIfeQOOOCekeAI04FuuSnBToWtlD4LM+orNdASDFy2uJ
         bfjrN9VPSKn4HCf0irl4i5b3fikgoo42J4vvYSX6U2o9Dc0JER4ZRbjA9gZ0Ny1+z8u8
         ngIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TZluPrXQwqjXtBahn5BT9paHFwK9CvKp93YvhUt5EeI=;
        fh=oL7RFLgRDTl43mCOUq3bIhDQ9zBURO4irDDWM4Y8XlE=;
        b=QONM7Y1e6Aj9fFJNrSoaa6jkoBltmAitZJZaenI4ekap7N1iZifPkwdp18PCAO/Koy
         z3fTMIdNzhlQPvA1d5IhzGHVaCiPyXTobM16P64ClaoNoCQ0Uuo+7zDdQW7lo3uq5otc
         QiZLvLdPoebohuf+4lFLQAd10ghepl/w41jNGxPJw7nH33HkEnEso72ZxMa2gMtaLbT8
         GUkIfMoxTKtyZpth64yqxSMYrze0Cbw2S2DhMPT0u7gBng+bQD99pgxhmlCgaC0aze8c
         Bdh6r5t4iz6ZTCYxj7Wy4+OhEDntbUKqTC760nllWpDZFnw0EQfJkD0PcUBT7kPZe2iH
         CvlA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792937943; x=1793542743; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TZluPrXQwqjXtBahn5BT9paHFwK9CvKp93YvhUt5EeI=;
        b=TRWsl8LMavinb1cDU5x1ZNgYTLvZfMImbOFH+TY/DCVt97NMfhtbudoJ7+Wwi86KTV
         ebMdsI9sDivoSxC2RlEy87HNPXt+DyerIf17gNO5VgVGkzTeCzdQcfOGMLtDm0TqavU6
         1T+IjkMxflZTD99SyhRTkeYQHg/RkU+7An31aznRbR2JyjMSgOpql1KGVsvf/421NUMc
         VVUmp0TAKWEGSlk52FSstTXF4zJ2Tmb5dlXl+PokuPhxXG6ppudWv8FJ+VRc7rp38qPE
         W9hJEYZKwAg2dEWLFT8fyZUmwgUFPZQt7tvSPOM9809ZmOGnZA1NISP0e4DvgJ0oC2+2
         I3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792937943; x=1793542743;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TZluPrXQwqjXtBahn5BT9paHFwK9CvKp93YvhUt5EeI=;
        b=yjL0dI5CTn9yGkSPl9Guy2XKWgLkMEhFIZX0r1Q8JHN3G9zTUnyBbOEz0VC6DsbdYJ
         949Q0DnsMgGamjJWLB0eetqjWB47l0bP7YKr3UXv/RPlRYFnwWvQii83UDvSeJqI9Mj/
         BQfL6gjCuBvdRKiieQUXd5cuMHqTD15rZN0U4nZ/xaHgUUAckUM0GhHgwHUwcvBW/EUf
         p9R7TK9jfv+B+xNwS7M/zLTdJwFWZLVSrwilIVyo26KcYG7TJtP2n715s4h29HDilT2H
         FHxc3lM2gwVOwhVBAJ/dCVzHM7yTVyqR3NyPEh2RSDUkQMY3PPg5RLrwbtzT3jgRXpRA
         U2ZA==
X-Forwarded-Encrypted: i=1; AKwUvByV7HzRpyF+kA4P4N8jkZsiPx4TUHblQvO1BI3BTZnSNv1iD0+J5OHSimwuHdMIiyM5JoWEb7y2iueSKQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYLn0w2c2RTmOp7f4ONDmoMDMfgjGH4QtUN0li3wOTr84K7KSJoM
	RBW0PaE/ohPvDuLnHxBUqSICgWSgdUyGhRie43kRlOeQZaBy2CXBnYVZNJo+HgDsXzoYpdxXdCF
	kzHskR8ydXcXd/PuwaTG43xZ0GmXzAdU=
X-Gm-Gg: AYBFou3Fl7gGnI5D8Y6XCPgQXf4IVKCll1G+l7NUPJUXFnKU/GR73Z1vSmXBUwklEpv
	cU9zo2SyRJIfmCK6ifXstfm7ub5/vXXKGKuqkXc5IXaBRhQhNXn66iJj7AMFGG0bl/4bPTmDWAt
	Xq0mDNYW+VHeKhEYn7RCGy4EuW97ulA3CftfRK6Qk7OB5YYztW4FS85nRUA8rV18yhhhmv9/Ll0
	UIUbMuV33wfIJjj+l9v+elUJcfNtg9hUVClqFks/AaTNyWiFZ/V5c33h690sVvQqyC9yiroayBd
	NRr4aEisy+8/BufvNYodhAxcupQ3jZZ47EnxLxBD7682aCYVTa1kt/EbAU5kcyIYgELnlMz8wuB
	HG/OK80N383OMCBi/+hFmDTS86HwccaACv1W5kvkg6tHhT9PqMLZs
X-Received: by 2002:a17:902:da83:b0:2e9:5d1f:dfee with SMTP id
 d9443c01a7336-2ea9cc412dfmr26382595ad.25.1792937943129; Sun, 25 Oct 2026
 07:19:03 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261025135745.102970-1-pmazzini@gmail.com> <20261025135745.102970-2-pmazzini@gmail.com>
 <sashiko-outbox-184239@kernel.org>
In-Reply-To: <sashiko-outbox-184239@kernel.org>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Sun, 25 Oct 2026 14:18:52 +0000
X-Gm-Features: AclHuK9uayK1Q4Gg7-cQO0yGAiMLLbnHiMvUXBCuYd6DT54wbPEG5TiYn0ObdR4
Message-ID: <CAAxh=jsrVwRfdUKdGxJ_5riNRiyCmVpTzQkg5W0ALgtPHRNuxg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] pinctrl: sunxi: dt: number the IRQ banks from the
 first one that has IRQs
To: sashiko-reviews@lists.linux.dev
Cc: linux-gpio@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'll fix it there in v3.

On Sun, Oct 25, 2026 at 2:08=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] pinctrl: sunxi: sunxi_irq_base_reg() ignores irq_bank_map on A73=
3
> --
>
> commit 1d99efa95c547fd409284e1974176bcf35345f69
> Author: Pablo Mazzini <pmazzini@gmail.com>
>
> pinctrl: sunxi: dt: number the IRQ banks from the first one that has IRQs
>
> This commit updates prepare_function_table() to number logical irq banks
> starting from the first bank that supports interrupts rather than bank 0.=
 It
> also updates the irq_bank_map tables for the a523 and a733 pinctrl driver=
s to
> map logical irq banks 0 through 9 to hardware banks 1 through 10.
>
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c b/drivers/pinc=
trl/sunxi/pinctrl-sun60i-a733.c
> > index ca82f08a3a65b..3ebe926a1bc6b 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
> > @@ -21,8 +21,11 @@ static const u8 a733_irq_bank_muxes[SUNXI_PINCTRL_MA=
X_BANKS] =3D
> >  /*     PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
> >       {  0, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14};
> >
> > +static const unsigned int a733_irq_bank_map[] =3D { 1, 2, 3, 4, 5, 6, =
7, 8, 9, 10 };
> > +
> >  static struct sunxi_pinctrl_desc a733_pinctrl_data =3D {
> > -     .irq_banks =3D 10,
> > +     .irq_banks =3D ARRAY_SIZE(a733_irq_bank_map),
> > +     .irq_bank_map =3D a733_irq_bank_map,
>
> [Severity: High]
> Does sunxi_irq_base_reg() actually consult irq_bank_map on the a733?
>
> With the change in prepare_function_table(), ports b through k on the a73=
3 are
> now assigned logical irqbank values 0 through 9 instead of 1 through 10, =
and
> a733_irq_bank_map is added here to map those logical banks back to hardwa=
re
> banks 1 through 10.
>
> However, a733_pinctrl_probe() sets SUNXI_PINCTRL_NCAT3_REG_LAYOUT, and
> sunxi_irq_base_reg() in drivers/pinctrl/sunxi/pinctrl-sunxi.h handles tha=
t
> layout without calling sunxi_irq_hw_bank_num():
>
> static inline u32 sunxi_irq_base_reg(const struct sunxi_pinctrl *pctl, u1=
6 bank)
> {
>         if (pctl->flags & SUNXI_PINCTRL_NCAT3_REG_LAYOUT)
>                 return pctl->bank_offset + bank * pctl->bank_mem_size +
>                        A733_IRQ_REGS_OFFSET;
>
>         return IRQ_REGS_OFFSET +
>                sunxi_irq_hw_bank_num(pctl->desc, bank) * IRQ_MEM_SIZE;
> }
>
> Because the SUNXI_PINCTRL_NCAT3_REG_LAYOUT branch multiplies
> pctl->bank_mem_size by the raw logical bank index instead of
> sunxi_irq_hw_bank_num(pctl->desc, bank), won't all gpio interrupt registe=
r
> accesses via sunxi_irq_cfg_reg(), sunxi_irq_ctrl_reg(),
> sunxi_irq_status_reg(), and sunxi_irq_deb_reg() on the a733 ignore
> a733_irq_bank_map and access hardware banks 0 through 9 (ports a through =
j)
> instead of banks 1 through 10 (ports b through k)?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261025135745.10=
2970-1-pmazzini@gmail.com?part=3D1
