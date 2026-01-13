Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3842D38B7C1
	for <linux-sunxi@lists.linux.dev>; Tue, 13 Jan 2026 10:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768301979; cv=none; b=aTtTmNQ+zu/wWr6R6/L6h/urs790W4wi2kdF/Fjb3gjyZauIYvdkqxX8DUmvIrukoaeP71L+mYoABCMoEfBPsuZta3CvdpjP2BYZ+L8QdO9VnIJZZoADv5NQ121tCgIxerBWZ4HRwW21q48218oseiWlmb/P/zMYLg3NWTmrM7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768301979; c=relaxed/simple;
	bh=2Hm3klV9uiE/Rwd0k0xCU9t68/lMBtjH2KuL+woZfe0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jzn91JDlfGBGwX4Y5iuZeXgfckttT704d0IHsAVK+Lio9tIS+iwkqtNNZPOPCdjq++xXfTY43jA6GRGEB/BSNlroR9pejyq+8WCwg6Aup028rMai9baVpTsNkHDC0KZfYMCpyM0YmI50OfBuwhUjjOIF2O2VgPap2C8o2PnhV8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CnWD40Gq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CnWD40Gq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 863CEC2BC86
	for <linux-sunxi@lists.linux.dev>; Tue, 13 Jan 2026 10:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768301978;
	bh=2Hm3klV9uiE/Rwd0k0xCU9t68/lMBtjH2KuL+woZfe0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CnWD40Gq0utnISVi8XjBMDojxfibwo6OJpMA9l7zIOP/BlYamET3LSh3Rvv6gKIME
	 WXzLsErGjlYDCGJ96cLbbM3Cis4HgUWFUXGrsB7hPjyvzmSm616pH3m/P2hSMRMQTK
	 ya2SyIJPcuhF2z3n7IpRAugQsj0IK4+P2CpnRQ1CIjQ84tHIqeZtQV0OHXBnNHnpYp
	 T5tc3aAG/vKBAEZcGxT8MZ0DPTjbumj+JlMS4D5g/Z+SvHSheALsXTN3iAc3dOvY27
	 ceA1rGFEwZfJItyoYQGisHUwTdjiPd3dNy7Pz50cwJOg9mKwCyIvzqsIpUIZ2kaXrI
	 DmJ1OgUhnD5wg==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-59b834e3d64so4542070e87.2
        for <linux-sunxi@lists.linux.dev>; Tue, 13 Jan 2026 02:59:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX3zK7iNdT/LVT6Bkt85Y9EL5S+SGsyibwipDqG6qO5D5GfeXdykIOnDz/3ZNWOXaLH4J8Zbb3ylgqALA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxM7D/QQdqnHl8uhuVvNjIqN9PSwVh8UFFLX7E02q5CYtW24tuT
	Lz353rMd/dmJWOgdUFrRfcr4F/+iD6enN1sy8OBB1i7nHAxhFzRHAOktcer71QKmsUHy9L+jb5M
	D97FlW9CMUA6uffu9NidToqRatQe2s+b9qLJE0pcbUA==
X-Google-Smtp-Source: AGHT+IGcmwmSIyLMyyShT8GjGLmzzGIi3k+GcAB52Nf27mmBCIl5woR+Nq0F41SPuLO1vsApeIkdFdNTDNszbvq1ee4=
X-Received: by 2002:a05:651c:2212:b0:37a:584c:23fb with SMTP id
 38308e7fff4ca-382ff6dd8eemr58925311fa.20.1768301977156; Tue, 13 Jan 2026
 02:59:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com> <aWYiJbtueA8g3srn@ninjato>
In-Reply-To: <aWYiJbtueA8g3srn@ninjato>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 13 Jan 2026 11:59:25 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfseaLWfYuhz=5MxRw9dtBvOM4X6brPwT2PJ4Fq7rGbfg@mail.gmail.com>
X-Gm-Features: AZwV_Qh-1r_ecwLNV2XfQsZ1XcvcpdCoswobPzSyba32xUDeV7eWsZEVfP38rEk
Message-ID: <CAMRc=MfseaLWfYuhz=5MxRw9dtBvOM4X6brPwT2PJ4Fq7rGbfg@mail.gmail.com>
Subject: Re: [PATCH 00/12] i2c: add and start using i2c_adapter-specific
 printk helpers
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2026 at 11:45=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi Bart,
>
> > can be *revoked*. To that end we need to hide all dereferences of
> > adap->dev in drivers.
>
> I haven't actually tested the code yet (but will do so this week). But I
> already want to feed back that I approve of the general concept of
> abstracting away drivers access to the struct device by something we can
> then convert to SRCU in a central place.
>
> This mail is to discuss the timeline of these series. My preferred
> solution is to aim for inclusion right after 7.0-rc1 is released. That
> gives me enough time to test and you some more time to address review
> comments. Bold wish, but maybe we can even get dependencies into 6.19
> before (like the i2c_dbg rename for the saa7134 driver. Is there a patch
> for it already?).
>
> Does that work for you?

Yes, I agree it's too late to queue it for v7.0. I actually wanted to
rename my macro to i2c_debug() to avoid a conflict with saa7134 but
you're right, I may submit a patch for that instead for v7.0.

Bart
