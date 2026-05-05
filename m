Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA327381AE6
	for <linux-sunxi@lists.linux.dev>; Tue,  5 May 2026 14:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777991562; cv=none; b=Z2yLoXzXmGP+LIk5tvX9xYjDy//s9IuK2U6vQQZb6lBiO6IQCUCjEdMF+GfFuOh3ZwK7266l26VNd4swvujCI/L0RuxG/d1vMfLQxj8/JuhxYEp4kXC6MOTV3z0LcTEFs3qxlEjPv5XmenoIvtBIwxvSE+bzHPx+ynjn2hlGWlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777991562; c=relaxed/simple;
	bh=5UUQSZu/wPr4836GSLJWIXuKTCHCzhzEVsH9sTY0wzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fCFfVNRTnUhIUbBeM28y5MYd6EpsNwVdBiYQW94adVI3vitC6rfD/YKF6p7IKCnDWoiMH3SHzwnNoBbGWXGGgyZgqB8u15II+7c/bctfCDXI5uUS7tOLZfxsGDJKXc3l9KE8xrBpRhpXI/ojI251fu5XXyqRn52ZYNAET7fLEVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Irx1wel2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Irx1wel2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90F62C4AF0B
	for <linux-sunxi@lists.linux.dev>; Tue,  5 May 2026 14:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777991561;
	bh=5UUQSZu/wPr4836GSLJWIXuKTCHCzhzEVsH9sTY0wzU=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=Irx1wel2eHCp42ENSZoSM1DE2pXk7V5WailF1o8pMVh+1eQJfjd8G962rvEJbiSRc
	 Mx1qJBRpSH6RSlcu9PifweOvHPm5PPmMHWtaw4aZoq9/w2fS12nXYF0HPjTPu5vdRT
	 v3YIIYb3CbYeBHuFQ1eSH+/mjSpHqC1LJxRP2DEzZVteafJZaVbaLn0gRbWFQ+LqO+
	 jJJpywoyxreKMy9VCU9+u3/bjgE0fr8F73DHVBtPgYh9ez6siUxtozqb+oT+Dqg2uP
	 BrIlnYQ0Hzu2hsRXoVCaKR01rQgYION3FtIqbWLukHh3Sn3njKMrOr1bknVWLmR/OA
	 YK0CaD77tdzLA==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a283c44478so6950685e87.3
        for <linux-sunxi@lists.linux.dev>; Tue, 05 May 2026 07:32:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/P7hrW2zo7bOh9woLs3WsP0zWFcnVyLehsIADzUxwzw4X0yTwQDDNENA6e/b/HC8Q9O606QzITV1Pzaw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywk8LYKRKmbSCnnOcXu44hkPn2pd8WW89fyk+bi62ARULLOeqUY
	zbbCyPB0HWEng+Crxqvk6kUOPUreOqK4NQmJkab4fXWgS6k5JASHN2vaL1pBVeGIH0uzZTPjXng
	xU9tJju9DOe41rOZIWQmB7y65uOIBNww=
X-Received: by 2002:a05:6512:10d6:b0:5a4:175d:1278 with SMTP id
 2adb3069b0e04-5a87f1a0551mr1565407e87.1.1777991559950; Tue, 05 May 2026
 07:32:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260428-h616-t113s-hstimer-v3-0-7e02178a93ee@mmpsystems.pl> <20260428-h616-t113s-hstimer-v3-2-7e02178a93ee@mmpsystems.pl>
In-Reply-To: <20260428-h616-t113s-hstimer-v3-2-7e02178a93ee@mmpsystems.pl>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 5 May 2026 22:32:26 +0800
X-Gmail-Original-Message-ID: <CAGb2v679HMu4EsJVWXxrTFsemFvKyjfFbJWxQ=eNvAACZbYFpQ@mail.gmail.com>
X-Gm-Features: AVHnY4IaVX6DpQmwoUpBlMFQuD9nalA1_rpExzg-De62sn6g73dQjm9IIJe2UMs
Message-ID: <CAGb2v679HMu4EsJVWXxrTFsemFvKyjfFbJWxQ=eNvAACZbYFpQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] clocksource/drivers/sun5i: add D1 hstimer support
To: Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2026 at 12:29=E2=80=AFAM Michal Piekos
<michal.piekos@mmpsystems.pl> wrote:
>
> D1 high speed timer differs from existing timer-sun5i by register base
> offset.
>
> Add sunxi quirks to handle D1 specific offset.
> Add D1 compatible string to OF match table.
>
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
