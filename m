Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3403035A387
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Jul 2026 05:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783833678; cv=none; b=R74AWyHuv1FvHzQrAhAQFkt3qmt6steNfXOS/0GM3d7Yn1/DmsW8CUiTvBBGwZ9Bwfl5NrDRmXPghsNlEVLnCuAVyVlqnY2utazEBbaSTw/rTalyrlewv7tt8piPtSnet7YwsJd+Yg7tH9OXuoYfzx5EbU6tjITsyxfSbVJgooE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783833678; c=relaxed/simple;
	bh=gOChh1ohTaPrZ+Y1GE41WGbMTNjpPj91qb2GtVmX2R0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JcZ92NKgTGS5rO5yIy3r0aRuQbaK7KgHVTkF3QbKfVzZAuq3hrENuZjqetDWDdHHmFrc9T1KqtSVwDoltf6m7gEpIjy+31wh3XJFERc0o7gSb/prXAZ1Mw1meBQkB6nH9gjC1Jo7lleqEM5/41mJ2TMmbh5I2ZICAeTANThvqDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eZYjivwv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eZYjivwv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C95291F00ACA
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Jul 2026 05:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783833675;
	bh=gOChh1ohTaPrZ+Y1GE41WGbMTNjpPj91qb2GtVmX2R0=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=eZYjivwv6VxAxWDT4CG10n7zgNfpl+yGBRHvlv+VwU8uXLyn1wc+PO5/iRDBxzHEp
	 9KERussY+0ce6BWxHPRqoemDGX6IuPvUd3Ih2HNqrgMdj67+8sUdKVVRgav1JTa+YX
	 EDha5Q+TqABhsIXaAEklbmTLoWflCd0PRwGn7XAgNUGeUV2YmVaiJQfvUrVeqVeohW
	 A20033eiVAXlsMW6vDjhh0/N3CbLB/FZNnmhuIrERosMXXNFm4RzA3qbWS6TNrbrXk
	 lHlxAfOC79bdb47Orlsx77kb6H1ka6RqU0CLyQL/lrSGy1acr7Dg2fnT6PVtc/DRk1
	 bcnnV44Nt5zvA==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aeae350e0aso2505733e87.1
        for <linux-sunxi@lists.linux.dev>; Sat, 11 Jul 2026 22:21:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrgAYzkaySk4g3EIURYtbFDFQqEfCV08WEa1U1qYy8n8qfX8UE4qf8DYT2Z/lrP8wPDs7VgkE+9G/dBlw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwcRdrc5Wp4RuN0vK7SnOyo18GH1cBdCsu1F6Fia4Fhe/lM7+6q
	437s+DM1v3CUh8d8cI6sgL6c99gKKtSFYzt1H5IpkWFa2whyWsYaeKROkUy56iLeMsIYhh3vt+2
	gTQrtOw2RT/EYxzLba5O4TsvozUfqOT4=
X-Received: by 2002:a2e:a54a:0:b0:39b:1e0f:5805 with SMTP id
 38308e7fff4ca-39caa80ec19mr9352491fa.24.1783833674238; Sat, 11 Jul 2026
 22:21:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260704171411.1413349-1-iuncuim@gmail.com> <20260704171411.1413349-4-iuncuim@gmail.com>
In-Reply-To: <20260704171411.1413349-4-iuncuim@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 12 Jul 2026 13:21:01 +0800
X-Gmail-Original-Message-ID: <CAGb2v64V9fXrEZD-mB8cLs0hwp6WbpKhhkDzBqLmnZe5DQBtUQ@mail.gmail.com>
X-Gm-Features: AUfX_mw9aYjn22Umh3bpOaSqB39rYIPvYv_r-wBdphks-YmEqPaE5LTT0cIaXBI
Message-ID: <CAGb2v64V9fXrEZD-mB8cLs0hwp6WbpKhhkDzBqLmnZe5DQBtUQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] thermal/drivers/sun8i: get calibration data from
 two nvmem cells
To: Mikhail Kalashnikov <iuncuim@gmail.com>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 5, 2026 at 1:15=E2=80=AFAM Mikhail Kalashnikov <iuncuim@gmail.c=
om> wrote:
>
> The A523 processor has calibration data in two nvmem cells. To be able to
> add support, the ability to add data from two cells into one array must b=
e
> added.
>
> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

Some of the variables could be moved into the of_property_for_each_string()
loop, but it works either way.
