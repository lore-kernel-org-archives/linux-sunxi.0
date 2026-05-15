Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF6B3C4B79
	for <linux-sunxi@lists.linux.dev>; Fri, 15 May 2026 02:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778813114; cv=none; b=dDQy/OQThh0hNvrJ241NJbqnpqvBwlBKR0SHsJRg8osQQFprUvuNj6w8I3PqmWi5rFmDkuEnZM2lT2Cvj+Qf7DEXxgthij/hr8pGGxutA2ePU2Ylqa+Ktem+/iy6W/Z8myOvzsvy46+lubULJ4dZzclZPpgZrgYq1rHltPA/q1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778813114; c=relaxed/simple;
	bh=4Gq0+69BzbH6lC7+bTVsEXzNE4pKUS6ML366m/Lt5uc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=ttloEuWpwUJwcH8XSRdIRWVyy/ud2CHWfzi4C3hbsyDWVvxBYtajroRwKtjuEo4lOUaY26KuLo9D0mWTFjGMx53ylrsmd8L3pZHhAp2PC7DYaLFaKWZt+p3mlbs/nLpQ//C5XarBAfdY2g+r6gZgOBhu7cgqp8h7Cix+X2HAR2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a4113ab355so8288714e87.1
        for <linux-sunxi@lists.linux.dev>; Thu, 14 May 2026 19:45:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778813110; x=1779417910;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4Gq0+69BzbH6lC7+bTVsEXzNE4pKUS6ML366m/Lt5uc=;
        b=pV00Bph3qjobVaaSzRvIjdJuNZT50+88RfsZ0m5dpoRWGNoM4MvgKUfKxhZwBAbGmI
         DSceE+4PAXiI0DzwLK/7TsG8Bb2dMduPuIVvLzK7/OSv2+NQJ1nuNIDdjlY3+DYSmlE+
         CvtHtgw77wxsiUkZwx4vIfT3Hqe+an3jc1QSnteIhHCWiV/dIF664cLrwUm9dCQDayPO
         UG5+f839pU0FsH1drw9RZMUF3FFpkgHUVf7zXxA9s8jNJCloDJEVxEHrMRVfRoNOJ4FQ
         NpMUYDVdepZlsY4450OKQ6wii4PaLEP/7lxJFy/ZXKXGFkgY0tzS+qKiJcRVPO8XrbY9
         LoXA==
X-Forwarded-Encrypted: i=1; AFNElJ/7vBj60zd5wnzWL40wpGKNX3k3Dt7P5zYLiQFdt82QeRPOhpUaKsguwo6POUcnOq6qmomKnygxIb7cqQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8e0C4UfrMk3AYrEDnCjiVIDEMFxx9wR3Kv8s1hM/XSJutKdvy
	RX2gwOTOyynN07wiT4I7G35Zw3X8FPfuyJ217+SlC8yRieotacW/DnnLlQ+rjVIz
X-Gm-Gg: Acq92OEF6h5yCMrikV2Dm+MLppikZ+gWmXEtYiGENHD8RCVkls0o1lm8BP4LTg12niW
	T2Fd4MvSRicm/buFYg85zrEq+kVvNCVbfD/j+U5FzpFcXAElrAwzGNDYOynvPoixMl6hDnXsllr
	BRfZ7oXJoNxRKWoMYcb5sfYDSvmoKnvSLiu0gia3grQ7mrg9owYN8hGM/qjCPNv5eDfVTcZ/Miy
	DZ5IDAsl5MAS9+U7dBmIewpOQ5tRXB/ZWjnsONTXekFVO/xRYfBKytbNiN38Pe0QIwqJKytfvxS
	viqRmHNe3VgLY4AwmnvFTyKejxWVtVMQRx69AaaJitVody9mCiXeieQnZhTOkkvFEtIiJnOMv9o
	V4/MlqoFYIjJHndIukXhupstJj7Tb2dB89aT1ogiAafv5D1RptX6K6XPi0XFNIkAHhiJRIMVDXw
	bzvHFtJyvSHX7JYNZXbCIm8b1eui+TzrYrpeGVqZfNxGVwA7gy6tUGqlr/c9ThYxkZkw==
X-Received: by 2002:a05:6512:4026:b0:5a8:735f:aeba with SMTP id 2adb3069b0e04-5aa0e732188mr494236e87.23.1778813109425;
        Thu, 14 May 2026 19:45:09 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3945cb1182bsm11189891fa.34.2026.05.14.19.45.08
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 19:45:08 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39393c1b5aaso74152901fa.3
        for <linux-sunxi@lists.linux.dev>; Thu, 14 May 2026 19:45:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9R7Ss6HyhH3oBTF87f3J1Y1fYGfxfGJAD4VR1uhR5zzdqy58aYjzlGZxNPl0cFqZSxr/BnIt4WWogKIA==@lists.linux.dev
X-Received: by 2002:a2e:9dcd:0:b0:394:987:945e with SMTP id
 38308e7fff4ca-39561d5819emr3540321fa.1.1778813108037; Thu, 14 May 2026
 19:45:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260301144939.1832806-1-andrej.skvortzov@gmail.com>
 <CAGb2v64PvGdViT6DWHiNGoK=5L8DpfjVAdv+LbNf_Uisy6v0Aw@mail.gmail.com> <agY70wRwrkdI2pk4@skv.local>
In-Reply-To: <agY70wRwrkdI2pk4@skv.local>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 15 May 2026 10:44:54 +0800
X-Gmail-Original-Message-ID: <CAGb2v67c3DKq=Bz_HU45xwiyAh8JhMv+uOB6+=7JVGtJNE2UTQ@mail.gmail.com>
X-Gm-Features: AVHnY4IAFKEb5fFsOKR9Ml4CdBf0EmQCbXRlmyRzS5WkYLAAPCuf1-bVK9uD2LU
Message-ID: <CAGb2v67c3DKq=Bz_HU45xwiyAh8JhMv+uOB6+=7JVGtJNE2UTQ@mail.gmail.com>
Subject: Re: [PATCH] bus: sunxi-rsb: Always check register address validity
To: Andrey Skvortsov <andrej.skvortzov@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 5:17=E2=80=AFAM Andrey Skvortsov
<andrej.skvortzov@gmail.com> wrote:
>
>
> On 26-03-14 15:33, Chen-Yu Tsai wrote:
> > On Sun, Mar 1, 2026 at 10:50=E2=80=AFPM Andrey Skvortsov
> > <andrej.skvortzov@gmail.com> wrote:
> > >
> > > From: Samuel Holland <samuel@sholland.org>
> > >
> > > The register address was already validated for read operations in
> > > regmap_sunxi_rsb_reg_read before being truncated to a u8. Write opera=
tions
> > > have the same set of possible addresses, and the address is being tru=
ncated
> > > from u32 to u8 here as well, so the same check is needed.
> > >
> > > Signed-off-by: Samuel Holland <samuel@sholland.org>
> > > Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
> >
> > Should probably have:
> >
> > Fixes: d787dcdb9c8f ("bus: sunxi-rsb: Add driver for Allwinner Reduced
> > Serial Bus")
> >
> > I will added (via b4) when applying.
> >
> > Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
>
> Hi,
>
> do I need to update and resend this patch?

Sorry this fell through the cracks. I've applied it now.


ChenYu
