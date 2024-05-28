Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901BB73445
	for <linux-sunxi@lists.linux.dev>; Tue, 28 May 2024 16:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716913133; cv=none; b=nscwIo9xJ22aV5XVAYkYRumMfRHKAxc+tgdW1dCfHCF8oJJD7i0XYaLFV1Zq9t2dQmlxkKHXpmzuDAyxcDPrqLkWEVxgxriJpjD12UF2I1GJKtg0klfKxKP4dPee92X4pMjnIZlay2gNhbTHBtvecyFwzLshKKlb0dSvAxi1gT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716913133; c=relaxed/simple;
	bh=enOrTZpM2tWnXRPoFrirpkMmSsCchYgFfxbqdlmuU+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PNBysKiiV6u8/lZpCOu9si+mBF/k0HZsofNKrkRiREQ9no8GU9w9uMbWSJ+pxNzqAx/Eqrwq/vRklMN0p31/DWHn0VfMngibUBRgQplzQg4Dqq7xlFcWYNQqBWn2QvU6Bw/0v4DhA93yJUiUlSvZJkmQSB6zg7IKMxm1vEnkemY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5238fe0cfc9so946004e87.0
        for <linux-sunxi@lists.linux.dev>; Tue, 28 May 2024 09:18:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716913129; x=1717517929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rMrFie2mcYvWZ6BzC21LwkJeB7ab8c2qzeDd+G7m6R0=;
        b=jaBuPmQ32KYj2mMeAdJ65jR7XneRdN+jr3uMuHcZ/r5QEJrUGoo+/jywA8qP0I8u2Z
         cnE/BMCxdbngnJHq8tBS6yhTwtyCl86YNxFys/G7PveEJ/xAQK5UG+UTSJeT+TRpS72v
         nXc2/yiLDEMLKhv10/3Brsgyx7hMWb8A5nbeNlS7nR8AdYV4+nUcnue4fvzKafavEh/P
         HO5lmErbX43/gKP5PEo3ket1EkbwmkWs/qZYnl88MmTNrWnj4PEpzY+votBrde0tJK2z
         IXU6gU1eaPB56hKOFZ0N2FP++uBzynwpInlFMxcOg4wSmQKkjKpjBdZb92tx5VWXES9z
         QMvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUF7X9srr7KYH/cwWgzfxG3Il8EYemG8NwDt+bs8VTg6zM+Mc7jzMVqcvP99AYiA3fmzFMZ+hcacMSlSLU2gt5afqQfz/jgfdzz6bc=
X-Gm-Message-State: AOJu0Yx7w65bnZHFxujVRS4BuJBoHtsLUoD2IsytNS5po6uMhJrAFm4m
	DtBJAFSSNNVTS1NcOtI1Fv7xHVAXfhZHN9DEjLTza1YuPu8uZGTIfTr+uH9C
X-Google-Smtp-Source: AGHT+IGypEsWDoEJZOVJJczfHxMbeg9lGPLsNdNdxbiVK7Nzdm5wRmM5cgVgdN2mk5DFkBJn2Wxd4g==
X-Received: by 2002:a05:6512:4026:b0:529:be9f:df04 with SMTP id 2adb3069b0e04-529be9fdfcamr623160e87.29.1716913128677;
        Tue, 28 May 2024 09:18:48 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52970c330b7sm1000631e87.194.2024.05.28.09.18.48
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 09:18:48 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2e3efa18e6aso10740191fa.0
        for <linux-sunxi@lists.linux.dev>; Tue, 28 May 2024 09:18:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW1yjeN9zv5s5BrG3c2Q+ZNjGO6XltjdN2HTQYF2ayC2neb5KdKqtk7Tn5CqbdCObkkcLpV28ORRAkUvpk+tmOVr/h9xaQgSQUmjFY=
X-Received: by 2002:a2e:9611:0:b0:2dd:44b:d63d with SMTP id
 38308e7fff4ca-2e951b82c05mr52618121fa.12.1716913128368; Tue, 28 May 2024
 09:18:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240426092924.15489-1-jamcgregor@protonmail.com> <171691092979.680152.13758975851829859883.b4-ty@csie.org>
In-Reply-To: <171691092979.680152.13758975851829859883.b4-ty@csie.org>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 29 May 2024 00:18:35 +0800
X-Gmail-Original-Message-ID: <CAGb2v64L1XsXt2nW_jFXGaV-NVeOHdE4+LXCFdOyAYuhwpdzOQ@mail.gmail.com>
Message-ID: <CAGb2v64L1XsXt2nW_jFXGaV-NVeOHdE4+LXCFdOyAYuhwpdzOQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] arm64: dts: allwinner: H616: Add LRADC
To: Samuel Holland <samuel@sholland.org>, James McGregor <jamcgregor@protonmail.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Conor Dooley <conor+dt@kernel.org>, Andre Przywara <andre.przywara@arm.com>, 
	Hans de Goede <hdegoede@redhat.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2024 at 11:42=E2=80=AFPM Chen-Yu Tsai <wens@csie.org> wrote=
:
>
> On Fri, 26 Apr 2024 09:29:37 +0000, James McGregor wrote:
> > Version 2 moves the LRADC DT node to the right place. It was out of
> > order before.
> >
> > The Allwinner H616 series of SoCs have a low-rate ADC (LRADC) with
> > 6-bit resolution and one input channel. They're compatible with the
> > existing drivers, so it only needs to be enabled in the DT.
> >
> > [...]
>
> Applied to sunxi/dt-for-6.11 in sunxi/linux.git, thanks!
>
> [1/2] dt-bindings: input: sun4i-lradc-keys: Add H616 compatible
>       https://git.kernel.org/sunxi/linux/c/3086803a1f43
> [2/2] ARM: dts: sun50i: Add LRADC node
>       https://git.kernel.org/sunxi/linux/c/7adc2d68f4a6

I had to do a quick rebase as the branch start point was incorrect. The
commit hashes will have changed. Rest assured that the patch is indeed
merged.


ChenYu
