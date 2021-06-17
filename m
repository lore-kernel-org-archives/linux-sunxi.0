Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9033D72
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Jun 2021 12:18:54 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id h12so2834526plf.4
        for <linux-sunxi@lists.linux.dev>; Thu, 17 Jun 2021 05:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7j6ui82C3Q+yfIJpsh1KXzxS70VcWmmv393YkvqCZis=;
        b=G861an8PtYU5auXGhG8k2swCfG9jZxnfO0wXUcvlpxtxvtkIo7i9XEs833CWUiGshA
         Hh6IAJUgmv8dHBx7cFyDVz5XP+3Odki7vDb1o1WorMofp4kRUJQnHld41KWid24BQCpE
         bAPG3sxef84fdRafJo/ska7qYaFsRVjQoSgFk7APUu6/oxYupIj0x2V5t23+56mtKRjL
         FmrODWJKY7pukev5bI7SPpFmKkfJ5wgE0Vux+p9UKP+6uOOV4dnvbVJ3W7O82ar8SUkV
         us7/GGTLw+l4UzZ3UJWQgSv9KEIYxCDSm0YzC0Fe31yC+pfdFv1VLMH0zhK8u0jQpS1w
         oKUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7j6ui82C3Q+yfIJpsh1KXzxS70VcWmmv393YkvqCZis=;
        b=iOV8VEteWIFoAilfs58SkTZ8etbFWOgZCfSpS5A8nUN/rP6ch1TRTvtfmSWOMSZnW5
         E1hTHH5BKQVXGwp4Kbobpp1nuXaQQ6olnZNUDIqK7Eypv/pK/0kM1c4GKADC/53xoWfo
         4oT+/aE7OC4EafVnIj6X8LhLDDY9HVKmuQHGRUcVjxGcpez3RZ/f8/fcitBOuGuJp9GR
         xFKVxWcGEnijBrGpmv7x7ZxjTDKvi0QsvlSERyYJJyWXlHWPDN7Gsn+OxEq0Zh71azIO
         6MtnFLmELH7C7s0kF66R+bE3SKNO3v8Q8T4h10mBsegkGH1WoNHPwdo/TyxD+6MbDG+O
         5NPw==
X-Gm-Message-State: AOAM533UFxntlTKQ1T2wX5l5vbGoklXw3tmGDoqEC+mW3ztuPVRplozn
	OP0RoYW16Z7TL7BmVdgw2Wmd1Ot1c1uemZUHlg==
X-Google-Smtp-Source: ABdhPJxaI//ySQM/6KClcEDFG8whdVkseChcSlm+tz1wGgj2pKzs5Z0Xx+xk3J0xI2gBrDLpboMGAhCMPZdcijM56bY=
X-Received: by 2002:a17:90a:aa98:: with SMTP id l24mr5343340pjq.156.1623932334117;
 Thu, 17 Jun 2021 05:18:54 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210615130326.2044-1-fengzheng923@gmail.com> <20210615132207.GG5149@sirena.org.uk>
 <CAE=m61-kHPeKNvEEc08w8DeUwssGPWNf5UaYojRPNZRJ0v=arw@mail.gmail.com>
 <20210617104828.GA5067@sirena.org.uk> <CAE=m618Gtx_RQ4+h=8+TFvbcuSTpNWVcx1bry+8OggL6uDCzfw@mail.gmail.com>
 <20210617120747.GB5067@sirena.org.uk>
In-Reply-To: <20210617120747.GB5067@sirena.org.uk>
From: =?UTF-8?B?54+t5rab?= <fengzheng923@gmail.com>
Date: Thu, 17 Jun 2021 20:18:43 +0800
Message-ID: <CAE=m618zRgqd8vP=ugyZv0RMcENY5ZCmznrFOR6SoovKNpMCag@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: sunxi: Add Allwinner H6 Digital MIC driver
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, mripard@kernel.org, 
	wens@csie.org, jernej.skrabec@gmail.com, p.zabel@pengutronix.de, 
	Samuel Holland <samuel@sholland.org>, krzk@kernel.org, linux-kernel@vger.kernel.org, 
	alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Mark Brown <broonie@kernel.org> =E4=BA=8E2021=E5=B9=B46=E6=9C=8817=E6=97=A5=
=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=888:08=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, Jun 17, 2021 at 07:50:42PM +0800, =E7=8F=AD=E6=B6=9B wrote:
> > Mark Brown <broonie@kernel.org> =E4=BA=8E2021=E5=B9=B46=E6=9C=8817=E6=
=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=886:48=E5=86=99=E9=81=93=EF=BC=9A
> > > On Thu, Jun 17, 2021 at 03:42:43PM +0800, =E7=8F=AD=E6=B6=9B wrote:
> > > > Mark Brown <broonie@kernel.org> =E4=BA=8E2021=E5=B9=B46=E6=9C=8815=
=E6=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=889:22=E5=86=99=E9=81=93=EF=BC=
=9A
>
> > > No, that's what you have already make the entire thing a C++ comment
> > > with //s.
>
> > I don=E2=80=99t understand. For example, sun4i-codec.c sun4i-i2s.c
> > sun8i-codec.c and sun4i-spdif.c files are the same as mine.
>
> Other people doing a bad job is no excuse for doing a bad job yourself.
>
> > Which file can I refer to? what should I do......
>
> Make every line of the comment start with //.  See soc-core.c

Thanks, I understand, I will fix it in v2.
