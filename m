Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1A22652A2
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Nov 2025 17:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762190734; cv=none; b=DRWldzFbYtIt6A4haNW3jL58Srzcl4oU+WfaqU6EWvweScEXgjqr/mifBcVB+RuqeAqxrKwRH5m5T1Rd68G1DOYLGzzQX7AJMQYGT8KoyGrXiLP9gyejLXsiCKAI+FDJk0uAXxL/9HzxjI7ipgpl8fqu4lcwU8KBJy0AMUwxwFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762190734; c=relaxed/simple;
	bh=ShYSy5BSx6geRfqq0/FuAfWb9E4j8pKwfWu/7fp0HMA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=CiKLf7iOVE28oq3It5JxMkmgN68PE683ji0GhU/ptOQnsvL8/rHd30WaaA1i1dheO91YapAZy6iKywgsPQftTjWSdKh+NCwmna88ibOkrmgFZU6hCtFsyPh6p6Be8V5MgXe5O2+YSxqzv5Yz6MY1A/Ncm0ZcLtPHtOQOwpYcEEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N5aZuA7o; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N5aZuA7o"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-29558061c68so21826285ad.0
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Nov 2025 09:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762190732; x=1762795532; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XPHJrg1tQ1NkTo8g9sWWb+swWIIA44ePHL2JtASctD8=;
        b=N5aZuA7ow+oKf/C6XyY7XHZfUTh976pEndlyAVej9elAOJKK1cbzFid8Sc5beeC1fS
         ivGElCACGQfY1ONbXzk8/L9t9i8MptQ8L8w31o8iXMKWAamsxtnObj/DPMaZZYvAzBzu
         PsOArJ6ZHylkcl53Pdg8QIdAPNG2KFrWa9t70ZbUqj8m94ZIxi4vRqmjR2XlBVN5bk/e
         0hRbrc9O+OtewCNgMVXUTMFGe9tRL5FSQNJNOlbIpx6+qs2ZM7OGlYG3dkhk3blbZfGI
         1lZslWo62H6asH6rKj7E3XxRCN8Bd9JGeo1QvHZyb+A26FPTDpT9eoUiLJY4y9YX4XY8
         DgBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762190732; x=1762795532;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XPHJrg1tQ1NkTo8g9sWWb+swWIIA44ePHL2JtASctD8=;
        b=Shfayaqj/h7sP2KZOMYdJSjYwN9lcB5NNbzgsYZsRvgGLCyutDmaSTQx/LYwH77UH+
         CcDr0XVftpR2Q7CfVCp9W7RjTP2QGogwvoCtEhr92+a5tfeyWX9OjH+AtI0uPC8cuYH9
         x8Gr0swhkNLxPOz/K6zu4DlkZqJTqz8Rdz81gTXTap31F5GOVS4Zp5jpsfrpNlav15em
         6nn7AbYIKpR9+uuGQizYlamMMkIoIEZtZlN+vKTA1h5Kry4i6PNOwpO6rq13MTfz0wKR
         Runv8tGC8WRh7F0K3SYr5VjG562dw8iw+jjO40pvSpMtGsR1saedtyRL7ujazq9QASM4
         +U4w==
X-Gm-Message-State: AOJu0YxS6UFN6yvdt7aGv4/2I1u//b+EUq7D+R0rBYeSpVcVcCJP9YgK
	FmztvmGkS3xX6GpaUmJJh5ZxkXoUXo9W7l52iXyDBMOTYuq4uO/vVnttnQvGZjlN8k+yyjEewpS
	soMk1PHoRNMHe/vI2aLBbtS3/GdStDBK/JgsA
X-Gm-Gg: ASbGncuzA/DVXXaA3I4RJNgCefCpAhyjHvX9AF1EosuuOTeHtgqjmoV+y4H9FgXC70w
	gA82MJJSuuGn8D/WiwjNDvS7q91WfwTR0n5keeflfPPj1hi4QfzTJtt5TZrpzqaesOUjpFE5TzN
	UgZ/En/rIEbtL1DlpucnUSC2X9miiYF5TdL9E/J/YTO3j8tDWYuTNYNdbF1twJWP7jeJSWkMlFC
	QQtqeo9EKpJ8UrJ0i1+ts2gYX4Vvg0TKKWjo4BbJPoeNeEzaV3zq+Rbb7hwLnGXjsAQneju8YPp
	sTOx9fBSVnOuLh7IdDBcKG9owFM=
X-Google-Smtp-Source: AGHT+IEOA0zyuYHh4V+592n+xVHTta1O/vB+KN5p4LbNNZQqy+FmzS66HdRI1mFW8ddklxawxRg6AXqyJSP1TwLGsqg=
X-Received: by 2002:a17:902:f60c:b0:295:9cb5:ae12 with SMTP id
 d9443c01a7336-2959cb5b349mr64543625ad.25.1762190732516; Mon, 03 Nov 2025
 09:25:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251021112013.2710903-1-andre.przywara@arm.com>
 <20251021112013.2710903-4-andre.przywara@arm.com> <CAGb2v67UFUAKz7tWV1b2YtANBU7a9b4KRb1SOOs=bxM4DBPwPw@mail.gmail.com>
In-Reply-To: <CAGb2v67UFUAKz7tWV1b2YtANBU7a9b4KRb1SOOs=bxM4DBPwPw@mail.gmail.com>
From: =?UTF-8?Q?Horv=C3=A1th_Csaba?= <horvathcsabalaszlo@gmail.com>
Date: Mon, 3 Nov 2025 18:24:54 +0100
X-Gm-Features: AWmQ_bko6D1Wtd3DQZYUI2TBxLhAV_XeG_jbLih3qNVqVUTKkX_W3p71eOqpggo
Message-ID: <CADGuG07_iZ3UV-dJ0P1oXCPcdmDrp8Zq7AOed7wmFORWbZZkHg@mail.gmail.com>
Subject: Re: [PATCH 3/3] regulator: axp20x: add support for the AXP318W
To: linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I have a problem with an AXP20* regulator, is the support OK? I have a
Colorfly E708q1 tablet, which is theoretically supported, but i cannot
set the voltages and frequencies neither with the latest mainline, nor
older kernels (device boots but stuck on 1GHz max frequency). Can
someone please help me sorting out that?

Thanks in advance :)

Cs.

On Mon, Nov 3, 2025 at 5:55=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> wrote=
:
>
> On Tue, Oct 21, 2025 at 7:20=E2=80=AFPM Andre Przywara <andre.przywara@ar=
m.com> wrote:
> >
> > The X-Powers AXP318W is a typical PMIC from X-Powers, featuring nine
> > DC/DC converters and 28 LDOs, on the regulator side.
> >
> > Describe the chip's voltage settings and switch registers, how the
> > voltages are encoded, and connect this to the MFD device via its
> > regulator ID.
> > We use just "318" for the internal identifiers, for easier typing and
> > less churn. If something else other than the "AXP318W" shows up, that's
> > an easy change, externally visible strings carry the additional letter
> > already.
> >
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  drivers/regulator/axp20x-regulator.c | 170 ++++++++++++++++++++++++++-
> >  include/linux/mfd/axp20x.h           |  43 +++++++
> >  2 files changed, 211 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/regulator/axp20x-regulator.c b/drivers/regulator/a=
xp20x-regulator.c
> > index da891415efc0b..1576bf4178f8f 100644
> > --- a/drivers/regulator/axp20x-regulator.c
> > +++ b/drivers/regulator/axp20x-regulator.c
> > @@ -138,6 +138,15 @@
> >  #define AXP313A_DCDC_V_OUT_MASK                GENMASK(6, 0)
> >  #define AXP313A_LDO_V_OUT_MASK         GENMASK(4, 0)
> >
> > +#define AXP318_DCDC1_V_OUT_MASK                GENMASK(4, 0)
> > +#define AXP318_DCDC2_V_OUT_MASK                GENMASK(6, 0)
> > +#define AXP318_LDO_V_OUT_MASK          GENMASK(4, 0)
> > +#define AXP318_ELDO_V_OUT_MASK         GENMASK(5, 0)
>
> > +#define AXP318_DCDC2_NUM_VOLTAGES      88
> > +#define AXP318_DCDC6_NUM_VOLTAGES      128
> > +#define AXP318_DCDC7_NUM_VOLTAGES      103
> > +#define AXP318_DCDC8_NUM_VOLTAGES      119
>
> Upon closer inspection of the helper code, these aren't actually needed.
> My bad for introducing this unused field in the first place.
>
> [...]
>
> > +       AXP_DESC(AXP318, ELDO4, "eldo4", "eldoin", 500, 1500, 25,
> > +                AXP318_ELDO4_CONTROL, AXP318_ELDO_V_OUT_MASK,
> > +                AXP318_LDO_OUTPUT_CONTROL4, BIT(1)),
> > +       AXP_DESC(AXP318, ELDO5, "eldo5", "eldoin", 500, 1500, 25,
> > +                AXP318_ELDO5_CONTROL, AXP318_ELDO_V_OUT_MASK,
> > +                AXP318_LDO_OUTPUT_CONTROL4, BIT(2)),
>
> eldo4 and eldo5 support operating in switch mode. We can model that as
> a bypass mode control. See the *bypass* fields in regulator_desc and
> regulator_set_bypass_regmap() / regulator_get_bypass_regmap().
>
> The rest check out. But also see my other reply regarding the 1.54v
> threshold.
>
>
> Thanks
> ChenYu
>
