Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F9D73445
	for <linux-sunxi@lists.linux.dev>; Tue, 28 May 2024 16:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716913054; cv=none; b=D1B2g1rF6OmA3H6u9aa12257H49O1oKbYsYZ6jryDmgckYV/Mwswyh+4cRI0nE60u52O+j1LQlz/fBu685QUufjiwTHvYzCiHwzHH1+DqKL2XrjnSVpZLyzoAH4xGmo9k7ZuQ0WATWq+emDUiRfkJyacb3pOQduAIc6vgWpVNuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716913054; c=relaxed/simple;
	bh=Qg1ZgDVmVI3JngvJbDkj1kDsBOQuYV4ctHoNN85SGpo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GH4/zQPjHN64I4WISAF+XPmSzSsbjwbxAulh/r9jKmof5JdxYfbrZZNNylw7VCBnZAKmD7RZEnThMZIkPLDK8nCx8YRsYExme0wnOmQ+EGRnVnOCo6rCanOTvZM3LZUJ0OJ/jUQrb19Dp0cAYeuyH3T3n/QHNgqZF06fYZFFc+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-529aa4e988aso1353963e87.0
        for <linux-sunxi@lists.linux.dev>; Tue, 28 May 2024 09:17:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716913050; x=1717517850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YuYYPRGQXgZywwznt1xenM17tafI6dgKzS08CmDQDQY=;
        b=no8iZsmhf84qqrni1jR2veEOH5krOOUecu6iUSbTOVvUXXOhjNLN9YN180I74/qrVm
         dlQaEFV4jMhD6nSTr7jkVobE9FbLCr7byRYtrZsnF8bV1c0uHIzFeEEJyo1CKTzJdaXV
         vOh+CshWRYM3LZWdnar8eplgRuNxBFDG1qJ7syvkZxslO1PszJ2hUk816Ojor5hXYD9M
         YN7a+XfkQ5aLbQzH+IqqOADcM+jaa5abGK63xLxA64mbHnujrot1G/iQNCzku48nGIat
         9jSi5R6U0oAGBYoQoz126jUOwMJVTtlqwfBxFi8UcGKTBt+/4/5RiPSp9/Frrimz7oex
         JwNA==
X-Gm-Message-State: AOJu0YwCAFxkD9VPTicmgdoelkR1OoB4lbj7jHsAflzEcXtROplqPHrG
	0dT+gW+2YPm0cuh9ptEXNoGm7mdKWJ129FPyF6NRuDGe7OvwwPa+4KU2i64D
X-Google-Smtp-Source: AGHT+IHJuk7Uiy/+972QhX5YWLX5yZ/FBkMuekfbJvYwtReTIHM5108cGS2zhmIWPej3poersmRIhw==
X-Received: by 2002:a05:6512:2311:b0:51d:67a0:2433 with SMTP id 2adb3069b0e04-529661f2e03mr8681966e87.46.1716913050031;
        Tue, 28 May 2024 09:17:30 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-529712f1c0fsm992290e87.279.2024.05.28.09.17.29
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 09:17:29 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2e9819a6327so12802251fa.1
        for <linux-sunxi@lists.linux.dev>; Tue, 28 May 2024 09:17:29 -0700 (PDT)
X-Received: by 2002:a2e:b8cf:0:b0:2d9:eb66:6d39 with SMTP id
 38308e7fff4ca-2e95b09446emr83148521fa.19.1716913049300; Tue, 28 May 2024
 09:17:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1716768092.git.dsimic@manjaro.org> <171691265237.683236.11362059742528552634.b4-ty@csie.org>
In-Reply-To: <171691265237.683236.11362059742528552634.b4-ty@csie.org>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 29 May 2024 00:17:17 +0800
X-Gmail-Original-Message-ID: <CAGb2v66LrU86h3pDDwZ=30n14PtAhHU0Etxiqac5WKCTLqdZEw@mail.gmail.com>
Message-ID: <CAGb2v66LrU86h3pDDwZ=30n14PtAhHU0Etxiqac5WKCTLqdZEw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Correct the model names and descriptions for
 Pine64 boards
To: linux-sunxi@lists.linux.dev, Dragan Simic <dsimic@manjaro.org>
Cc: jernej.skrabec@gmail.com, samuel@sholland.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	robh+dt@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-kernel@vger.kernel.org, robh@kernel.org, uwu@icenowy.me, 
	andre.przywara@arm.com, didi.debian@cknow.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 12:10=E2=80=AFAM Chen-Yu Tsai <wens@csie.org> wrote=
:
>
> On Mon, 27 May 2024 02:08:16 +0200, Dragan Simic wrote:
> > This series corrects and, in a couple of cases, additionally simplifies
> > a bit the model names and the descriptions of a few Pine64 boards and
> > devices based on Allwinner SoCs, according to their official names used
> > in the Pine64 wiki and on the official Pine64 website. [1][2][3]
> >
> > These corrections ensure consistency between the officially used Pine64
> > board names and the names and descriptions in the source code.  These
> > changes complete the correction of the model names and descriptions of
> > the Pine64 boards and devices, which was started earlier with the Pine6=
4
> > boards and devices based on Rockchip SoCs. [4][5]
> >
> > [...]
>
> Applied to sunxi/dt-for-6.11 in sunxi/linux.git, thanks!
>
> [1/2] dt-bindings: arm: sunxi: Correct the descriptions for Pine64 boards
>       https://git.kernel.org/sunxi/linux/c/e1410c817ac4
> [2/2] arm64: dts: allwinner: Correct the model names for Pine64 boards
>       https://git.kernel.org/sunxi/linux/c/a72cf19bf50c

I had to do a quick rebase as the branch start point was incorrect. The
commit hashes will have changed. Rest assured that the patch is indeed
merged.


ChenYu
