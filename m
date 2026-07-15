Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCAA31AAAA
	for <linux-sunxi@lists.linux.dev>; Wed, 15 Jul 2026 14:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784124555; cv=pass; b=ldFClqnY5qryh5EEQfPJHS622kQcIJ64C/khn5mKomggpDi0EhkimrBjLmJglAZKKEZKRZhvgFNaJYytEyb16DTIn3xAWPwAXpaJYWhAs28cD90SI2i171tlgEybzWj/QvMUhOVrGbxw5E2LXbEDhviJxmh5K9Eu1daWUb80hG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784124555; c=relaxed/simple;
	bh=yo9f12qfg2pKni/2mURIdZ/6HWUyTeCOF7Macoc7gOQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=PZbY5lx18PL69+/rcPjxSXZntaJ5LqHREF5/a3mxZKuKaGPKVbS2LwAuNcVZYiakMHqs0bM2EaPV4OlxiupGxVmHZnXEfitG9TxjLms7017P39PW1CQa7o8/nv7UUthDXm6OXtGSuqRfudtI1t8MlzqZ9PrAaP/W0ZaL01sXCEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YRHy1MiD; arc=pass smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YRHy1MiD"
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-73a442f7cd3so1395279137.3
        for <linux-sunxi@lists.linux.dev>; Wed, 15 Jul 2026 07:09:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784124553; cv=none;
        d=google.com; s=arc-20260327;
        b=GW15FBP3jaXjszxkvWrdP2FWQeX0RvEJlpVXVz+V69So1pd/lcXKzBMD1TR+w6qQUE
         7p3rBy1s4h5YIzI7tUun1pmOfqEyRAxTR7foKBkcmEJB5dlna1okbcrNV+Dmd5SkWv2P
         BSIvxaNnvpTdkqxrU4okLITZ4rjZ5zU6Qg+1XGwy5V+N8H5U42MjoTmhXhgXDZOFF/Gx
         CtMERhZfTBTppOM3tx7k3TiQ1fWH5639Quv+YYnWaiM1nQvTTn0ZDAxivV1/7Jvyem0I
         Zc1UDt6t2JV2owxDNx3MFNGw0aymgpe+wIgpECZ+omGwvWvBnQ1EWYXa5qFc8SGMSFo5
         80cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=5wPSfEL2mYukX8aA/pKqOQ/JZDY1dveuzP2w1IaEgxU=;
        fh=tTko2b7LahzhZXvvjoa8ahZMxoSY8UZff4rmVu3r0z4=;
        b=ORbbVjLU4+V1zOE7Smtv2Mt0Ik0N9dUUW2redoLKVSvX3AEaSM5iGowDMmS1bo5TMc
         dG8AIEb+3LOf+XUzleZcLwqu1a0jqAXAEPGcZuQpAgxT3Z1KkEgcHZSdUasj8ZUhAgk0
         WdyZE9TCiLVGg5QIdnVmEzkriuGWgxmBMCcEuRAfWw9Hm+mwS2M2oztzHUD/8neRJjUA
         i7SCDNYfMR5v2B/5Amd66oqKe2mrmR+VQ8/ZE4nCQc9PxENjMue+mZprFskwUvpk/b8o
         FyhV6wZZnyfzawWzUOfNNP0gki+E8mkh49plSZBiMKn8U6+O+lI5HjAwANAWTkmutmJe
         DylQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784124553; x=1784729353; darn=lists.linux.dev;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5wPSfEL2mYukX8aA/pKqOQ/JZDY1dveuzP2w1IaEgxU=;
        b=YRHy1MiDncUTt4JzuxdP7b5R4Jve77UXhtAOsfG4sihuLaSWkAVCED0CXAsHhvI1Gt
         96U9JOp5aWOiYacAMoPCIoXnhq95XTgFf953z9XRiga1p/YVn+7h38M/tWM3ilP4N1zX
         1+OzdkeMU/z561N5usKqQ18EjVd2LTvnyokEyRlPUwQ0MxiTcH4LIkiA1Tdp3cCz8kFg
         LHLSQmWkl0GvuZxIQVgd9SNJEitfKhEKpIYAdcKyOTADy72TkAq8PoyR2NYjz4+TtFAN
         bHwCXvYhIMlX4cy5cpwKJL8XPzQuSU6nbs/amm/8g1/JkCu0ILJDNX6Vr40xeDXOGzxf
         1ykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784124553; x=1784729353;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5wPSfEL2mYukX8aA/pKqOQ/JZDY1dveuzP2w1IaEgxU=;
        b=k7s1nkgf4wYgaZcJT/G9vykXde1qkJPqX4sMtOdR2bmt8tMuA5tjZ9uxRY0Pkf0tdU
         ny5320rC+uKc6hncfX6P5LyjGbzcVF4tN1kLWDMv9cDajkah8Suoz3/GcOVpfeIJ0k43
         d/q2kPbinTK86ccW2GT+6BXtjZZji8C0D/RaBXslOcrS49mcJm3AGQR/61nflfQDXawQ
         xbTyKBHlVmXljXMGk3w9PMczCRBU0GeRO0Kng9NjwyRd2rpjIlDuOa/bgFzQkB5ubxnZ
         sGz6Z0mAngbcVR8B9ojuhW/XojR0eAQRNAY85c0HpyOCzS0v8FNlTDfaPx1T2hrR/vu/
         iMfg==
X-Gm-Message-State: AOJu0YwRBQEHmpLJiy5fP7iwOlTGiXyAguL3IuRJf0pyrc8yzz7fJFfU
	YfapNuT5Tm1ndvJd0iXAyqf2jH4/nwvDLLJHPChG0WgfoTICL7zR1QBq7syFGh3SZ36ZR9Tx74G
	31D8MKyVsUVob5Vw2SaHB3W/gnUfbLiyv2rV8
X-Gm-Gg: AfdE7cmD+Wqx3v6fDYpnKPMD4e6MvMYycmEy9/bF187DELM6rBxFFm+N/Zv62aEEkT9
	H90LB7xQInttAKy2xBj2JM0psxnhk0GtMtpb+zaxmD4QdWRzP3mJZsBy26cFjqunuaTPBoR8zIH
	rk65CkVsHB+sC1ve9wq2LGnwKpq80Bvlyyy05FLhJB7oiPrcxfbJP4DPI2oFXCOzEUZjjfTqtj9
	p5FV9B+5Dio/p7vqc3NPdzqbfH6iZWo8b4pW2v447QADMYUSaC3sqXvQjn5bIunutoJmF9zuFWu
	/39be2U1CsdQEsCUCmBMnngCUyok5pks1Rah6ReI
X-Received: by 2002:a05:6102:5a95:b0:733:844f:3582 with SMTP id
 ada2fe7eead31-74533e97c82mr10795866137.27.1784124552756; Wed, 15 Jul 2026
 07:09:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+c=wxW6t+dSgTOpmOoE=PHisV-fSCfFWtJdhxeNAvm-LX6eSg@mail.gmail.com>
In-Reply-To: <CA+c=wxW6t+dSgTOpmOoE=PHisV-fSCfFWtJdhxeNAvm-LX6eSg@mail.gmail.com>
From: Juan Manuel <juanmanuellopezcarrillo@gmail.com>
Date: Wed, 15 Jul 2026 16:09:02 +0200
X-Gm-Features: AUfX_myQx8o-_WNFfPoE_eg9DxsD-M6rHIxRTtO4uXW9Q30ujPsHK7396PJ9iSQ
Message-ID: <CA+c=wxX_iv4QtTQNBYYD1Ptmyp_vPgTazG05F-6bsZy0uoivHw@mail.gmail.com>
Subject: =?UTF-8?Q?Fwd=3A_Orange_Pi_4A_=28T527=2FA523=29_mainline_bring=2Dup_on_6?=
	=?UTF-8?Q?=2E18=2E38_=E2=80=94_patch_series_for_review?=
To: linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

I've put together a mainline bring-up for the Orange Pi 4A (Allwinner T527,
A523 family / sun55iw3) on top of vanilla 6.18.38, and I'd like to share the
patch series for review and feedback before I start splitting parts of it for
proper upstream submission.

Repo (git format-patch series + defconfig + board dts):
  https://github.com/ut-slayer/orangepi-4a-mainline

Up front: I'm not a kernel developer by trade, and I leaned heavily on the
Allwinner 5.15 BSP as the hardware source of truth (register semantics,
calibration and DT values taken from it, not invented) and on AI coding
assistance. Everything in the "works" list is validated on real hardware, but
I would very much appreciate people who know these subsystems telling me what's
wrong or hacky before any of it goes to the lists.

Working on hardware: HDMI KMS (DE33/DE3.5 + TCON-TV + DW-HDMI 2.0 + Inno PHY),
Mali-G57 (Panfrost), HDMI audio, GMAC1 ethernet (YT8531), AP6256 WiFi
(brcmfmac/SDIO), the 4 USB 2.0 host ports, native HDMI HPD/hotplug, AFBC
scanout, reboot/poweroff, and A523 THS + CPU cpufreq (480 MHz-1.8 GHz) + GPU
devfreq (150-600 MHz) with thermal throttling.

The README groups the ~106 patches by intended destination. The parts most
relevant to this list:

- Generic sunxi fixes I believe are upstreamable on their own: pinctrl (PIO
  bank withstand, inverted POW_MOD_SEL polarity on A523/T527), watchdog restart
  priority vs PSCI, AXP717 poweroff, a RESET_GPIO/mmc-pwrseq-simple bug that
  breaks any sunxi board with SDIO WiFi when #gpio-cells=3, and a sunxi-ng
  ccu_div set_rate_and_parent ordering fix.

- A523 CPU CCU + THS (clk/thermal), ported/adapted from the BSP, with OPP
  tables, cooling maps and asymmetric CPU topology.

- The HDMI KMS display series is largely a port/adaptation of the minimyth2 /
  Justin Suess H728 work to the A523; original authorship is preserved in the
  patch headers (Justin Suess, Jernej Skrabec). On top of that, the A523
  specifics: IOMMU (sun50i) PHYS_OFFSET/PTE fixes, DE v35x RCQ backend, VSU8,
  the MBUS "wedge" fix, and AFBC decode.

- A few patches are pure BSP-U-Boot workarounds (it doesn't fill /memory,
  injects display nodes into the FDT). Those are explicitly NOT for upstream.

I'd be happy to break the generic fixes out as individual, properly-formatted
patches to the list if that's the most useful next step - tell me the order
you'd prefer. Also glad to open an armbian/build PR for the board integration.

Credits: minimyth2 / Justin Suess for the H728 display groundwork, Jernej
Skrabec's H616 patches it builds on, and the linux-sunxi community's docs.

Thanks for taking a look.
