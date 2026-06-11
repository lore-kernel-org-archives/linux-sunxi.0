Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099383AE1A3
	for <linux-sunxi@lists.linux.dev>; Thu, 11 Jun 2026 11:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781178578; cv=none; b=LW65iz9W3twPvnR1PVBRUq/kAeDpLyV+XIJv7S0KRrnSDPGZ0x6XvmGdAGfjKyotigwPlHpFUudpsVgJdoNtgtkXZFD6YNWJNz9dyeMFfYPFAQ4NMEul5+E5Nwnn3m2rI6q1Xp3/ZV0aAYj6grIl8E0HdtiGtkiAZF1NlA31e50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781178578; c=relaxed/simple;
	bh=rKmlnp6soY2/E60kLoIUuxjPFvwpU7GxO46vKOmRRcE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tPYeFvDZhR6TWiVegIwBqcqPGUzd1CD5yGsbn0f/I1bzMmP7J+1YwWDuaxNsEmjDRBgpnnV5I+k/+hSAgv7ALS4DXSJB7a40t1005tCxsNVTAabtrFZa580h2+vUAoJ870jB5be+QgXNWJ/zHXnL5b8Xu6KVlfJiuAHNfkwMtyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iWoxSrf2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iWoxSrf2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF51B1F008A1
	for <linux-sunxi@lists.linux.dev>; Thu, 11 Jun 2026 11:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781178577;
	bh=rKmlnp6soY2/E60kLoIUuxjPFvwpU7GxO46vKOmRRcE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iWoxSrf2eJBxIUL1UC9eu2rCfEOYt2pmOr3+Wr9TXMOGuZd15Apaqr0KVzB7qEWLp
	 mpWBVGoOa6w2vQ3nn2A62u9t9wunj7eluguHPjiHPNYGFWOLPOe4Cy+PqxRNG4saLr
	 VqVgvZFqxqz83kJ0L+7YiCJ4W7ZbILryg59ck0zhbxrT4qqnlfJFPGopVdEyok09t3
	 rufvsQKCeDb1rw/PVAD/ube97OYxH2e1OQ5xagFAVrKuy4A17J2amuInhxJtoKiOfw
	 cdZQWR4QxGpzf+RxHFYfgDmwJAdYiSXua8YbO8VW/C5CXlxRvfC8GYKWz44Olcu8ui
	 wl0+tXVbBIBVw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aa68cf9123so8359443e87.0
        for <linux-sunxi@lists.linux.dev>; Thu, 11 Jun 2026 04:49:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/ROCXt/ikGd2bJdkMffixwABpEtGZp0/+JRKRy96HXQa4Po9kYfNXWu8dKJDdl3tsThA9qbWJ8LtfqQw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyLwRtgOYSUyzIuyodfAGVbh4fsL7n7wYG3nJFhMXLRDSNEn5AQ
	EK/GEAGWIYO6GhhMlYi4qnrvLfZTWovS690sUFhHYXvxkkfAx5/ZOYjcr3+WnNrHvOLzxAxKfQR
	EUjho9gnQiuYlrdJ4a5av2hujUI1YV+I=
X-Received: by 2002:a05:6512:3f07:b0:5aa:4bb4:1e9c with SMTP id
 2adb3069b0e04-5ad27ab047cmr828882e87.18.1781178576530; Thu, 11 Jun 2026
 04:49:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260327113006.3135663-1-andre.przywara@arm.com>
In-Reply-To: <20260327113006.3135663-1-andre.przywara@arm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 11 Jun 2026 13:49:24 +0200
X-Gmail-Original-Message-ID: <CAD++jLmok4GNZHT1_SVxRgOqQpH9d8FX4zgNpQbOdNjVka2Hew@mail.gmail.com>
X-Gm-Features: AVVi8Cfo54uztqxkktk8YLcVPxtQEtZS2d7KQPPjjqOVBQf71Is6FBvmH-Q48FA
Message-ID: <CAD++jLmok4GNZHT1_SVxRgOqQpH9d8FX4zgNpQbOdNjVka2Hew@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] pinctrl: sunxi: a523: fix GPIO IRQ operation
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 12:30=E2=80=AFPM Andre Przywara <andre.przywara@arm=
.com> wrote:

> this is the minimal fix version for the GPIO IRQ operation on the
> Allwinner A523/A527/T527 SoCs. SD card detection is broken as a result,
> which is a major annoyance. Those patches here fix that problem, and
> should go into v7.0 still, if possible.

Patches 1 & 2 applied to the pinctrl tree, please send patch 3 to
the SoC tree.

Sorry for missing this, dunno what happened. Probably it got
lost by me trying to use korgalore and screwing up.

Yours,
Linus Walleij
