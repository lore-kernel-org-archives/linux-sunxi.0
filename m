Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A0121C165
	for <linux-sunxi@lists.linux.dev>; Fri,  9 May 2025 14:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746801013; cv=none; b=bPZcwHsp0+a6NXD9pYadnyhmizcxc/6Bcvjc46aWMfhjDjTuVdly1Nn1kC37vu8Weo86tBE2abaV1VjnxzS5SrSyFD4a1yxZOeA/2YHOnwOiS0Em9UeiDiyjmGWQ1YCG9d6hn3Dbs7krLcsbetm12nahvJuFj9+uV76cIByjXoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746801013; c=relaxed/simple;
	bh=vNvlyezxHft2rpglSMwbSxfJSSvIPWQDrGafo6IrV2A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KCLlagyIifEBqeeOSuX2BsE7ihIRInhsvYvVrl8RumjvYS6MgkwvyTwNVnvyUPRfCbv2y5Q4ErBlRjT7FuISGYgpgPFhaB4XYJ62yKxkmQNGXyf5IefsljBqeChvbm3TyJBA3UmsYfgkDzV3L23E2dIL0lGXtYuWvO3OLsY1QLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30f30200b51so23902691fa.3
        for <linux-sunxi@lists.linux.dev>; Fri, 09 May 2025 07:30:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746801006; x=1747405806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L6HNDVpBlroLh+j3E6orAQRVPy/hUZu10Ujgmb+3j10=;
        b=TWpBFfVaNHJnHVfZioWqIZMXIWHTbDGZRiOye3ZDuXc9yZecjKjQFNBt2jJhPT3IGC
         rwL+jlzLLNatmuqO5oUa5zk60Gv4cN23Vb41wZzE6tl+c/VtBx2iHHse8WHdoqfGzP5t
         BkjBQ5ibiTIxBB0v9Jac7hcLRwGMGqlVJ6RWCqD3qeihvJkhTC72DZYL2mGHqifd49JM
         BkYdVOO9ATRqeMWcq2ET2iQtcdETeEp52l7FUcJBr2cx2jwFPoYdptocC+p/e8lghOAT
         SpS5cKtIY/b2SplPiWdNw7F65JejeHL6KXVbzJMxVZMuCbilSlQCvruBLzZ6oqRGLWhw
         tPtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXuRNIoGI9v5afg6+pamU1NSo8EAOuLyx+HKLtlJMzyqGdsVFZ2keYfvD5twhEVgHfCOwWZbPRCGXwuA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxIA/1kz3g+Y+nUWBn8kdbb11NOH27ZN9oTLegkNLqaNztbLSqE
	7QOpllTxSTs+RV21M2zPWpuHzlFUZuwBK5Na+Cjpl5b+OR6j73LqIRImflMV
X-Gm-Gg: ASbGncu8eYdYkd8UCG9y1mPH6I6yLc6iL2mKuPvkYKheMJ3QJfLa/PhgbsgoJyv60QE
	iwlFSBDkNiK+GaqQNn3DHW+OeJ9ao8zUTlMh1SbskceNRTc5v5gcnsoIxWvn76KxZNht8+H4eVa
	LFVmGtrkJLX75d+O4LUVE7WAKl5oDYMkIxo/NBmCf0d0z5Z6XfCgUZbC2/UMikfN6MmtDigG/qc
	uNJNCaecJ9PD7Jgt+5vZ29jMu6nlATlUmNJaOc7478JaxEqm5kmbm7Irro8zU/BCozCsKhlAYMl
	n4nsQCYWXXXctO3rUN4wjf6f0/OAhINH+2jmDISl+X0d0/aQtpUrsMfap4IjOLrRvUttEyhuBg=
	=
X-Google-Smtp-Source: AGHT+IF3NI64tr3CNFlrLSII+vowfrV7C07WSgQyQlGyv+dlN+AVL/3aopHoxImDcMnw6DUppm6HTg==
X-Received: by 2002:a05:651c:3226:b0:326:bede:ea46 with SMTP id 38308e7fff4ca-326c45ab7b2mr15864331fa.20.1746801006098;
        Fri, 09 May 2025 07:30:06 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-326c33b7c1bsm2724221fa.35.2025.05.09.07.30.03
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 07:30:04 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3106217268dso19758571fa.1
        for <linux-sunxi@lists.linux.dev>; Fri, 09 May 2025 07:30:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX7Jt92unUHoMNIgEX2UEJnamcrilUNDxpU0PNZX7iFXOptVkYwn61x1llyDwVw2G0MMvISndWz6kBIAg==@lists.linux.dev
X-Received: by 2002:a2e:a542:0:b0:30b:f15f:1c02 with SMTP id
 38308e7fff4ca-326c45a7873mr15824391fa.18.1746801002903; Fri, 09 May 2025
 07:30:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250507201943.330111-1-macroalpha82@gmail.com>
 <20250507201943.330111-3-macroalpha82@gmail.com> <20250509151448.3191a3d8@donnerap.manchester.arm.com>
In-Reply-To: <20250509151448.3191a3d8@donnerap.manchester.arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 9 May 2025 23:29:50 +0900
X-Gmail-Original-Message-ID: <CAGb2v65ZhA3_pdgbq9aVdy-0rQcTNfrHoE_AvJxOvin0a6tnMA@mail.gmail.com>
X-Gm-Features: AX0GCFvJ_vLbDqqJ-IqQuPGDdkvp9YHoqLCtAkJwkmoZo8ZiJNtlDsE7n8dATBw
Message-ID: <CAGb2v65ZhA3_pdgbq9aVdy-0rQcTNfrHoE_AvJxOvin0a6tnMA@mail.gmail.com>
Subject: Re: [PATCH V9 02/24] clk: sunxi-ng: h616: Add LVDS reset for LCD TCON
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chris Morgan <macroalpha82@gmail.com>, linux-sunxi@lists.linux.dev, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	ryan@testtoast.com, macromorgan@hotmail.com, p.zabel@pengutronix.de, 
	tzimmermann@suse.de, maarten.lankhorst@linux.intel.com, simona@ffwll.ch, 
	airlied@gmail.com, mripard@kernel.org, samuel@sholland.org, 
	jernej.skrabec@gmail.com, conor+dt@kernel.org, krzk+dt@kernel.org, 
	robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 11:14=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> On Wed,  7 May 2025 15:19:21 -0500
> Chris Morgan <macroalpha82@gmail.com> wrote:
>
> Hi,
>
> despite the slightly ill fate of this series, I was wondering if we could
> get the non-controversial clock parts for instance already merged, to
> reduce the number of patches and mitigate the churn with dependencies?

Sure. Are we expecting any of the DT bits to go in this cycle?
If not I won't have to split the DT header patch on a separate
branch.

ChenYu

> > From: Chris Morgan <macromorgan@hotmail.com>
> >
> > Add the required LVDS reset for the LCD TCON. Note that while this
> > reset is exposed for the T507, H616, and H700 only the H700 has
> > an LCD controller.
> >
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > Signed-off-by: Ryan Walklin <ryan@testtoast.com>
>
> Matches the T507 manual:
>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
>
> Cheers,
> Andre
>
> > ---
> >  drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi=
-ng/ccu-sun50i-h616.c
> > index daa462c7d477..955c614830fa 100644
> > --- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> > +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> > @@ -1094,6 +1094,7 @@ static const struct ccu_reset_map sun50i_h616_ccu=
_resets[] =3D {
> >       [RST_BUS_TCON_LCD1]     =3D { 0xb7c, BIT(17) },
> >       [RST_BUS_TCON_TV0]      =3D { 0xb9c, BIT(16) },
> >       [RST_BUS_TCON_TV1]      =3D { 0xb9c, BIT(17) },
> > +     [RST_BUS_LVDS]          =3D { 0xbac, BIT(16) },
> >       [RST_BUS_TVE_TOP]       =3D { 0xbbc, BIT(16) },
> >       [RST_BUS_TVE0]          =3D { 0xbbc, BIT(17) },
> >       [RST_BUS_HDCP]          =3D { 0xc4c, BIT(16) },
>
>
