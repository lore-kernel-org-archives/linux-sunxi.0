Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D38131E4B
	for <linux-sunxi@lists.linux.dev>; Wed,  6 Mar 2024 15:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709737504; cv=none; b=WU4bKDQMW8DM3suNC5SNBqtI5CFlKsroiCRmV6S3VIXsN+FdH0Z/tRQHEO/WyeupftCjEUe+A49vXIpdCKtZjqI4uyXPOgLwUAXpHsebKio+/ctM04QGqekReq63QD4/vDsbR6pfcrsStG0jNf7IBI2XAMD+iTM/5ckl5B6S4ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709737504; c=relaxed/simple;
	bh=43GXM3Q8D5bmb35Ep8tlcjDpUea4lF28uw+na04zbs4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G0NQQ1Dr79QY6fhVtLqcTEUByxt/u4EZ/xKCG+kl0L+WFrWPDtdu6EiMIZ3opD9zPLjmQf+iEhF9Jabs0OpcesTu1HHUH/+9jxFBAqoghpQwd083yJO5d0TGIGMdHixgyzP5OiuIuMHD33Xwz84l/humotdmoj26pPSPdR61C7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wp5cZ7Wt; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wp5cZ7Wt"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d228a132acso12514171fa.0
        for <linux-sunxi@lists.linux.dev>; Wed, 06 Mar 2024 07:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709737500; x=1710342300; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43GXM3Q8D5bmb35Ep8tlcjDpUea4lF28uw+na04zbs4=;
        b=Wp5cZ7WtnlUC3Oj1kpoXBTCp3yorviv5PIKYCq1TGjlV3FbJNFkP0U6VzpRtuIrYan
         vn2udfrWW4TlBuUx/Gv9Z2Djm2miumj2D1bk/rQCgQQnET4zgrMr88XtnVKKLFSwqftY
         lEVZ50f1T3I7a37U96+N+A+F9SWtrE9rdW2VATbmS6pnLVuR3kkZAlmt3hWcEii4Ct0j
         5gSncRchrBoFp+wx1khdqIs5QrH31p2fbbEy2WmUydxHSpFb/2F0FDMfN6P1I68Hmq+I
         vXN5INyz/NDg6zgMhANL8653XZOr5BMG3MKsMv8Q+gkG5Tm76zz2YGCiA2jT64MM0g/D
         4u/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709737500; x=1710342300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=43GXM3Q8D5bmb35Ep8tlcjDpUea4lF28uw+na04zbs4=;
        b=P9J1fnF4x73zrVZmUmjCXlSsr003GcJ9d+fYh1msBDW7BFCW/rsC/UybMZILo5UdsN
         KZyKW2I2Zx2vR2MDnrj9f1GSoLNLGs+RnIcrq7n5zWtzNAHs9M2coxLeOAOYMYOyVvG3
         UDdAUS/JZbASF0C5EcAdTl1XPcSyK4O3Kwno2XaXkfQKoVD/bwOr7OkJwcKhfk33cwvE
         vHcekACsEg49gskPlynYgU/XpP/vbRy/Y0Br+onY6PynR1jcbetNup0awURZY8D3p5aK
         zs1oFOWWxnPgUWSDtzYPM0MLUITAfFvrLR8EuyjqlDh104uzrPI6sVb9rUJ0YJHBGnAg
         uAFg==
X-Forwarded-Encrypted: i=1; AJvYcCWxehOk2K8CKkC3fp5AdvJTl7ncZ343ANz5ZyFgWEXu6lIV1k7O33/JiFzEhFdvQSYsJr4wyhuSsPZkguzdELK+14Cg9vAKaE9eFwc=
X-Gm-Message-State: AOJu0Yyi2s6z8zVNlDrlGV5lI920Q/nLkF4/gqweZyJYs8VjlXp5r8MC
	o0BfhB9c5gGq9I4SJY7Nb0x1WFWU/IcKEp+kNW62DK6p6jgjMQamn3M9L/5HJeMIHTGCUhAWtII
	WQ0C+s3Nm+bvKm9g6ToUwxqDOISg=
X-Google-Smtp-Source: AGHT+IEEVeDiNEpHKSHTjKvhESMzneWqkwWwVGe8WoB74soHvGsOkOKPL5fYMktXsrfWue5FRmqbdFaGULj6kEl+Zug=
X-Received: by 2002:a2e:a99f:0:b0:2d3:87b:7e9e with SMTP id
 x31-20020a2ea99f000000b002d3087b7e9emr4317395ljq.39.1709737500066; Wed, 06
 Mar 2024 07:05:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240304-pinephone-pll-fixes-v3-0-94ab828f269a@oltmanns.dev> <20240304-pinephone-pll-fixes-v3-5-94ab828f269a@oltmanns.dev>
In-Reply-To: <20240304-pinephone-pll-fixes-v3-5-94ab828f269a@oltmanns.dev>
From: Erico Nunes <nunes.erico@gmail.com>
Date: Wed, 6 Mar 2024 16:04:47 +0100
Message-ID: <CAK4VdL0zWRg4hzUbuZsnabU53x3DrOiemH0tGnpbK9ECQvM1qg@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] arm64: dts: allwinner: a64: Run GPU at 432 MHz
To: Frank Oltmanns <frank@oltmanns.dev>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
	Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 4, 2024 at 6:01=E2=80=AFPM Frank Oltmanns <frank@oltmanns.dev> =
wrote:
>
> The Allwinner A64's GPU has currently three operating points. However,
> the BSP runs the GPU fixed at 432 MHz. In addition, at least one of the
> devices using that SoC - the pinephone - shows unstabilities (see link)
> that can be circumvented by running the GPU at a fixed rate.
>
> Therefore, remove the other two operating points from the GPU OPP table,
> so that the GPU runs at a fixed rate of 432 MHz.

In addition to all of this, the A64 user manual does say explicitly
that "dynamic frequency scaling is not supported" on PLL_GPU. So I
think this is really needed for a reliable GPU experience on A64.

Acked-by: Erico Nunes <nunes.erico@gmail.com>

Thanks

Erico
